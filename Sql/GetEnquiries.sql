CREATE PROC Getenquiries @date            DATETIME, 
                         @bMode           INT, 
                         @excepmtedStatus INT 
AS 
  BEGIN 
      SELECT * 
      FROM   enquiries 
      WHERE  Cast (time AS DATE) <= Cast(@date AS DATE) 
             AND bmode = @bmode 
             AND [status] != @excepmtedStatus 
  END 