import 'dart:convert';

List<University> universityFromJson(String str) =>
  List<University>.from(json.decode(str).map((x) => University.fromJson(x)));

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

  final String alphaTwoCode;
  final List<String> domains;
  final String country;
  final String stateProvince;
  final List<String> webPages;
  final String name;

  factory University.fromJson(dynamic json) => University(
        alphaTwoCode: json['alpha_two_code'],
        domains: List<String>.from(json["domains"].map((x) => x)),
        country: json['country'],
        stateProvince: json['state-province'] ?? '',
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json['name']
      );
  

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