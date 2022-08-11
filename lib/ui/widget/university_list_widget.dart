import 'package:flutter/material.dart';
import 'package:tyba/ui/widget/university_details.dart';
import '../../domain/model/university.dart';

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
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(university: widget.university)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).hintColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.university.name,
            style: Theme.of(context).textTheme.bodyText1?.merge(const TextStyle(fontWeight: FontWeight.bold)),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.university.webPages.first,
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.university.country,
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.university.domains.first,
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
          ),
        ]
      )    
    ),
    );
  }
}
