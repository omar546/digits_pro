import 'package:shared_preferences/shared_preferences.dart';

import '../components/constants.dart';



   void saveVariableToSharedPreferences(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);

  }

  void getSavedValueFromSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getInt(key) == null ){Shared.score = 0;}
    else{
    Shared.score =  prefs.getInt(key)!;
    }

  }
