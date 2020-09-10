import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/class/class.dart';


Widget notificaton_card(BuildContext context ,int index,bool isDark){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12,vertical:8),
    child: GestureDetector(
      onTap: (){
       /* Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => CoursePage(index:index)
          )
          );*/
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: isDark ? Colors.white30 : Colors.black54),
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        padding: EdgeInsets.all(8),
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
                    width:350,
                    padding: EdgeInsets.only(top:8,bottom: 8),
                    alignment: Alignment.centerLeft,
                    child : Hero(
                      tag: 'coursename'+index.toString(),
                      child:Text("Semester 4 results are out",
                      overflow: TextOverflow.fade,
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
                    Container(
                      padding: EdgeInsets.only(top:8,bottom: 8),
                      width: 350,
                      child: Text("Since the exams took place last month, we are happy to announce the results",
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(
                        color: isDark? Colors.white60:Colors.black54 ,
                    ),
                    )
                    )
                  ],
                ),
              ]
            ),
            Row(
            children: [
              Text("Management REC"),
              Text("Today , 9.32 pm")
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
          ],

        ),
      )
    )
  );
}