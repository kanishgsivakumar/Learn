import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';


class Videoplayer extends StatefulWidget {
  @override
  _VideoplayerState createState() => new _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  TextEditingController textEditingControllerUrl = new TextEditingController();
  TextEditingController textEditingControllerId = new TextEditingController();

  @override
  initState() {
    super.initState();
  }
  final api_key = "AIzaSyAVs71T8Ac3P7LFSoGEa_48u8e9T941BxU";

  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: api_key,
      videoUrl: "https://www.youtube.com/watch?v=wgTBLj7rMPM",
    );
    
  }

  void playYoutubeVideoEdit() {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey:api_key,
      videoUrl: textEditingControllerUrl.text,
    );
  }

  void playYoutubeVideoIdEdit() {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoById(
      apiKey: api_key,
      videoId: textEditingControllerId.text,
    );
  }

  void playYoutubeVideoIdEditAuto() {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoById(
        apiKey:api_key,
        videoId: textEditingControllerId.text,
        autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Youtube Player'),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  controller: textEditingControllerUrl,
                  decoration:
                      new InputDecoration(labelText: "Enter Youtube URL"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text("Play Video By Url"),
                    onPressed: playYoutubeVideoEdit),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text("Play Default Video"),
                    onPressed: playYoutubeVideo),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextField(
                  controller: textEditingControllerId,
                  decoration: new InputDecoration(
                      labelText: "Youtube Video Id (wgTBLj7rMPM)"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text("Play Video By Id"),
                    onPressed: playYoutubeVideoIdEdit),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text("Auto Play Video By Id"),
                    onPressed: playYoutubeVideoIdEditAuto),
              ),
            ],
          ),
        ),
      ),
    );
  }
}