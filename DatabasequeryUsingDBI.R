library(DBI)
conn <- dbConnect(RSQLite::SQLite(), "university.db")
dbListTables(conn)

library(dplyr)

student_db <- tbl(conn, "Student")
grade_db <- tbl(conn, "Grade")
course_db <- tbl(conn, "Course")

q1 <- grade_db %>% filter(course_id == "ST101")
q1

show_query(q1)

q2 <- inner_join(student_db, grade_db) %>% 
  filter(course_id == "ST101") %>% 
  select(name) %>% 
  arrange(name)
q2

show_query(q2)

#Try these queries...
#Specifies what columns you wish to join by

q2b <- inner_join(student_db, grade_db, by="student_id") %>% 
  filter(course_id == "ST101") %>% 
  select(name) %>%
  arrange(desc(name))
q2b

# Getting courses taken by ava smith or freddie harris
q3 <- inner_join(student_db, grade_db, by = "student_id") %>%
  inner_join(course_db, by = "course_id", suffix = c(".student",".course")) %>%
  filter(name.student == 'Ava Smith' | name.student == 'Freddie Harris') %>% 
  select(name.course) %>%
  distinct()
q3

#What happens if you don't specify suffixes?
inner_join(student_db, grade_db, by = "student_id") %>%
  inner_join(course_db, by = "course_id")

# calculating average mark for each course
q4 <- grade_db %>% 
  group_by(course_id) %>%
  summarize(avg_mark = mean(final_mark, na.rm = TRUE))
q4