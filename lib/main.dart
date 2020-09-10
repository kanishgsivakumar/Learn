import 'package:flutter/material.dart';
import 'package:learn/ui/appbar.dart';
import 'package:learn/ui/coursecard.dart';
import 'package:learn/ui/todoscreen.dart';
import 'package:learn/class/class.dart';
import 'package:learn/ui/notificationcard.dart';

void main() => runApp(App());


class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Blackboard";
  @override
  Widget build(BuildContext context) {
    final Brightness brightnesval =MediaQuery.of(context).platformBrightness;
    bool isDark = brightnesval ==Brightness.dark;

    return MaterialApp(
      theme:ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,

         
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
                return course_card(context,index,isDark);
               },
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 16),
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                return notificaton_card(context,index,isDark);
               },
              ),
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
            backgroundColor:Colors.blueAccent[200],
            icon: Icon(Icons.assignment),
            tooltip: "TO-DO List",
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
          labelColor: isDark? Colors.blue[400]:Colors.blue,
          unselectedLabelColor:isDark? Colors.white:Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: isDark? Colors.blue[400]:Colors.blue,
        ),)
        ),
      ),
    );
  }
}
