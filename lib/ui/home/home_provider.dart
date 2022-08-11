// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:tyba/domain/model/university.dart';
import 'package:tyba/domain/repository/university_api.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({
    required this.universityApi,
  });
  final UniversityApi universityApi;

  List<University>? universityList;
  List<University>? searchList;
  final debouncer = Debouncer();

  Future<void> loadUniversitys() async {
    universityList = await universityApi.getUniversitys();
    _setInitialList();
    notifyListeners();
  }

  void _setInitialList() {
    searchList = List<University>.from(universityList ?? []);
  }

  void searchUniversity(String filter) {
    debouncer.execute(() {
      final filterLowercase = filter.toLowerCase();
      if (filter == "") {
        _setInitialList();
      } else {
        searchList = List<University>.from(
          universityList!.where((element) => element.name.toLowerCase().contains(filterLowercase),
          ),
        );
      }
      notifyListeners();
    });
  }
}

class Debouncer {
  Timer? timer;

  void execute(VoidCallback action) {
    timer?.cancel();
    timer = Timer(const Duration(milliseconds: 500), action);
  }
}
