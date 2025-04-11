create database AcademicSystem;
use AcademicSystem;

create table Grade(
	Code varchar(5) not null,
    Course varchar(30) not null,
    Cycle int not null,
    constraint primary key (Code)
);

create table Subject(
	CodeGrade varchar(5) not null,
    NomSubject varchar(40) not null,
    constraint primary key (CodeGrade),
    constraint fk_Grade_Subject foreign key (CodeGrade) references Grade(Code) on delete cascade
);

create table Student(
	RA varchar(7) not null,
    Nom varchar(40) not null,
    BirthDate date not null,
    Context text not null,
    CodeGrade varchar(5) null,
    constraint primary key (RA),
    constraint fk_Grade_Student foreign key (CodeGrade) references Grade(Code) on delete set null
);

create table Exam(
	Code int not null,
    Synopsis text null,
    Score float not null,
    Term int not null,
    Mean float not null,
    ExamDate date not null,
    constraint primary key (Code)
);

create table StudentGetsExam(
	RAStudent varchar(7) not null,
    CodeExam int not null,
    Score float null,
    constraint primary key (RAStudent, CodeExam),
    constraint fk_Student_Gets foreign key (RAStudent) references Student(RA) on delete restrict,
    constraint fk_Exam_Gets foreign key (CodeExam) references Exam(Code) on delete restrict
);
