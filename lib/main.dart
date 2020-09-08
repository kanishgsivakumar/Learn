import 'package:flutter/material.dart';
import 'package:learn/ui/appbar.dart';
import 'package:learn/ui/coursecard.dart';
import 'package:learn/ui/todoscreen.dart';
import 'package:learn/class/class.dart';


void main() => runApp(App());


class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage(title: "Blackboard")
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Learn";
  @override
  Widget build(BuildContext context) {
    final Brightness brightnesval =MediaQuery.of(context).platformBrightness;
    bool isDark = brightnesval ==Brightness.dark;

    return MaterialApp(
      theme:ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,

         
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: isDark?Colors.black:null,
          appBar:appBar(context,title,isDark),
          body: TabBarView( 
            children: [
              ListView.builder(
                padding: EdgeInsets.only(top: 16),
                physics: BouncingScrollPhysics(),
                itemCount: mycourses.length,
                
                itemBuilder: (BuildContext context, int index) {
                return card(context,index,isDark);
               },
              ),
              Container(alignment: Alignment.center,child:Text("No New Notifications")),
            ],
          ),
          
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              Navigator.push(
              context, 
            MaterialPageRoute(
              builder: (context) => ToDoPage()
          )
          );
            },
            icon: Icon(Icons.assignment),
            label: Text("To Do"),
          ),
          bottomNavigationBar:  BottomAppBar(
            
            shape:AutomaticNotchedShape(RoundedRectangleBorder(),StadiumBorder(side:BorderSide())),
            notchMargin: 4.0,
            child: TabBar( 
            tabs: [
            Tab(
              text: "Courses",
            ),
            Tab(
              text: "Notifications",
            ),
          ],
          labelColor: isDark? Colors.tealAccent:Color(0xff128c7e),
          unselectedLabelColor:isDark? Colors.white:Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: isDark? Colors.tealAccent:Color(0xff128c7e),
        ),)
        ),
      ),
    );
  }
}
