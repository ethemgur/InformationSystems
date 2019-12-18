for s in "create_table" "create_index" "Student" "Instructor" "Course" "CompanyContact" "Project" "Groups" "GroupParticipant" "Assignment" "Submission"; do
  echo "$s.sql is executed!"
  sqlite3 final_project.db < src/$s.sql
done
