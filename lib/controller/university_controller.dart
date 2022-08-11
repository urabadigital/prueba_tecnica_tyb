
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:tyba/models/university.dart';
import '../repository/university_repository.dart';

class UniversityController extends ControllerMVC {
  factory UniversityController([StateMVC? state]) => _this ??= UniversityController._(state);
  UniversityController._(StateMVC? state) : this.scaffoldKey = new GlobalKey<ScaffoldState>(), super(state);
  static UniversityController? _this;
  List<University> university = <University>[];

  late GlobalKey<ScaffoldState> scaffoldKey;


  void listenForUniversity() async {
    university = (await getUniversity()).cast<University>();
    setState(() {
      // ignore: unnecessary_statements
      university;
    });
  }

  /*void listenForUniversity() async {
    final Stream<University> stream = (await getUniversity()) as Stream<University>;
    stream.listen((University _university) {
      setState(() {
        university.add(_university);
      });
    }, onError: (a) {
      print('Error de conexion');
    }

    );

  }*/


}