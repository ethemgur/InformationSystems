for s in "create_table" "create_index" "Student" "Instructor" "Groups" "GroupParticipant" "Course" "CompanyContact" "Project" "Assignment" "Submission"; do
  echo "$s.sql is executed!"
  sqlite3 final_project.db < src/$s.sql
done
