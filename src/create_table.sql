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
  StudentEmail Varchar(40) NOT NULL UNIQUE,
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
  Title Varchar(20) NOT NULL,
  Email Varchar(30) NOT NULL UNIQUE,
  Phone Number Int(10) NOT NULL UNIQUE,
  PRIMARY KEY (ContactID)
);

CREATE TABLE Groups (
  GroupID Int(3) NOT NULL,
  FinalGrade Varchar(2),
  Ranking Int(3),
  ProjectID INTEGER,
  PRIMARY KEY (GroupID),
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

CREATE TABLE Course (
  CourseID Int(7) NOT NULL,
  Semester Varchar(6) NOT NULL,
  Department Varchar(4) NOT NULL,
  Faculty Varchar(4) NOT NULL,
  PRIMARY KEY (CourseID)
);

CREATE TABLE Assignment (
  AssignmentID Int(4) NOT NULL,
  AssignmentName Varchar(20) NOT NULL,
  DeadlineDate Date NOT NULL,
  Percentage Int(2) NOT NULL CHECK(Percentage >= 0 AND Percentage <= 100),
  CourseID INTEGER NOT NULL,
  PRIMARY KEY (AssignmentID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Project (
  ProjectID Int(7) NOT NULL,
  Subject Varchar(50) NOT NULL,
  Description Varchar(500) NOT NULL,
  Status Boolean NOT NULL,
  InstructorID INTEGER NOT NULL,
  CourseID INTEGER NOT NULL,
  ContactID INTEGER,
  PRIMARY KEY (ProjectID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
  FOREIGN KEY (ContactID) REFERENCES CompanyContact(ContactID),
  FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

CREATE TABLE Submission (
  SubmissionID Int(4) NOT NULL,
  SubmissionDate Date NOT NULL,
  Grade Int(3) CHECK(Grade >= 0 AND Grade <= 100),
  Lateness Boolean NOT NULL,
  GroupID INTEGER NOT NULL,
  AssignmentID INTEGER NOT NULL,
  PRIMARY KEY (SubmissionID),
  FOREIGN KEY (GroupID) REFERENCES Groups(GroupID) ON DELETE CASCADE,
  FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID) ON DELETE CASCADE
);

