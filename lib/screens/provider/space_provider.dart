
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../model/model_data.dart';

class SpaceProvider with ChangeNotifier {
  List<SpaceModal> jsonData = [];

  Future<void> convert(List<dynamic> data) async {
    jsonData = data.map((item) => SpaceModal.fromJson(item)).toList();
    notifyListeners();
  }

}
