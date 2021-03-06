
SET SERVEROUT ON
CREATE OR REPLACE PROCEDURE Ins_us(
p_name IN OUT users.name%TYPE,
p_id OUT users.id%TYPE,
p_salary OUT users.salary%TYPE) IS
p_i NUMBER;
p_s NUMBER;
BEGIN 
SELECT id , salary
INTO p_id , p_salary
FROM users
where name = p_name;
IF p_id = NULL THEN 
    UPDATE users
    SET id = &id
    WHERE name = p_name;
END IF;
IF p_id != NULL THEN
    UPDATE users
    SET id = &id
    WHERE name = p_name;
END IF;

EXCEPTION 
WHEN NO_DATA_FOUND THEN 
INSERT INTO users(id,name,salary)
VALUES(&id , &name , &salary);
DBMS_OUTPUT.PUT_LINE('INSERTED');
END;
/

DECLARE 
v_name users.name%TYPE;
v_id users.id%TYPE;
v_salary users.salary%TYPE;
BEGIN
v_name := &name;
Ins_us(v_name,v_id,v_salary);
DBMS_OUTPUT.PUT_LINE('NAME : ' || v_name || ' ID : ' || v_id || ' SALARY : ' || v_salary );
END;



CREATE TABLE users1(
id NUMBER,
NAME VARCHAR(255),
ISACTIVE NUMBER DEFAULT 1
);


SET SERVEROUT ON
CREATE OR REPLACE PROCEDURE Ins_us1(
p_name IN OUT users1.name%TYPE,
p_id OUT users1.id%TYPE,
p_AC OUT users1.isactive%TYPE) IS
BEGIN 
SELECT id , isactive
INTO p_id , p_AC
FROM users1
where name = p_name;
IF p_AC = 0 THEN
    DELETE
    FROM users1
    where name = p_name;
ELSE
    UPDATE users1
    SET isactive = 0
    WHERE name = p_name;
END IF;

EXCEPTION 
WHEN NO_DATA_FOUND THEN 
DBMS_OUTPUT.PUT_LINE('not working');
END;
/

DECLARE 
v_name users1.name%TYPE;
v_id users1.id%TYPE;
v_AC users1.isactive%TYPE;
BEGIN
v_name := &name;
Ins_us1(v_name,v_id,v_AC);
DBMS_OUTPUT.PUT_LINE('works!' );
END;





Set SERVEROUT ON
CREATE OR REPLACE PROCEDURE Break_even_point(
p_m IN NUMBER) IS
p_BREAK NUMBER;
p_am NUMBER;
p_id NUMBER;
p_ex NUMBER;
p_price NUMBER;
BEGIN
SELECT amount
into p_ex
from EXPENSES
where MONTH = p_m;
select id , price
INTO p_id , p_price
from PRODUCT
where name = 'Cheese';
Select amount
INTO p_am
from TRANSACTION , product
WHERE product_id = product.id;
DBMS_OUTPUT.PUT_LINE('The break-even point is : ' || (p_ex + (p_am * p_price))/100);
END;
/


DECLARE 
v_month NUMBER;
BEGIN
v_month := &month;
Break_even_point(v_month);
END;



SELECT ROWNUM , TRUNC(SYSDATE + ROWNUM) dt
  FROM DUAL CONNECT BY ROWNUM < 72 ;

