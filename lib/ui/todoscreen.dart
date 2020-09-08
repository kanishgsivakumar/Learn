import 'package:flutter/material.dart';
import 'package:learn/class/class.dart';





Icon workcodeparser(int code,isDark){
  IconData icon;
  Color color = isDark? Colors.blueAccent:Colors.blue;
  switch (code) {
    case 1:
      icon  = Icons.assignment;
      break;
    case 2:
      icon =  Icons.assignment_late;
      color = isDark? Colors.redAccent:Colors.red;
      break;
    case 5:
      icon = Icons.assignment_returned;
      color = isDark? Colors.redAccent:Colors.red;
      break;
    default:
  }
  return Icon(icon,
    size: 36,
    color:color,
     );
}


class ToDoPage extends StatefulWidget {
  ToDoPage({Key key}) : super(key: key);

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  @override
  Widget build(BuildContext context) {
    final Brightness brightnesval =MediaQuery.of(context).platformBrightness;
    bool isDark = brightnesval ==Brightness.dark;
    return DefaultTabController(
        length: 2,
        child:Scaffold(
          backgroundColor: isDark?Colors.black:Colors.white,
        body:NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: isDark? Colors.black: Colors.blue,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                    title: Text("ToDo List",
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: isDark?Colors.white: Colors.white,
                      ),
                    ), 
              
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
               TabBar(
                 
                tabs: <Widget>[
                Tab(
                  text:"Pending"
                ),
                Tab(
                  text:"Completed"
                ),
              ],
              labelColor: isDark? Colors.blueAccent:Colors.white,
              unselectedLabelColor:isDark? Colors.white:Colors.white70,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: isDark? Colors.blue:Colors.white,
              ),
              isDark
              ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Container(
                child:ListView.builder(
                  itemCount: mywork.length,
                  itemBuilder:(context,count){
                    return ListTile(
                       leading: workcodeparser(mywork[count].code, isDark),
                       title: Text(mywork[count].name,
                       style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                        color: isDark?Colors.white: Colors.black,
                        ),
                       ),
                       subtitle: Row(
                         children: [
                           Text(mycourses[mywork[count].sub_code].subject,
                           style: TextStyle(
                             color: isDark?Colors.white70: Colors.black54,
                           ),
                           ),
                           Text("Due Aug 20",
                            style: TextStyle(
                             color: isDark?Colors.white70: Colors.black54,
                           ),
                           )
                         ],
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       )
                       ,
                     );

                  }
                  )
              ),
              Container(
                child:ListView.builder(

                  itemCount: 1,
                  itemBuilder:(context,count){
                    return ListTile(
                       leading: Icon(Icons.assignment_turned_in,color: isDark?Colors.greenAccent:Colors.green,size: 36,),
                       title: Text("Assignment 1",
                       style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                        color: isDark?Colors.white: Colors.black,
                        ),
                       ),
                       subtitle: Row(
                         children: [
                           Text("Embedded Design"),
                           Text("Due Aug 20")
                         ],
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       )
                       ,
                     );
                  }
                  )
              ),
 
              
            ],
          ),
        )
        )
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar,this.isDark);

  final TabBar _tabBar;
  final bool isDark;
  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child:Container(
        child: _tabBar,
        color: isDark? Colors.black: Colors.blue,
        ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}