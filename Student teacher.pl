student(john, cs101).
student(mary, cs101).
student(peter, cs102).
student(linda, cs103).
student(alex, cs102).

teacher(smith, cs101).
teacher(jones, cs102).
teacher(williams, cs103).

teaches_teacher(Teacher, Student) :-
    student(Student, SubCode),
    teacher(Teacher, SubCode).

students_of_teacher(Teacher, Student) :-
    teacher(Teacher, SubCode),
    student(Student, SubCode).
