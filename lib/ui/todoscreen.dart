import 'package:flutter/material.dart';
import 'package:learn/class/class.dart';

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
  Work(code: 2, name: "Assignment 1", sub_code: 3, due_date: 22, due_month: 5, due_year: 2020),
];
 

Icon workcodeparser(int code,isDark){
  IconData icon;
  Color color = isDark? Colors.tealAccent:Colors.teal;
  switch (code) {
    case 1:
      icon  = Icons.assignment;
      break;
    case 2:
      icon =  Icons.assignment_late;
      color = isDark? Colors.redAccent:Colors.red;
      break;
    case 5:
      icon = Icons.assessment;
      break;
    default:
  }
  return Icon(icon,
    size: 40,
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
                backgroundColor: isDark? Colors.black: Colors.teal,
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
              labelColor: isDark? Colors.tealAccent:Colors.white,
              unselectedLabelColor:isDark? Colors.white:Colors.white70,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: isDark? Colors.tealAccent:Colors.white,
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
                  padding: EdgeInsets.only(top: 24),
                  itemCount: mywork.length,
                  itemBuilder:(context,count){
                    return GestureDetector(
                     child :Container(
                       alignment: Alignment.center,
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: isDark ? Colors.white30 : Colors.black54),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child:Row(
                        children: <Widget>[
                          Padding(
                            child:workcodeparser(mywork[count].code, isDark),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget>[
                            Flexible(
                            child:Text(
                              mywork[count].name,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              color: isDark?Colors.white: Colors.black,
                              ),
                            ),
                          
                            ),
                            Text(mycourses[mywork[count].sub_code].subject,
                            style: TextStyle(
                                color: isDark?Colors.white70: Colors.black54
                            ),
                            ),
                            

                            
                            ])
                        ],
                      ),
                      
                     ),
                     onTap: (){
                        
                     },
                    );
                  }
                  )
              ),
              Container(
                child:ListView.builder(
                  padding: EdgeInsets.only(top: 24),
                  itemCount: 1,
                  itemBuilder:(context,count){
                    return GestureDetector(
                     child :Container(
                       alignment: Alignment.center,
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: isDark ? Colors.white30 : Colors.black54),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child:Row(
                        children: <Widget>[
                          Padding(
                            child:Icon(Icons.assignment_turned_in,size:40,color:isDark?Colors.tealAccent:Colors.teal),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget>[
                            Flexible(
                            child:Text(
                              "Assignment 1",
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              color: isDark?Colors.white: Colors.black,
                              ),
                            ),
                          
                            ),
                            Text("Embedded System Design",
                            style: TextStyle(
                                color: isDark?Colors.white70: Colors.black54
                            ),
                            ),
                            

                            
                            ])
                        ],
                      ),
                      
                     ),
                     onTap: (){
                        
                     },
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
        color: isDark? Colors.black: Colors.teal,
        ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}