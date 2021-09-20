import 'package:flutter/foundation.dart';
import 'package:wallpaper/Model/Catogerydata.dart';

String apiKEY = "[API_KEY]";

List<Catogrydata> getCategories() {
  List<Catogrydata> categories = <Catogrydata>[];
  Catogrydata categorieModel = new Catogrydata();

  //
  categorieModel.imagurl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.ctgryname = "Street Art";
  categories.add(categorieModel);
  categorieModel = new Catogrydata();

  //
  categorieModel.imagurl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.ctgryname = "Wild Life";
  categories.add(categorieModel);
  categorieModel = new Catogrydata();

  //
  categorieModel.imagurl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.ctgryname = "Nature";
  categories.add(categorieModel);
  categorieModel = new Catogrydata();

  //
  categorieModel.imagurl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.ctgryname = "City";
  categories.add(categorieModel);
  categorieModel = new Catogrydata();

  //
  categorieModel.imagurl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categorieModel.ctgryname = "Motivation";

  categories.add(categorieModel);
  categorieModel = new Catogrydata();

  //
  categorieModel.imagurl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.ctgryname = "Bikes";
  categories.add(categorieModel);
  categorieModel = new Catogrydata();

  //
  categorieModel.imagurl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.ctgryname = "Cars";
  categories.add(categorieModel);
  categorieModel = new Catogrydata();

  return categories;
}
