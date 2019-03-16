import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:movies/Models/SoundCloudModel.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SoundCloud track;

  final String url = "https://api.soundcloud.com/resolve.json?url=";
  final String clientID = "client_id=a549b13e0494aaec74fed484d567153b";
  bool isFetching = false;
  bool isDownloading = false;
  String link = "";
  String trackTitle = "";
  String format = "";
  String status = "";
  TextEditingController _trackURL = new TextEditingController();
  String progress = "";

  //Get Track Information--------------------
  Future<void> _getURI() async {
    try {
      setState(() {
        isFetching = true;
      });

      http.Response response =
          await http.get("${url}${_trackURL.text}&${clientID}");
      var body = response.body;
      var decodeJson = jsonDecode(body);
      track = SoundCloud.fromJson(decodeJson);

      setState(() {
        isFetching = false;
        status = "Fetching Done .. Wait For Downaloding";
        link =
            "https://api.soundcloud.com/tracks/${track.id}/stream?${clientID}";
        trackTitle = track.title;
        format = ".${track.originalFormat}";
      });

      await downloadTrack(link, trackTitle, format);
    } catch (e) {
      Toast.show(
        e.toString(),
        context,
        duration: 2,
        backgroundColor: Colors.red[300],
        textColor: Colors.black,
        gravity: Toast.BOTTOM,
      );
    }
  }
  //---------------------------------------

  //Download The Track --------------------
  Future<void> downloadTrack(
      String trackURL, String trackName, String format) async {
    try {
      Dio dio = Dio();

      var directory = await getApplicationDocumentsDirectory();
      print("${directory.path}/" + trackName + format);
      await dio.download(trackURL, "${directory.path}/" + trackName + format,
          onReceiveProgress: (rec, total) {
        setState(() {
          isDownloading = true;
          progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });

      setState(() {
        isDownloading = false;
        status = "Download Done ^_^";
      });
    } catch (e) {
      setState(() {
        isDownloading = false;
      });
      Toast.show(
        e.toString(),
        context,
        duration: 2,
        backgroundColor: Colors.red[300],
        textColor: Colors.black,
        gravity: Toast.BOTTOM,
      );
    }
  }
  //---------------------------------------

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar(),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: isDownloading
            ? downloading()
            : isFetching == true ? fetching() : centerColumn(),
      ),
    );
  }

//Initial Form

  Column centerColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.soundcloud,
          color: Colors.orangeAccent,
          size: 90.0,
        ),
        Text(
          "SoundCloud Downloader",
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 17.0,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "By X-SLAYER",
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: Text(
            status,
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

//Fetching Form

  Column fetching() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "Searching For The Track ...",
          style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
        )
      ],
    );
  }

//Downloading Form

  Column downloading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "Downloading Track ...",
          style: TextStyle(color: Colors.deepOrange),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          progress,
          style: TextStyle(color: Colors.deepOrange),
        ),
      ],
    );
  }

//Search BAR

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(100, 255, 255, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: TextFormField(
              controller: _trackURL,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Track URL",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black54),
                icon: IconButton(
                  onPressed: () {
                    _trackURL.text.isEmpty
                        ? Toast.show(
                            "Insert a Track URL",
                            context,
                            duration: 2,
                            gravity: Toast.BOTTOM,
                          )
                        : _getURI();
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
