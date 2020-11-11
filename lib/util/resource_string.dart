import 'dart:convert';

import 'package:flutter/services.dart';


class ResourceString {

  factory ResourceString() {
    return _singleton;
  }

  static final ResourceString _singleton = ResourceString._internal();
     ResourceString._internal() {
       loadString();
       print("Instance created ResourceString");
  }

   Map<String, String> _localizedStrings;


     Future<String> loadString() async {
    // Load the language JSON file from the "lang" folder
    String jsonString = await rootBundle.loadString('assets/lang/strings.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

   String getString(String key) {
    return _localizedStrings[key];
  }
}