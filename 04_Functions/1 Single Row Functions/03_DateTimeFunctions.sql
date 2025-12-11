/*
Common Date and Time Functions


SYSDATE(): Returns the current date and time of the system.

NOW(): Returns the current date and time.

LOCALTIME(): Returns the current local date and time.

CURRENT_DATE(): Returns the current date.

CURDATE(): Returns the current date.

CURRENT_TIME(): Returns the current time.

CURTIME(): Returns the current time.
*/

-- Using SYSDATE() 
SELECT SYSDATE() AS current_date_time; 

-- Using NOW() 
SELECT NOW() AS current_date_time; 

-- Using LOCALTIME() 
SELECT LOCALTIME() AS current_date_time;

-- Using CURRENT_DATE() 
SELECT CURRENT_DATE() AS current_date; 

-- Using CURDATE() 
SELECT CURDATE() AS current_date;

-- Using CURRENT_TIME()  
SELECT CURRENT_TIME() AS current_time;  

 -- Using CURTIME()   
SELECT CURTIME() AS current_time;