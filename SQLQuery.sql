---CREATE DATABASE--
CREATE DATABASE COLLEGE;
USE COLLEGE;

--CREATE TABLE----

CREATE TABLE Student(
ID int identity primary key,
NAME varchar(30) not null,
CONTACT varchar(30) not null,
ADDRESS varchar(30) not null,
BRANCH varchar(30) not null);

SELECT * FROM Student;

CREATE TABLE Course(
COURSE_ID int not null,
COURSE varchar(30) not null,
DURATION varchar(30));

SELECT * FROM Course;

-----INSERT VALUES TO TABLE--

INSERT INTO Student(NAME,CONTACT,ADDRESS,BRANCH) VALUES ('VIJAYA','9553945607','6/72 VIZAG','COMPUTER SCIENCE'),
('HARSHA','9675347896','7/89 HYDERABAD','ELECTRONICS'),
('AARNA','9553945607','8/56 VIJAYAWADA','CIVIL'),
('LOKESH','9553945607','3/79 VIZAG','MECHANICAL');

INSERT INTO Course(COURSE_ID,COURSE,DURATION) VALUES ('1','COMPUTER SCIENCE','6Months'),
('2','ELECTRONICS','1YEAR'),
('3','CIVIL','3YEARS'),
('4','MECHANICAL','4YEARS');

----------------JOINS----------


--Inner Join

SELECT ST.NAME, CS.COURSE FROM Student ST JOIN Course CS ON ST.ID = CS.COURSE_ID

--Left Join

SELECT ST.NAME, CS.COURSE FROM Student ST LEFT JOIN Course CS ON ST.ID = CS.COURSE_ID

--Right Join

SELECT ST.NAME, CS.COURSE FROM Student ST RIGHT JOIN Course CS ON ST.ID = CS.COURSE_ID

--Full Join

SELECT ST.NAME, CS.COURSE FROM Student ST FULL JOIN Course CS ON ST.ID = CS.COURSE_ID

--Cross Join

SELECT ST.NAME, CS.COURSE FROM Student ST  CROSS JOIN Course CS 

SELECT * FROM Student;
SELECT * FROM Course;


---------SUB QUERY-----
SELECT NAME, BRANCH FROM Student WHERE BRANCH IN ('CIVIL');

SELECT NAME, BRANCH FROM Student WHERE BRANCH NOT IN ('CIVIL');

---------INDEXES-----

CREATE INDEX idx_NAME
ON Student (NAME);

INSERT INTO Student(NAME,CONTACT,ADDRESS,BRANCH)
VALUES ('LAXMI','8765432876','6/72 KARNATAKA','AUTOMOBILE');

CREATE INDEX idx_BRANCH
ON Student (BRANCH);

INSERT INTO Student(NAME,CONTACT,ADDRESS,BRANCH)
VALUES ('SITA','8765432876','6/72 KARNATAKA','NONIT');

INSERT INTO Student(NAME,CONTACT,ADDRESS,BRANCH)
VALUES ('RADHA','8765432876','6/72 KARNATAKA','NONIT');

CREATE UNIQUE INDEX index_name ON Student (NAME);

INSERT INTO Student(NAME,CONTACT,ADDRESS,BRANCH)
VALUES ('RADHA','8765432876','6/72 KARNATAKA','NONIT');


SELECT * FROM Student;


---------VIEWS-----

CREATE VIEW Student_View AS SELECT NAME, BRANCH FROM Student;

SELECT * FROM Student_View;

CREATE VIEW COURSE_VIEW AS SELECT COURSE, DURATION FROM  Course WHERE DURATION = COURSE;

SELECT * FROM COURSE_VIEW;

-------------FUNCTIONS-----

SELECT COURSE, COUNT(COURSE) AS Couse FROM Course GROUP BY COURSE

---------Stored Procedure-----

CREATE PROCEDURE SP_stud (@NAME varchar(30),@CONTACT varchar(30),@ADDRESS varchar(30),@BRANCH varchar(30))
AS
BEGIN
SET NOCOUNT ON; 
INSERT INTO Student([NAME],[CONTACT],[ADDRESS],[BRANCH]) VALUES (@NAME,@CONTACT,@ADDRESS,@BRANCH)
END
GO

EXEC [dbo].[SP_stud] @NAME ='JYOTHI',@CONTACT ='8765498765',@ADDRESS ='7/98 SINDHANUR',@BRANCH ='MECHANICAL';
GO

SELECT * FROM Student;


---------NORMALISATION---------
-- Creating One to One Relation

ALTER TABLE Course ADD CONSTRAINT FK_Course FOREIGN KEY(NAME) REFERENCES Student(ID) ON DELETE CASCADE;

DELETE FROM Student WHERE Name='VIJAYA'


CREATE TABLE CourseID(
 STUDENT_ID varchar(30) not null,
FACULTY varchar(30));

SELECT *FROM CourseID;

CREATE TABLE FACULTY(
 FACULTY_ID varchar(30) not null,
FACULTY_NAME varchar(30));

SELECT *FROM FACULTY;

INSERT INTO CourseID(STUDENT_ID, FACULTY) VALUES ('1','HOD'), ('2', 'LECTURE'),
('3', 'ASSOCIATEPROFESSOR'), ('4', 'CLASSINCHARGE');

INSERT INTO FACULTY(FACULTY_ID, FACULTY_NAME) VALUES ('1','VIJAYA'), ('2', 'HARSHA'),
('3','AARNA'), ('4', 'LAXMI')

ALTER TABLE CourseID ADD CONSTRAINT FK_CourseID FOREIGN KEY(STUDENT_ID) REFERENCES Student(ID) ON DELETE CASCADE;