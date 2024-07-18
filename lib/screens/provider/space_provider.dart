import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/model_data.dart';



class SpaceProvider with ChangeNotifier {
  List<SpaceType> spaceType = [];
  List<SpaceType> favourites = [];


  Future<void> loadAstronomicalObjects() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('spacetype');

    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      spaceType = jsonList
          .map((jsonItem) => SpaceType.fromJson(jsonItem))
          .toList();
      notifyListeners();
    }
 }



  Future<void> saveAstronomicalObjects(List<SpaceType> objects) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString =
    json.encode(objects.map((object) => object.toJson()).toList());
    await prefs.setString('spacetype', jsonString);
    spaceType = objects;
    notifyListeners();
  }

  Future<void> addToFavourites(SpaceType object) async {
    if (!favourites.contains(object)) {
      favourites.add(object);
      notifyListeners();
      await saveFavourites();
    }
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('favourites');

    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      favourites = jsonList
          .map((jsonItem) => SpaceType.fromJson(jsonItem))
          .toList();
      notifyListeners();
    }
  }

  Future<void> saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString =
    json.encode(favourites.map((object) => object.toJson()).toList());
    await prefs.setString('favourites', jsonString);
  }
}
