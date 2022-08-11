import 'package:flutter/material.dart';
import '../../domain/model/university.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.university}) : super(key: key);

  final University university;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Universidad'
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }
        )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              InkWell(
                onTap: (() {
                  
                }),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text('Subir Imagen', style: TextStyle(color: Theme.of(context).hintColor.withOpacity(0.5), fontWeight: FontWeight.bold))),
                ),
              ),
              SizedBox(height: 20),
              Text(widget.university.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 5),
              Text(widget.university.domains.first),
              SizedBox(height: 5),
              Text(widget.university.webPages.first),
              SizedBox(height: 5),
              Text(widget.university.country),
              SizedBox(height: 5),
              widget.university.stateProvince != '' ?
              Text(widget.university.stateProvince) : SizedBox(height: 0),
              SizedBox(height: 5),
              Text(widget.university.alphaTwoCode),
              
              Expanded(child: SizedBox()),
            ],
          )
        )
      ),
    ));
  }
}