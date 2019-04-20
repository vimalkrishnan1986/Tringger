ALTER PROCEDURE Shiftpendingtasks @loginId INT, 
                                  @date    DATETIME 
AS 
  BEGIN 
      DECLARE @Remarks NVARCHAR(max); 

      IF( Object_id('tempdb..#pendingTaks') IS NOT NULL ) 
        BEGIN 
            DROP TABLE #pendingtaks 
        END 

      IF( Object_id('tempdb..#taskmaster') IS NOT NULL ) 
        BEGIN 
            DROP TABLE #taskmaster 
        END 

      SELECT t1.* 
      INTO   #pendingtaks 
      FROM   time_sheet_master t1 
             JOIN staff_master t2 
               ON t1.staff_name = t2.staff_id 
      WHERE  ( t1.staff_name = @loginId 
                OR t2.[level] = 101 ) 
             AND [status] IN( 1, 2, 6 ) 
             AND Cast(task_date AS DATE) < Cast(@date AS DATE) 

      SELECT t.* 
      INTO   #taskmaster 
      FROM   task_master t 
             INNER JOIN #pendingtaks b 
                     ON b.task_id = t.task_id; 

      BEGIN TRANSACTION 

      BEGIN try 
          INSERT INTO replans 
                      (timesheetid, 
                       lastdate, 
                       lasttime) 
          SELECT time_sheet_id, 
                 task_date, 
                 start_time 
          FROM   #pendingtaks 

          UPDATE t 
          SET    t.task_date = @date, 
                 t.remarks = @Remarks, 
                 t.replan = 'r' 
          FROM   time_sheet_master t 
                 INNER JOIN #pendingtaks b 
                         ON t.time_sheet_id = b.time_sheet_id; 

          UPDATE r 
          SET    r.taskid = t.task_id, 
                 r.tasklastdate = t.[start_date] 
          FROM   replans r 
                 INNER JOIN #pendingtaks pt 
                         ON pt.time_sheet_id = r.timesheetid 
                            AND r.lastdate = pt.task_date 
                            AND r.lasttime = pt.start_time 
                 INNER JOIN #taskmaster t 
                         ON t.task_id = pt.task_id 

          UPDATE tm 
          SET    tm.start_date = Dateadd(day, 1, tm.start_date), 
                 tm.end_date = Dateadd(day, 1, tm.end_date) 
          FROM   task_master tm 
                 INNER JOIN #taskmaster t 
                         ON t.task_id = tm.task_id 
      END try 

      BEGIN catch 
          IF @@TRANCOUNT > 0 
            ROLLBACK TRANSACTION; 

          RAISERROR (15600,-1,-1,'Shiftpendingtasks'); 
      END catch 

      IF @@TRANCOUNT > 0 
        COMMIT TRANSACTION 
  END 