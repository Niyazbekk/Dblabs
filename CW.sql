CREATE TRIGGER tot_sal
AFTER DELETE OR INSERT OR UPDATE OF dno, salary ON E1 
  FOR EACH ROW BEGIN 
   IF DELETING OR (UPDATING AND :old.dno != :new.dno) 
   THEN UPDATE D1 
	SET total_sal = total_sal - :old.salary 
	WHERE dno = :old.dno; 
   END IF; 
   IF INSERTING OR (UPDATING AND :old.dno != :new.dno) 
   THEN UPDATE D1 
    SET total_sal = total_sal + :new.salary 
    WHERE dno = :new.dno; 
   END IF; 
   IF (UPDATING AND :old.dno = :new.dno AND 
	  :old.salary != :new.salary ) 
   THEN UPDATE D1 
    SET total_sal = total_sal - :old.salary + :new.salary 
   WHERE dno = :new.dno; 
  END IF; 
 END;
