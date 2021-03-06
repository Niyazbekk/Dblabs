set serveroutput on


INSERT INTO ships (name, yearLaunched, country, numGuns , gunSize , displacement)
VALUES ('Shimakaze' , 1942 , 'JP' , 9 , 16 , 33000);



set serveroutput on

Declare
    v_name VARCHAR(40);
    v_year number;
Begin
    select name , yearlaunched
    into v_name ,v_year 
    from ships where gunsize = 16 AND yearlaunched < 1930;
    dbms_output.put_line(v_name);
    dbms_output.put_line(v_year);
END;

set serveroutput on

Declare
    v_name VARCHAR(40);
    v_year number;
    v_gun_size number;
Begin
    select name , yearlaunched , gunsize
    into v_name ,v_year , v_gun_size
    from ships where gunsize = (select max(gunsize) from ships);
    dbms_output.put_line(v_name);
    dbms_output.put_line(v_year);
    dbms_output.put_line(v_gun_size);
END;


set serveroutput on

Declare
    v_name VARCHAR(40);
    v_year number;
    v_gun_size number;
Begin
    select name , yearlaunched , gunsize
    into v_name ,v_year , v_gun_size
    from ships s1 where 2 = (select count(*) from ships s2 where s1.gunsize <= s2.gunsize);
    dbms_output.put_line(v_name);
    dbms_output.put_line(v_year);
    dbms_output.put_line(v_gun_size);
END;


DECLARE
    Cursor emp_cur IS 
        select avg(gunsize) ,country from ships group by country;
BEGIN
     DBMS_OUTPUT.PUT_LINE('a');
END;

set serveroutput on
DECLARE
    v_name1 VARCHAR(40);
    v_name2 VARCHAR(40);
BEGIN
    SELECT DISTINCT s1.country, s2.country
    INTO v_name1 ,v_name2
    FROM battles b1
    JOIN ships s1
    ON s1.name = b1.ship
    JOIN battles b2
    ON b2.battle_name = b1.battle_name
    JOIN ships s2
    ON s2.name = b2.ship
    WHERE s1.country > s2.country
    ORDER BY s1.country, s2.country;
    dbms_output.put_line(v_name1);
    dbms_output.put_line(v_name2);
END;



SELECT country,SUM(CASE WHEN result_b = 'sunk' THEN 1 ELSE 0 END) AS TotalShipSunk 
FROM ships 
INNER JOIN battles ON ships.name=battles.ship 
WHERE battle_Name='Surigao Strait'
GROUP BY country;



DECLARE
    Cursor emp_cur IS 
        SELECT country,SUM(CASE WHEN result_b = 'sunk' THEN 1 ELSE 0 END) AS TotalShipSunk 
        FROM ships 
        INNER JOIN battles ON ships.name=battles.ship 
        WHERE battle_Name='Surigao Strait'
        GROUP BY country;
BEGIN
     DBMS_OUTPUT.PUT_LINE('a');
END;
