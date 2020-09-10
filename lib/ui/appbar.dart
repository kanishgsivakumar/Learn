import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:learn/ui/elistscreen.dart';
import 'package:learn/ui/my_flutter_app_icons.dart';

Widget CircleImage(String url,double size) {
  return Container(
      padding: EdgeInsets.all(4),
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 2),
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.scaleDown, image: ExactAssetImage(url))));
}

void showAccountselector(context){
    final Brightness brightnesval =MediaQuery.of(context).platformBrightness;
    bool isDark = brightnesval ==Brightness.dark;
    Color textcolor =  isDark?Colors.white:Colors.black;
    
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            color: isDark?Colors.black87:Colors.white,
            child: Wrap(
            children: <Widget>[
              ListTile(
                leading: CircleImage('assets/kanishg.jpg', 45),
                title: Text("Kanishga S Sivakumar",style: TextStyle(color: textcolor),),
                subtitle: Text("+91 90870 70001",style: TextStyle(color: textcolor),),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.add_circle_outline,color:isDark?Colors.white70:Colors.black45,),
                title: Text("Add Another Account",
                style: TextStyle(
                  color:isDark?Colors.white70:Colors.black54,
                ),
                ),
                onTap: (){},
              )
            ],
          ),
          );
      }
    );
}

Widget appBar(BuildContext context, String title,bool isDark){
return PreferredSize(
  preferredSize: Size.fromHeight(50),
  child: AppBar(//backgroundColor: ,

  //backgroundColor: isDark? Color(0x121212): Colors.teal,
  title: Row(children: <Widget>[
    /*GestureDetector(
    child: Container(
      child:CircleImage("assets/kanishg.jpg", 35),
      padding: EdgeInsets.only(right: 12)
      ),
      onTap: (){
        showAccountselector(context);
      },
      ),*/
  Text(title,style: TextStyle(fontFamily: "Sans"),)],),
  actions: <Widget>[
    IconButton(
      icon:Icon(MyFlutterApp.edit),
      
      tooltip: "Tests",
      onPressed: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
           builder: (context) => ElistPage()
          )
        );
      }),

    PopupMenuButton(itemBuilder: (BuildContext){
      return <PopupMenuItem>[
        PopupMenuItem(child: Text("Join Class"),),
        PopupMenuItem(child: Text("Create Class"),),
        PopupMenuItem(child: Text("Settings"),),
        ];},
      
      ),
    ],
  ),
) ;
}