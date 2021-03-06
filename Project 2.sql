set SERVEROUT on
DECLARE
CURSOR cur_pres IS
SELECT * from presidents where 1900 BETWEEN beginterm and endterm; 
v_name VARCHAR(40);
v_lastn VARCHAR(40);
v_B NUMBER;
v_E NUMBER;

BEGIN
OPEN cur_pres;
LOOP
FETCH cur_pres INTO v_name,v_lastn,v_B,v_E;
EXIT WHEN cur_pres%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_name ||' '|| v_lastn ||' '|| v_B ||' '|| v_E);
END LOOP;
CLOSE cur_pres;
END;

set SERVEROUT ON
Declare
    v_name VARCHAR(40);
    v_year number;
    v_year2 number;
    v_l VARCHAR(40);
Begin
    Select firstname,lastname,beginterm ,endterm
    into v_name ,v_l,v_year , v_year2 
    from presidents where beginterm - ENDTERM = 0;
    dbms_output.put_line(v_name);
    dbms_output.put_line(v_l);
    dbms_output.put_line(v_year);
    dbms_output.put_line(v_year2);
END;

set SERVEROUT on
DECLARE
CURSOR cur_pres IS
select count(firstname) from presidents where  ENDTERM - beginterm > 4;
v_con NUMBER;

BEGIN
OPEN cur_pres;
LOOP
FETCH cur_pres INTO v_con;
EXIT WHEN cur_pres%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_con);
END LOOP;
CLOSE cur_pres;
END;

set SERVEROUT on
DECLARE
CURSOR cur_pres IS
SELECT s1.firstname, s1.lastname
FROM presidents s1
INNER JOIN presidents s2 ON s1.lastname = s2.lastname;
v_name VARCHAR(40);
v_lastn VARCHAR(40);

BEGIN
OPEN cur_pres;
LOOP
FETCH cur_pres INTO v_name,v_lastn;
EXIT WHEN cur_pres%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_name ||' '|| v_lastn);
END LOOP;
CLOSE cur_pres;
END;

set SERVEROUT on
DECLARE
CURSOR cur_pres IS
select avg(endterm - beginterm) AS AVARAGE from presidents where beginterm > 1900;
v_avg NUMBER;

BEGIN
OPEN cur_pres;
LOOP
FETCH cur_pres INTO v_avg;
EXIT WHEN cur_pres%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_avg);
END LOOP;
CLOSE cur_pres;
END;

set SERVEROUT on
DECLARE
CURSOR cur_pres IS
select * from presidents where beginterm BETWEEN (select beginterm from presidents where endterm = 1889) and (select beginterm from presidents where endterm = 1897);
v_name VARCHAR(40);
v_lastn VARCHAR(40);
v_B NUMBER;
v_E NUMBER;

BEGIN
OPEN cur_pres;
LOOP
FETCH cur_pres INTO v_name,v_lastn,v_B,v_E;
EXIT WHEN cur_pres%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_name ||' '|| v_lastn ||' '|| v_B ||' '|| v_E);
END LOOP;
CLOSE cur_pres;
END;
