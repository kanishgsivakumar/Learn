import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/class/class.dart';
import 'coursescreen.dart';

Widget card(BuildContext context ,int index,bool isDark){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12,vertical:8),
    child: GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => CoursePage(index:index)
          )
          );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: isDark ? Colors.white30 : Colors.black54),
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        padding: EdgeInsets.all(8),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children : <Widget>[
                  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                    width: 300,
                    child : Hero(
                      tag: 'coursename'+index.toString(),
                      child:Text(mycourses[index].subject,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                        color: isDark?Colors.white: Colors.black,
                      ),
                    ),
                     )
                    ),
                    Text(mycourses[index].name +" " +mycourses[index].section,
                    style: TextStyle(
                      color: isDark? Colors.white60:Colors.black54 ,
                    ),
                    )
                  ],
                ),
              ]
            ),
            Text(mycourses[index].teacher)
          ],

        ),
      )
    )
  );
}