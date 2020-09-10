import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn/class/class.dart';
import 'package:flutter_youtube/flutter_youtube.dart';



class CoursePage extends StatefulWidget {
  final int index ;
  CoursePage({Key key,
    @required this.index
  }):super(key:key);
  @override
  _CoursePageState createState() => _CoursePageState(index: index);
}

class _CoursePageState extends State<CoursePage> {

  final int index ;
  _CoursePageState({Key key,
    @required this.index
  });
  final api_key = "AIzaSyAVs71T8Ac3P7LFSoGEa_48u8e9T941BxU";



  void playYoutubeVideo(String id) {
    FlutterYoutube.onVideoEnded.listen((onData) {
      
    });

    FlutterYoutube.playYoutubeVideoById(
      apiKey:api_key,
      videoId: id,
      appBarColor: Colors.black,
      fullScreen: true
    );

  }



  @override
  Widget build(BuildContext context) {
    final Brightness brightnesval =MediaQuery.of(context).platformBrightness;
    bool isDark = brightnesval ==Brightness.dark;
    return DefaultTabController(
        length: 3,
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
                    title: Hero(
              tag : 'coursename'+index.toString(),
              child:Text(mycourses[index].subject,
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
              )
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
               TabBar(
                 
                tabs: <Widget>[
                Tab(
                  text:"Lectures"
                ),
                Tab(
                  text:"Classwork"
                ),
                Tab(
                  text:"Wall"
                ),
              ],
              labelColor: isDark? Colors.blueAccent:Colors.white,
              unselectedLabelColor:isDark? Colors.white:Colors.white70,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: isDark? Colors.blueAccent:Colors.white,
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
                  itemCount: mycourses[index].v_list.length ,
                  itemBuilder:(context,count){
                    return ListTile(
                       leading: Icon(Icons.play_circle_outline,
                       color: isDark?Colors.blueAccent:Colors.blue,
                       size: 36,
                       ),
                       title: Text(mycourses[index].v_list[count].name,
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
                           Text((mycourses[index].v_list[count].dur).toString()+" Minutes",
                           style: TextStyle(
                             color: isDark?Colors.white70: Colors.black54,
                           ),
                           ),
                         ],
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       ),
                       onTap:() {playYoutubeVideo(mycourses[index].v_list[count].id);}
                     );

                  }
                  )
              ),
              Container(
                alignment: Alignment.center,
                child:Text("YAY! No Work Due")
              ),
              Container(
                alignment: Alignment.center,
                child:Text("No Posts Yet")
              )
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