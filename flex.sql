Create Database flex2;
Use flex2;


Create Table Users(

UserID int Primary key IDENTITY(1,1),
Username Varchar(50) NOT NULL,
Password Varchar(50) NOT NULL,
FirstName Varchar(50) NOT NULL,
LastName Varchar(50) NOT NULL,
DOB date NOT NULL,

);




DROP TABLE Users

drop table Students

Create Table Students(

RollNumber Varchar(50) Primary key,
CurrentSemester varchar(50),
userID int NOT NULL,
Foreign Key (userID) References Users(UserID)

);

ALTER TABLE Students
ADD CONSTRAINT FK_Students 
FOREIGN KEY (userID)
REFERENCES dbo.[Users](UserID);


drop table Faculty

Create Table Faculty(

FacultyID Varchar(50) Primary key,
userID int NOT NULL,
Foreign Key (userID) References Users(UserID),
Campus Varchar(255)

);

ALTER TABLE Faculty
ADD CONSTRAINT FK_Faculty 
FOREIGN KEY (userID)
REFERENCES dbo.[Users](UserID);



Create Table AcademicOfficer(

AcademicOfficerID Varchar(50) Primary key,
userID int NOT NULL,
Foreign Key (userID) References Users(UserID)

);



EXEC sp_rename 'Academic Officer', 'AcademicOfficer';

EXEC sp_rename 'User', 'Users';



ALTER TABLE AcademicOfficer
ADD CONSTRAINT FK_AcademicOfficer
FOREIGN KEY (userID)
REFERENCES dbo.[Users](UserID);



Create Table Courses(

CourseID INT primary key IDENTITY(1,1),
CourseCode Varchar(50) NOT NULL,
Cdescription Varchar(100) NOT NULL,
CreditHours Int NOT NULL,
SemesterOffered Varchar(20) NOT NULL,
PreRequisiteID INT,
Foreign key(PreRequisiteID) References Courses(CourseID)

);

DROP TABLE Courses

UPDATE Courses
SET PreRequisiteID = NULL
WHERE PreRequisiteID = 'NULL';

ALTER TABLE Courses
ALTER COLUMN PreRequisiteID TINYINT;

ALTER TABLE Courses
ADD CONSTRAINT FK_Course
FOREIGN KEY (PreRequisiteID)
REFERENCES Courses(CourseID);



CREATE TABLE OfferedCourse (
    
	OfferedCourseID  INT PRIMARY KEY IDENTITY(1,1),
    courseID INT NOT NULL,
    Semester VARCHAR(50) NOT NULL,
    FOREIGN KEY (courseID) REFERENCES Courses(CourseID)
);

DROP TABLE OfferedCourse;

ALTER TABLE OfferedCourse
ADD CONSTRAINT FK_OfferedCourse
FOREIGN KEY (CourseID)
REFERENCES Courses(CourseID);

drop table Section

Create Table Section(

SectionID int Primary key,
SectionName Varchar(10) NOT NULL,
facultyID Varchar(50) NOT NULL,
offeredcourseId INT NOT NULL,
Foreign key (facultyID) References Faculty(FacultyID),
Foreign key (offeredcourseId) References OfferedCourse(OfferedcourseID)

);

ALTER TABLE Section
ADD CONSTRAINT FK_Section
FOREIGN KEY (facultyID)
REFERENCES Faculty(FacultyID);

ALTER TABLE Section
ADD CONSTRAINT FK_Section2
FOREIGN KEY (offeredcourseId)
REFERENCES OfferedCourse(OfferedCourseID);

drop table StudentSection

CREATE TABLE StudentSection (

    StudentSectionID INT PRIMARY KEY IDENTITY(1,1),
    StudentID Varchar(50) NOT NULL,
    SectionId INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(RollNumber),
    FOREIGN KEY (SectionID) REFERENCES Section(SectionID)
);

ALTER TABLE StudentSection
ADD CONSTRAINT FK_StudentSection
FOREIGN KEY (StudentID)
REFERENCES Students(RollNumber);

ALTER TABLE StudentSection
ADD CONSTRAINT FK_StudentSection2
FOREIGN KEY (SectionID)
REFERENCES Section(SectionID);

drop table Evaluation

CREATE TABLE Evaluation (

    EvaluationID INT PRIMARY KEY,
    SectionId INT NOT NULL,
    EvaluationType VARCHAR(50) NOT NULL,
    Weightage INT NOT NULL,
    FOREIGN KEY (SectionId) REFERENCES Section(SectionID)
);

ALTER TABLE Evaluation
ADD CONSTRAINT Fk_Evaluation
FOREIGN KEY (SectionId)
REFERENCES Section(SectionID);

Create Table Marks(

MarksID INT Primary key,
rollNumber Varchar(50) NOT NULL,
evaluationID Int NOT NULL,
Score INT NOT NULL,
TotalMarks INT DEFAULT 100,
Foreign key (evaluationID) References Evaluation(EvaluationID),
Foreign key (rollNumber) References Students(RollNumber)

);

DROP TABLE Marks

ALTER TABLE Marks
ADD CONSTRAINT FK_Marks
FOREIGN KEY (evaluationID)
REFERENCES Evaluation(EvaluationID);

ALTER TABLE Marks
ADD CONSTRAINT FK_Marks2
FOREIGN KEY (rollNumber)
REFERENCES Students(RollNumber);

drop table Feedback

Create Table FeedBack(

FeedbackID Int Primary key IDENTITY(1,1),
facultyID Varchar(50) NOT NULL,
rollNumber Varchar(50) NOT NULL,
FeedbackFormData varchar(MAX) NOT NULL,
Foreign key (facultyID) References Faculty(FacultyID),
Foreign key (rollNumber) References Students(RollNumber)

);

ALTER TABLE Feedback
ADD CONSTRAINT FK_Feedback
FOREIGN KEY (facultyID)
REFERENCES Faculty(FacultyID);

ALTER TABLE Feedback
ADD CONSTRAINT FK_Feedback2
FOREIGN KEY (rollNumber)
REFERENCES Students(RollNumber);

CREATE TABLE FeedbackQuestion (
    QuestionID INT PRIMARY KEY IDENTITY(1,1),
    QuestionText VARCHAR(255) NOT NULL
);

DROP TABLE FeedbackQuestion

CREATE TABLE FeedbackResponse (
    ResponseID INT PRIMARY KEY IDENTITY(1,1),
    FeedbackID INT NOT NULL,
    QuestionID INT NOT NULL,
    Rating INT NOT NULL,
    FOREIGN KEY (FeedbackID) REFERENCES Feedback(FeedbackID),
    FOREIGN KEY (QuestionID) REFERENCES FeedbackQuestion(QuestionID)
);

DROP TABLE FeedbackResponse

ALTER TABLE FeedbackResponse
ADD CONSTRAINT FK_FeedbackResponse
FOREIGN KEY (FeedbackID)
REFERENCES Feedback(FeedbackID);

ALTER TABLE FeedbackResponse
ADD CONSTRAINT FK_FeedbackResponse2
FOREIGN KEY (QuestionID)
REFERENCES FeedbackQuestion(QuestionID);

Create Table Attendance(

AttendanceID Int Primary key IDENTITY(1,1),
Percentage Int NOT NULL,
Status VARCHAR(50) NOT NULL,
Date DATE NOT NULL,
AttendanceDate date NOT NULL,
rollNumber Varchar(50) NOT NULL,
SectionId INT NOT NULL,
Foreign key (SectionId) References Section(SectionID),
Foreign key (rollNumber) References Students(RollNumber)

);

DROP TABLE Attendance

ALTER TABLE Attendance
ADD CONSTRAINT FK_Attendance
FOREIGN KEY (SectionId)
REFERENCES Section(SectionID);

ALTER TABLE Attendance
ADD CONSTRAINT FK_Attendance2
FOREIGN KEY (rollNumber)
REFERENCES Students(RollNumber);

drop table Grades

CREATE TABLE Grades (
    GradeID INT PRIMARY KEY IDENTITY(1,1),
    StudentSectionID INT NOT NULL,
    Grade VARCHAR(5) NOT NULL,
    FOREIGN KEY (StudentSectionID) REFERENCES StudentSection(StudentSectionID)
);

ALTER TABLE Grades
ADD CONSTRAINT FK_Grades
FOREIGN KEY (StudentSectionID)
REFERENCES StudentSection(StudentSectionID);




select * from users where username = '21i-0200'


SELECT * FROM Marks
WHERE Rollnumber NOT IN (SELECT RollNumber FROM Students);


select * from FeedbackResponse

select * from courses


SELECT c.CourseID, c.CourseCode, c.Cdescription, c.CreditHours,c.Semester_Offered , c.PreRequisiteID 
                        FROM Faculty f
                        JOIN Section s ON f.FacultyID = s.facultyID
                        JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
                        JOIN Courses c ON oc.courseID = c.CourseID
                        WHERE f.FacultyID = 'FAC001'


		SELECT e.EvaluationID, e.Weightage, m.Score, m.TotalMarks
        FROM Marks m
        INNER JOIN Evaluation e ON m.evaluationID = e.EvaluationID
        INNER JOIN Section s ON e.SectionId = s.SectionID
        INNER JOIN OfferedCourse oc ON s.offeredcourseId = oc.OfferedCourseID
        INNER JOIN StudentSection ss ON s.SectionID = ss.SectionId
        WHERE ss.StudentID = '21i-2559' AND e.EvaluationType = 'Quiz' AND oc.CourseID = CourseID

		select * from StudentSection
		select* from Section
		select* from OfferedCourse
		select* from marks
		select* from Evaluation
		select* from Courses
		select* from Students


UPDATE Marks
Set evaluationID = 5 Where evaluationID = 3

UPDATE OfferedCourse
Set Semester='4' where Semester = 'fall'


SELECT m.*, e.EvaluationType
FROM Marks m
JOIN Evaluation e ON m.evaluationID = e.EvaluationID
WHERE e.EvaluationType = 'Midterm2' AND m.rollNumber = '21i-0203';


select * from users



INSERT INTO Users VALUES
(51, '21i-2559', '12345', 'Malaika', 'Hussain', '2001-01-01')

INSERT INTO Students VALUES
('21i-2559', '5', 51)

INSERT INTO Courses VALUES
(49, 'CS101', 'Introduction to Programming', 3, 'First', NULL)

INSERT INTO OfferedCourse VALUES
(49,'Fall',49)

INSERT INTO Section VALUES
(51, 'A', 'FAC001', 49)

INSERT INTO StudentSection VALUES
(51,'21i-2559', 51)

INSERT INTO Evaluation VALUES
(51, 51, 'Quiz', 3),
(52, 51, 'Midterm', 15),
(53, 51, 'Final', 40),
(54, 51, 'Assignment', 4),
(55, 51, 'Midterm', 15);


INSERT INTO Marks VALUES

(36, '21i-2559', 51, 10,10),
(37, '21i-2559', 52, 45,60),
(38, '21i-2559', 53, 70,100),
(39, '21i-2559', 54, 67,100),
(40, '21i-2559', 55, 5,10);


select* from OfferedCourse
 

 SELECT C.CourseCode, C.Cdescription, C.CreditHours, OC.Semester 
                FROM Courses C
                INNER JOIN OfferedCourse OC ON C.CourseID = OC.courseID
                WHERE OC.Semester = 'fall' 
                AND (C.PreRequisiteID IS NULL OR C.PreRequisiteID IN (
                    SELECT OC2.courseID 
                    FROM StudentSection SS
                    INNER JOIN Section S ON SS.SectionID = S.SectionID
                    INNER JOIN OfferedCourse OC2 ON S.offeredcourseId = OC2.OfferedCourseID
                    INNER JOIN Grades G ON SS.StudentSectionID = G.StudentSectionID
                    WHERE SS.StudentID = '21i-0200'
                    AND G.Grade <> 'F' -- only include courses that were not failed
                ))
                AND C.CourseID NOT IN (
                    SELECT OC2.courseID 
                    FROM StudentSection SS
                    INNER JOIN Section S ON SS.SectionID = S.SectionID
                    INNER JOIN OfferedCourse OC2 ON S.offeredcourseId = OC2.OfferedCourseID
                    WHERE SS.StudentID = '21i-0200')


				

				

					