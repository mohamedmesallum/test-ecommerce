

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/CntrollerAdmain.dart';
import '../controllers/ControllerHome.dart';
import '../Url.dart';
import '../Core/MyClass/Widgetss/Widgets.dart';

class Addcatgires extends StatefulWidget {


  @override
  State<Addcatgires> createState() => _AddcatgiresState();
}

class _AddcatgiresState extends State<Addcatgires> {
 ControllerHome c = Get.find();
 ControllerAdmain A = Get.find();
  var namecatgre = TextEditingController();
  var priecProdect = TextEditingController();
  File? _file;
  var _imagePicker= ImagePicker();
  Future addImages()async{
    var imagePath = await _imagePicker.pickImage(source: ImageSource.gallery,maxWidth: 250,imageQuality:50);
    if(imagePath != null){
      setState(() {
        _file = File(imagePath.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:20,horizontal:20 ),
          child: Column(
            children: [
              Center(child: Text('Categories',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w800),)),
              SizedBox(height: 30,),

              textFiledlogin(controller:namecatgre,keyboardType: TextInputType.emailAddress,Icon: Icon(Icons.drive_file_rename_outline,),lable: 'name'),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    child: _file==null?Icon(Icons.camera_alt_outlined,size: 30,color: Colors.black,):  Image.file(_file!,fit: BoxFit.fill,),
                  ),
                  Spacer(),
                  ElevatedButton(onPressed: ()async{
                    await addImages();
                  }, child: Text('Add image')),
                ],),

              Card(

                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding:MaterialStateProperty.all(EdgeInsets.only(left: 75,right: 75)),
                        backgroundColor:MaterialStateProperty.all(Colors.blue) ),

                    onPressed: ()async{
                      if(_file!=null){
                        try{
                      A.AddProdectsADMAIN(
                           Url: UrlPCategories,
                           data: {
                       'name':namecatgre.text,
                       }, file: _file!).then((value) {
                         Get.offAllNamed('/home');
                       });

                        }catch(e){

                          print(e.toString());
                        }
                      }

                    }, child:Text('add'),)),

            ],

          ),
        ),
      ),
    );
  }
}
