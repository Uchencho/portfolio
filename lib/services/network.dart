import 'dart:convert';

import 'package:portfolio/utilities/const.dart';

import 'package:http/http.dart' as http;

class Portfolio {
  Future getProjects() async {
    var url = Uri.https(kBaseURL, '');
    print('Making request to route: $url');

    http.Response resp = await http.get(url);
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      print('Invalid response received, expected 200 got ${resp.statusCode}');
      return '';
    }
  }
}
