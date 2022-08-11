import 'package:flutter/foundation.dart';
import 'package:tyba/data/university_analytics.dart';
import 'package:tyba/domain/model/university.dart';
import 'package:tyba/domain/repository/university_api.dart';
import 'package:http/http.dart' as http;

const universityAPI =
    'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json';

class UniversityRestService implements UniversityApi {
  final UniversityAnalytics universityAnalytics;

  UniversityRestService(this.universityAnalytics);

  @override
  Future<List<University>> getUniversitys() async {
    var url = Uri.parse(universityAPI);
    universityAnalytics.sendEvent('get list of universitys');
    var response = await http.get(url);
    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    return universityFromJson(response.body);
  }
}
