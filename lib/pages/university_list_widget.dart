import 'package:flutter/material.dart';

import '../models/university.dart';

class UniversityListWidget extends StatefulWidget {
  const UniversityListWidget({Key? key, required this.heroTag, required this.university}) : super(key: key);

  final String heroTag;
  final University university;

  @override
  State<UniversityListWidget> createState() => _UniversityListWidgetState();
}

class _UniversityListWidgetState extends State<UniversityListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text(
        widget.university.name,
          style: Theme.of(context).textTheme.bodyText1,
          overflow: TextOverflow.ellipsis,
        ),
      ]
    );
  }
}
