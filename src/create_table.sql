CREATE TABLE Instructor (
  InstructorID Int(5) NOT NULL,
  FirstName Varchar(20) NOT NULL,
  LastName Varchar(20) NOT NULL,
  InstructorEmail Varchar(20) NOT NULL,
  PRIMARY KEY (InstructorID)
);

CREATE TABLE Student (
  StudentID Int(5) NOT NULL,
  FirstName Varchar(20) NOT NULL,
  LastName Varchar(20) NOT NULL,
  StudentEmail Varchar(40) NOT NULL,
  FirstMajor Varchar(20) NOT NULL,
  SecondMajor Varchar(20),
  PRIMARY KEY (StudentID)
);

CREATE TABLE GroupParticipant (
  GroupID INTEGER NOT NULL,
  StudentID INTEGER NOT NULL,
  FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
  FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE CompanyContact (
  ContactID Int(3) NOT NULL,
  CompanyName Varchar(30) NOT NULL,
  ContactName Varchar(40) NOT NULL,
  Department Varchar(20) NOT NULL,
  Title Varchar(20),
  Email Varchar(30) NOT NULL,
  Phone Number Int(10),
  PRIMARY KEY (ContactID)
);

CREATE TABLE Groups (
  GroupID Int(3) NOT NULL,
  NumberStudents Int(1),
  FinalGrade Int(3),
  Ranking Int(3),
  ProjectID INTEGER,
  PRIMARY KEY (GroupID),
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

CREATE TABLE Course (
  CourseID Varchar(7) NOT NULL,
  Semester Varchar(6) NOT NULL,
  Department Varchar(4) NOT NULL,
  Faculty Varchar(4) NOT NULL,
  PRIMARY KEY (CourseID)
);

CREATE TABLE Assignment (
  AssignmentID Int(4) NOT NULL,
  AssignmentName Varchar(20) NOT NULL,
  DeadlineDate Date NOT NULL,
  Percentage Int(2) NOT NULL,
  CourseID INTEGER NOT NULL,
  PRIMARY KEY (AssignmentID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Project (
  ProjectID Int(7) NOT NULL,
  Subject Varchar(20) NOT NULL,
  Description Varchar(200) NOT NULL,
  Status Boolean NOT NULL,
  CourseID INTEGER NOT NULL,
  ContactID INTEGER,
  InstructorID INTEGER NOT NULL,
  PRIMARY KEY (ProjectID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
  FOREIGN KEY (ContactID) REFERENCES Company(ContactID),
  FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

CREATE TABLE Submission (
  SubmissionID Int(4) NOT NULL,
  SubmissionDate Date NOT NULL,
  Grade Int(3),
  Lateness Boolean,
  GroupID INTEGER NOT NULL,
  AssignmentID INTEGER NOT NULL,
  PRIMARY KEY (SubmissionID),
  FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
  FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID)
);

