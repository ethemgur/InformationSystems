CREATE VIEW [INDR Student Projects] AS
SELECT Student.StudentID, Groups.GroupID, Project.Subject
FROM ((Student
INNER JOIN GroupParticipant ON GroupParticipant.StudentID = Student.StudentID)
INNER JOIN Groups ON Groups.GroupID = GroupParticipant.GroupID)
INNER JOIN Project ON Project.ProjectID = Groups.ProjectID
WHERE Student.FirstMajor = "INDR";

CREATE VIEW [Late Submissions] AS
SELECT Groups.GroupID
FROM Groups
INNER JOIN Submission ON Groups.GroupID = Submission.GroupID
WHERE Submission.Lateness = 1;
