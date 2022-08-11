
import 'dart:async';

import 'package:http/http.dart' as http;
import '../models/University.dart';

const UniversityAPI = 'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json';

Future<List<University>> getUniversity() async {
  var url = Uri.parse(UniversityAPI);
  var response = await http.get(url);
  
  print('Response status: ${response.statusCode}');
  print('response body: ${response.body}');

  return universityFromJson(response.body);

}