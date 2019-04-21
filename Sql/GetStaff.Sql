CREATE PROC Getstaff @employeeId INT, 
                     @isadmin    BIT, 
                     @unit_id    VARCHAR(100) 
AS 
  BEGIN 
      IF @isadmin = 1 
        BEGIN 
            SELECT [staff_id], 
                   [staff_name], 
                   Cast(CASE @employeeId 
                          WHEN staff_id THEN 1 
                          ELSE 0 
                        END AS BIT) AS Checked 
            FROM   vw_active_staff_master 

            RETURN 
        END 

      SELECT [staff_id], 
             staff_name, 
             Cast (employee_code AS VARCHAR(100)) AS [Staff_Name], 
             Cast(1 AS BIT)                       AS Checked 
      FROM   vw_active_staff_master 
      WHERE  company_unit_name = @unit_Id 
             AND staff_id IN( @employeeId ) 
      UNION 
      SELECT [staff_id], 
             staff_name, 
             Cast (employee_code AS VARCHAR(100)) AS [Staff_Name], 
             Cast(0 AS BIT)                       AS Checked 
      FROM   vw_active_staff_master 
      WHERE  company_unit_name = @unit_Id 
             AND staff_id IN(SELECT Isnull(reporting_staff, 0) 
                             FROM   reporting_master 
                             WHERE  responsible_staff IN( @employeeId )); 
  END 