CREATE INDEX idx_InstructorEmail
ON Instructor (InstructorEmail);

CREATE INDEX idx_StudentEmail
ON Student (StudentEmail);

CREATE INDEX idx_ContactEmail
ON CompanyContact (Email);

CREATE INDEX idx_ContactPhone
ON CompanyContact (Phone);
