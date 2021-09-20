import 'package:flutter/material.dart';
import 'package:wallpaper/Model/RatingPhoto.dart';
import 'package:wallpaper/views/Imageview.dart';

Widget brandName() {
  return Row(
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87),
      )
    ],
  );
}

Widget wallpaperimage({required List<PhotosModel> photomodel, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: photomodel.map((e) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Imageview(imageurl: e.src.portrait)));
            },
            child: Hero(
              tag: e.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    e.src.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ));
        }).toList()),
  );
}
