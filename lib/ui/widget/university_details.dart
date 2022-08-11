import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/model/university.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.university}) : super(key: key);

  final University university;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

File? image;
String? uuid;
OverlayEntry? loader;

class _DetailsScreenState extends State<DetailsScreen> {

  Future pickImage(ImageSource source, ValueChanged<String> uploadCompleted) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile = await imagePicker.pickImage(source: source, imageQuality: 80, maxHeight: 480, maxWidth: 640);
    File imageFile = File(pickedFile!.path);
    
      try {
        setState((){
          image = imageFile;
        });
        //loader = Helper.overlayLoader(context);
        //FocusScope.of(context).unfocus();
        //Overlay.of(context)!.insert(loader!);
        //uuid = await _uploadRepository.uploadImage(imageFile, 'avatar');
        uploadCompleted(uuid!);
        //currentUser.value.image = new Media(id: uuid);
        //_con.update(currentUser.value);
        //Helper.hideLoader(loader!);
      }
      catch (e) {
      }

  }

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
                  ImagePickerBottomSheet();
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

  ImagePickerBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text('Camara'),
                  onTap: () => getImageCamera(),
                ),
                new ListTile(
                  leading: new Icon(Icons.image),
                  title: new Text('Galeria'),
                  onTap: () => getImageGallery(),
                ),
              ],
            ),
          );
        });
  }

  Future getImageCamera() async {
    Navigator.of(context).pop();
    await pickImage(ImageSource.camera, (uuid) {
      //currentUser.value.image = new Media(id: uuid);
    });
  }

  Future getImageGallery() async {
    Navigator.of(context).pop();
    await pickImage(ImageSource.gallery, (uuid) {
      //currentUser.value.image = new Media(id: uuid);
    });
  }
}