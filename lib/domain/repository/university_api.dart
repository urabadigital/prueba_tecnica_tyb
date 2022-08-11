import 'package:tyba/domain/model/university.dart';

abstract class UniversityApi {
  Future<List<University>> getUniversitys();
}
