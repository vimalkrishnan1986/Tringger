CREATE PROC Getmenu @IsAdmin BIT , 
                    @loginId INT  
AS 
    DECLARE @modules TABLE 
      ( 
         module_name VARCHAR(max), 
         module_id   INT 
      ); 

  BEGIN 
      IF @IsAdmin = 1 
        BEGIN 
            INSERT INTO @modules 
            SELECT module_name, 
                   module_id 
            FROM   module_master 
            WHERE  is_active = 1 
                   AND module_name != 'Time Sheet Page' 
        END 
      ELSE 
        BEGIN 
            INSERT INTO @modules 
            SELECT module_name, 
                   module_id 
            FROM   module_master 
            WHERE  is_active = 1 
                   AND module_name != 'Time Sheet Page' 
                   AND module_id IN (SELECT module_name 
                                     FROM   sub_module 
                                     WHERE  [submodule_id] IN (SELECT 
                                            [sub_module_name] 
                                                               FROM 
                                            module_access_rights 
                                                               WHERE 
                                            staff_id = @loginId 
                                            AND is_active = 1)) 
        END 

      SELECT * 
      FROM   @modules 

      SELECT A.* 
      FROM   sub_module a 
             INNER JOIN @modules b 
                     ON b.module_id = A.module_name 
  END 