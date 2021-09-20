import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/Model/RatingPhoto.dart';
import 'package:wallpaper/Wdget/widget.dart';

class Categoryvie extends StatefulWidget {
  final String ctquery;

  const Categoryvie({Key? key, required this.ctquery}) : super(key: key);

  @override
  _CategoryvieState createState() => _CategoryvieState();
}

class _CategoryvieState extends State<Categoryvie> {
  var ctgryimage = <PhotosModel>[];
  @override
  void initState() {
    getSearchingimage(widget.ctquery);
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

        ctgryimage.add(photosModel);
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
        title: Text(widget.ctquery),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              wallpaperimage(photomodel: ctgryimage, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
