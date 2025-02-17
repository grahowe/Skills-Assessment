DROP TABLE STUDENTS; 

CREATE TABLE STUDENTS (
    Submission_ID NUMBER(10),
    Student_ID VARCHAR2(2),
    Submit_DATE DATE,          
    File_ID VARCHAR2(2),       

    CONSTRAINT PK_STUDENTS PRIMARY KEY (Submission_ID)
);

insert into STUDENTS values(1, 'S1', TO_DATE('2024-12-16', 'YYYY-MM-DD'), 'F2');
insert into STUDENTS values(2, 'S2', TO_DATE('2024-12-16', 'YYYY-MM-DD'), 'F1');
insert into STUDENTS values(3, 'S1', TO_DATE('2024-12-16', 'YYYY-MM-DD'), 'F1');
insert into STUDENTS values(4, 'S4', TO_DATE('2024-12-16', 'YYYY-MM-DD'), 'F4');
insert into STUDENTS values(5, 'S2', TO_DATE('2024-12-17', 'YYYY-MM-DD'), 'F3');
insert into STUDENTS values(6, 'S2', TO_DATE('2024-12-17', 'YYYY-MM-DD'), 'F2');
insert into STUDENTS values(7, 'S4', TO_DATE('2024-12-18', 'YYYY-MM-DD'), 'F1');
insert into STUDENTS values(8, 'S3', TO_DATE('2024-12-19', 'YYYY-MM-DD'), 'F2');
insert into STUDENTS values(9, 'S3', TO_DATE('2024-12-19', 'YYYY-MM-DD'), 'F8');

commit;

SELECT COUNT(Student_ID) AS num_students
FROM STUDENTS
WHERE Student_ID IN (
    SELECT Student_ID
    FROM STUDENTS
    GROUP BY Student_ID
    HAVING COUNT(Submit_DATE) > 1
);
