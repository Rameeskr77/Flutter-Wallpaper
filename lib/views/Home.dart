import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/Model/Catogerydata.dart';
import 'package:wallpaper/Model/RatingPhoto.dart';
import 'package:wallpaper/Reposatry/data.dart';
import 'package:wallpaper/Wdget/widget.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/views/Catogery.dart';
import 'package:wallpaper/views/Searchwallpaper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var catgrylist = <Catogrydata>[];
  var ratingimage = <PhotosModel>[];
  TextEditingController searchqry = new TextEditingController();
  @override
  void initState() {
    getRatingimage();
    catgrylist = getCategories();
    super.initState();
  }

  getRatingimage() async {
    await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=20&page=1"),
        headers: {
          "Authorization":
              "563492ad6f9170000100000184d7456ce0594b1a9153fea296db1150"
        }).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = PhotosModel.fromMap(element);
        ratingimage.add(photosModel);
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
        elevation: 2,
        title: Center(
            child: Text(
          "Wallpaper",
        )),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: searchqry,
                      decoration: InputDecoration(
                          hintText: "search wallpapers",
                          border: InputBorder.none),
                    )),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Searchwallpaper(
                                        searchQuary: searchqry.text,
                                      )));
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 80,
                padding: EdgeInsets.only(left: 5),
                child: ListView.builder(
                    itemCount: catgrylist.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Catogerytile(
                          imagurl: catgrylist[index].imagurl,
                          title: catgrylist[index].ctgryname);
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              wallpaperimage(photomodel: ratingimage, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

class Catogerytile extends StatelessWidget {
  final String? imagurl;
  final String? title;
  Catogerytile({required this.imagurl, required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categoryvie(
                      ctquery: title!.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imagurl ?? "",
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                title ?? "",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
