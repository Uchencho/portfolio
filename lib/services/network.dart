import 'dart:convert';

import 'package:portfolio/services/util.dart';
import 'package:portfolio/utilities/const.dart';

import 'package:http/http.dart' as http;

class Portfolio {
  Future<ProjectResponse> getProjectReponse() async {
    var url = Uri.https(kBaseURL, '/api/project');
    Map<String, String> headers = {"content-type": "application/json"};
    print('Making request to route: $url with headers: $headers');

    http.Response resp = await http.get(url, headers: headers);
    if (resp.statusCode == 200) {
      var jsonData = jsonDecode(resp.body);
      print('Received response: $jsonData');
      var unMarshalledResp = ProjectResponse.fromJson(jsonData);
      return unMarshalledResp;
    } else {
      print('Invalid response received, expected 200 got ${resp.statusCode}');
      ProjectResponse emptyResponse = ProjectResponse();
      return emptyResponse;
    }
  }
}
