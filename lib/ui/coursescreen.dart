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
                  padding: EdgeInsets.only(top: 24),
                  itemCount: mycourses[index].v_list.length,
                  itemBuilder:(context,count){
                    return GestureDetector(
                     child :Container(
                       alignment: Alignment.center,
                      height: 120,
                      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: isDark ? Colors.white30 : Colors.black54),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            child:Icon(Icons.play_circle_outline,
                            size: 40,
                            color:isDark? Colors.blueAccent:Colors.blue,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget>[
                            Flexible(
                            child:Text(
                              mycourses[index].v_list[count].name,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              color: isDark?Colors.white: Colors.black,
                              ),
                            ),
                          
                            )
                            ])
                        ],
                      ),
                      )
                     ,
                     onTap: (){
                        playYoutubeVideo(mycourses[index].v_list[count].id);
                     },
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