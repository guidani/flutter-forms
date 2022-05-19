import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:forms/pages/filter-api/user_model.dart';

class FetchUser {
  var data = [];
  List<User> results = [];
  String urlList = 'https://jsonplaceholder.typicode.com/users/';

  Future<List<User>> getuser({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => User.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) =>
                  element.name.toLowerCase().contains((query.toLowerCase())))
              .toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
