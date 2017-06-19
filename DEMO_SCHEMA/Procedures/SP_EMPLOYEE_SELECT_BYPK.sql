CREATE OR REPLACE PROCEDURE demo_schema.SP_EMPLOYEE_SELECT_BYPK
     ( 
        p_EMPLOYEE_ID   IN   EMPLOYEES.EMPLOYEE_ID%type,                  
        p_JOB_ID           OUT  EMPLOYEES.JOB_ID%type, 
        p_LAST_NAME             OUT  EMPLOYEES.LAST_NAME%type, 
        p_FIRST_NAME            OUT  EMPLOYEES.FIRST_NAME%type, 
        p_DEPARTMENT_ID  OUT  EMPLOYEES.DEPARTMENT_ID %type, 
        p_eme_phone_number  OUT  EMPLOYEES.eme_phone_number %type, 
		p_employee_code OUT EMPLOYEES.employee_code%type              
     ) 
AS 
BEGIN  
    SELECT  
           JOB_ID                    , 
           LAST_NAME                      , 
           FIRST_NAME                     , 
		   DEPARTMENT_ID           ,
       eme_phone_number,
		   employee_code
    INTO   
           p_JOB_ID                    , 
           p_LAST_NAME                      , 
           p_FIRST_NAME                     , 
           p_DEPARTMENT_ID           ,
           p_eme_phone_number,
		   p_employee_code
    FROM   EMPLOYEES
    WHERE  EMPLOYEE_ID  = p_EMPLOYEE_ID  ; 

EXCEPTION 
        WHEN OTHERS THEN 
             RAISE_APPLICATION_ERROR (-20001, 
                                      p_EMPLOYEE_ID || ':$:' || SQLERRM, TRUE) ; 

END SP_EMPLOYEE_SELECT_BYPK ; 
/