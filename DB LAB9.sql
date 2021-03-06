1)



create table user_1(id number,name varchar(255));

CREATE OR REPLACE procedure cr_table 
(p_table IN CHAR,
p_table_old IN CHAR
) IS
    s_query varchar2(100);
    
BEGIN
    execute immediate 'ALTER TABLE user_1
       ADD (operation_date date,
       new_id number,
       new_name varchar(255),
       action varchar(255),
       actionauthor varchar(255));';
    s_query := 'CREATE TABLE ' + p_table + 'AS SELECT * FROM ' + p_table_old;
   execute immediate s_query;
END;
/

DECLARE 
p_table CHAR := 'user_1_log';
p_table_old CHAR := 'user_1' ;
BEGIN
cr_table(p_table,p_table_old);
END;



2)

CREATE OR REPLACE TRIGGER after_delete
AFTER DELETE
   ON user_1
   FOR EACH ROW
DECLARE
   v_username varchar2(10); 
   v_new_id number := 2;
BEGIN

   SELECT user INTO v_username
   FROM dual;   

   INSERT INTO user_1_log
   (id,
   name,
   operation_date,
   new_id ,
   new_name ,
   action ,
   actionauthor)
   VALUES
   ( :old.id,
     :old.name,
     sysdate,
     v_new_id,
     'John',
     'DELETE',
     v_username );     
END;

----------------------


CREATE OR REPLACE TRIGGER after_delete
AFTER INSERT
   ON user_1
   FOR EACH ROW
DECLARE
   v_username varchar2(10); 
   v_new_id number := 2;
BEGIN

   SELECT user INTO v_username
   FROM dual;   

   INSERT INTO user_1_log
   (id,
   name,
   operation_date,
   new_id ,
   new_name ,
   action ,
   actionauthor)
   VALUES
   ( :old.id,
     :old.name,
     sysdate,
     v_new_id,
     'John',
     'INSERT',
     v_username );     
END;

----------------------

CREATE OR REPLACE TRIGGER after_delete
AFTER UPDATE
   ON user_1
   FOR EACH ROW
DECLARE
   v_username varchar2(10); 
   v_new_id number := 2;
BEGIN

   SELECT user INTO v_username
   FROM dual;   

   INSERT INTO user_1_log
   (id,
   name,
   operation_date,
   new_id ,
   new_name ,
   action ,
   actionauthor)
   VALUES
   ( :old.id,
     :old.name,
     sysdate,
     v_new_id,
     'John',
     'UPDATE',
     v_username );     
END;


3)

CREATE TABLE dA_DDL (
name Varchar2(255),
id int
);
  
create or replace trigger d_ddl_trg 
after ddl on schema
begin
    insert into dA_ddl(name,id)
    values(
      'John',1
    );
end;
/
