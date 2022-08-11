import 'dart:convert';

List<University> universityFromJson(String str) => List<University>.from(json.decode(str).map((x) => University.fromJson(x)));

String universityToJson(List<University> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class University {
  University(
    {
      required this.alphaTwoCode,
      required this.domains,
      required this.country,
      required this.stateProvince,
      required this.webPages,
      required this.name,
    }
  );


  /*University.fromJson(Map<String, dynamic> jsonMap) {

    try {
      alphaTwoCode = jsonMap['alpha_two_code'];
      name = jsonMap['name'];

    } catch (e) {

    }
  }*/

  factory University.fromJson(dynamic json) {
    return University(
        alphaTwoCode: json['alpha_two_code'],
        domains: json['domains'] != null ? json['domains'].cast<String>() : [],
        country: json['country'],
        stateProvince: json['state-province'] ?? '',
        webPages: json['web_pages'] != null ? json['web_pages'].cast<String>() : [],
        name: json['name']);
  }

  String alphaTwoCode;
  List<String> domains;
  String country;
  dynamic stateProvince;
  List<String> webPages;
  String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alpha_two_code'] = alphaTwoCode;
    map['domains'] = domains;
    map['country'] = country;
    map['state-province'] = stateProvince;
    map['web_pages'] = webPages;
    map['name'] = name;
    return map;
  }

}