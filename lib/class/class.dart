
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
  Video({
    Key key,
    @required this.name,
    @required this.id
  });
}
final samplevideo = [
  Video(name: "Lecture 1 : Introduction", id:"TP1_F3IVjBc" ),
  Video(name: "Lecture 2 : Processors", id:"Lkk7h13s_jA" ),
  Video(name: "Lecture 3 : General Purpose Asic Processors", id:"docZGkYbruw" ),
  Video(name: "Lecture 4 : Designing Single Purpose Processor", id:"G_YfGR1yKSk" ),
  Video(name: "Lecture 5 : Optimization Issues", id:"V53wURxHQVQ" ),
  
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
