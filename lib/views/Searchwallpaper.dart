import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/Model/RatingPhoto.dart';
import 'package:wallpaper/Wdget/widget.dart';

class Searchwallpaper extends StatefulWidget {
  final String searchQuary;

  const Searchwallpaper({Key? key, required this.searchQuary})
      : super(key: key);

  @override
  _SearchwallpaperState createState() => _SearchwallpaperState();
}

class _SearchwallpaperState extends State<Searchwallpaper> {
  var searchimage = <PhotosModel>[];
  TextEditingController searchqry = new TextEditingController();
  @override
  void initState() {
    getSearchingimage(widget.searchQuary);
    super.initState();
  }

  getSearchingimage(String searchQuery) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$searchQuery&per_page=50&page=1"),
        headers: {
          "Authorization":
              "563492ad6f9170000100000184d7456ce0594b1a9153fea296db1150"
        }).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = PhotosModel.fromMap(element);
        searchimage.add(photosModel);
        //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.searchQuary),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     color: Color(0xfff5f8fd),
              //     borderRadius: BorderRadius.circular(30),
              //   ),
              //   margin: EdgeInsets.symmetric(horizontal: 24),
              //   padding: EdgeInsets.symmetric(horizontal: 24),
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //           child: TextField(
              //         controller: searchqry,
              //         decoration: InputDecoration(
              //             hintText: "search wallpapers",
              //             border: InputBorder.none),
              //       )),
              //       InkWell(
              //           onTap: () {
              //             setState(() {
              //               getSearchingimage(searchqry.text);
              //             });
              //           },
              //           child: Container(child: Icon(Icons.search)))
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 16,
              ),
              wallpaperimage(photomodel: searchimage, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
