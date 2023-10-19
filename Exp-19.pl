student(vamsi,'math').
student(rakesh,'physics').
teacher(mr_anwar,'math').
teacher(mr_ram,'physics').
subject_code(math,''CSA1050').
subject_code(physics,'UBA1125').
get_subject_code(Student,Code):-
    student(Student,Subject),
    subject_code(Subject,Code).
get_teacher(Student,Teacher):-
    student(Student,Subject),
    teacher(Teacher,Subject).

