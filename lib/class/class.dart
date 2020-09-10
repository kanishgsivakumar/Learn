
import 'package:flutter/material.dart';

class Course{
  final String name,section,subject,teacher,courseid;
  final v_list;
  Course({
    Key key,
    @required this.name,
    @required this.section,
    @required this.subject,
    @required this.teacher,
    @required this.courseid,
    this.v_list,
    
  });
}


class Video {
  final String name,id;
  final  bool watched = false;
  final int dur;
  Video({
    Key key,
    @required this.name,
    @required this.id,
    @required this.dur
  });
}
final samplevideo = [
  Video(name: "Lecture 1 : Introduction", id:"TP1_F3IVjBc",dur: 35),
  Video(name: "Lecture 2 : Processors", id:"Lkk7h13s_jA",dur : 45 ),
  Video(name: "Lecture 3 : General Purpose Asic Processors", id:"docZGkYbruw" ,dur: 45),
  Video(name: "Lecture 4 : Designing Single Purpose Processor", id:"G_YfGR1yKSk",dur: 45 ),
  Video(name: "Lecture 5 : Optimization Issues", id:"V53wURxHQVQ" ,dur: 45),
  
];
final mycourses = [
  Course(
    subject: "Embedded Systems Design",
    name: "ECE",
    section: "B",
    teacher: "Prof Anupam Basu",
    courseid: "001",
    v_list: samplevideo
  ),
  Course(
    subject: "Electronic Circuits - II",
    name: "ECE",
    section: "B",
    teacher: "Ms V.Yogalakshmi",
    courseid: "002",
    v_list: samplevideo
  ),
  Course(
    subject: "Communication Theory",
    name: "ECE",
    section: "B",
    teacher: "Dr T.Manikandan",
    courseid: "003",
    v_list: samplevideo
  ),
  Course(
    subject: "Linear Integerated Circuits",
    name: "ECE",
    section: "B",
    teacher: "Ms M.Tamilarasi",
    courseid: "004",
    v_list: samplevideo
  ),
  Course(
    subject: "Control System Engineering",
    name: "ECE",
    section: "B",
    teacher: "Ms B.Devi",
    courseid: "005",
    v_list: samplevideo
  ),
  Course(
    subject: "Electromagnetic Fields",
    name: "ECE",
    section: "B",
    teacher: "Dr M Sathish",
    courseid: "006",
    v_list: samplevideo
  ),
  Course(
    subject: "Circuit Design and Simulation Laboratory",
    name: "ECE",
    section: "B",
    teacher: "Ms G Saranya",
    courseid: "007",
    v_list: samplevideo
  ),
];

class Work{
  final int code,sub_code;
  final String name;
  final int due_date,due_month,due_year;
  Work({
    Key key,
    @required this.code,
    @required this.name,
    @required this.sub_code,
    @required this.due_date,
    @required this.due_month,
    @required this.due_year
  });

}

var mywork  = <Work>[
  Work(code: 5, name: "Assesment on Unit 1", sub_code: 1, due_date: 26, due_month: 05, due_year: 2020),
  Work(code: 1, name: "Assignment 2", sub_code: 3, due_date: 1, due_month: 06, due_year: 2020),
  Work(code: 1, name: "Assignment 3", sub_code: 3, due_date: 1, due_month: 06, due_year: 2020),
  Work(code: 2, name: "Assignment 1", sub_code: 3, due_date: 22, due_month: 5, due_year: 2020),
];
 