CREATE PROC Getprojects @unitId VARCHAR(100) 
AS 
  BEGIN 
      SELECT DISTINCT project_name, 
                      projectid 
      FROM   vw_timesheetandtaskmaster 
      WHERE  unit_id = @unitId 
             AND projectid IS NOT NULL 
      GROUP  BY project_name, 
                projectid 
      ORDER  BY projectid DESC 
  END 