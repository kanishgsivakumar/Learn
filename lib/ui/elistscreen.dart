import 'package:flutter/material.dart';
import 'package:learn/class/class.dart';







class ElistPage extends StatefulWidget {
  ElistPage({Key key}) : super(key: key);

  @override
  _ElistPageState createState() => _ElistPageState();
}

class _ElistPageState extends State<ElistPage> {

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
                    title: Text("Tests",
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
                  text:"Upcoming"
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
                  itemCount: 1,
                  itemBuilder:(context,count){
                    return ListTile(
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
                           Text("Oct 20, 9.00 AM",
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
                       title: Text("Assesment 1",
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