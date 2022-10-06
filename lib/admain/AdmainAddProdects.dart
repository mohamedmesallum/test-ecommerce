
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testapi/controllers/CntrollerAdmain.dart';

import '../Core/MyClass/Widgetss/WidgetColorsChebox.dart';
import '../Core/MyClass/Widgetss/addcolorsprodects.dart';
import '../controllers/ControllerHome.dart';
import '../Url.dart';
import '../Core/MyClass/Widgetss/Widgets.dart';

class AddProdects extends StatefulWidget {
  const AddProdects({Key? key}) : super(key: key);

  @override
  State<AddProdects> createState() => _AddProdectsState();
}

class _AddProdectsState extends State<AddProdects> {
  var Select;
  var rel = 0 ;
  var sections= 0;
  var SelectScations;
  //Controler  c = Get.put(Controler());
  ControllerHome c = Get.find();
  ControllerAdmain A = Get.find();
  var name = TextEditingController();
  var description = TextEditingController();
 var color = TextEditingController();
 var size = TextEditingController();
  var priec = TextEditingController();
  var oldPriec= TextEditingController();
  var discont = TextEditingController();
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
     // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:30,horizontal:20 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
IconButton(onPressed: (){
  Get.back();
}, icon: Icon(Icons.arrow_back),alignment: Alignment.topLeft,),

              textFiledlogin(controller:name,keyboardType: TextInputType.text,Icon: Icon(Icons.drive_file_rename_outline),lable: 'name'),
              SizedBox(height: 8,),
              textFiledlogin(controller:description,keyboardType: TextInputType.text,Icon: Icon(Icons.drive_file_rename_outline),lable: 'description'),
              SizedBox(height: 8,),
             textFiledlogin(controller:size,keyboardType: TextInputType.text,Icon: Icon(Icons.format_size,),lable: 'sizes'),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 100,height: 45,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black,width: 1.4)),
                      child: TextField(
                        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22),

                        controller: priec,
                        decoration: InputDecoration(
                       hintText: ' Priec',
                          hintStyle:  TextStyle(fontSize: 18,fontWeight: FontWeight.w900),

                        ),
                      )),
                  Container(width: 100,height: 45,
                      padding: EdgeInsets.only(left: 5),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black,width: 1.4)),
                      child: TextField(
                        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22),

                        controller: oldPriec,
                        decoration: InputDecoration(
                          hintText: ' Old Priec',
                          hintStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.w900),

                        ),
                      )),
                  Container(width: 100,height: 45,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black,width: 1.4)),
                      child: TextField(
                       style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22),
                        controller: discont,
                        decoration: InputDecoration(
                          hintText: ' Discount',

                          hintStyle:  TextStyle(fontSize: 18,fontWeight: FontWeight.w900,),

                        ),
                      )),
                ],
              ),
              SizedBox(height: 12,),
                    WidgetCesckbox(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(items:['Man','Girle','Baby','Womens','Old man','Kids'].map((e) => DropdownMenuItem(child: Text('$e',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),),value:e)).toList(),
                      onChanged: (dynamic val ){
                        setState(() {
                          Select=val;
                        //  print('$val');
                        //  print('$Select');

                        });
                      }
                      ,iconEnabledColor:Colors.black ,value:Select, hint:Text('The Categories',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20)),underline:Divider(thickness: 0,)),
                  DropdownButton(items:['clothes','sportswear','watches','shoes','accessories','pajamas','makeup'].map((e) => DropdownMenuItem(child: Text('$e',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),),value:e)).toList(),
                      onChanged: (dynamic val ){
                        setState(() {
                          SelectScations=val;
                          //  print('$val');
                          //  print('$Select');

                        });
                      }
                      ,iconEnabledColor:Colors.black ,value:SelectScations, hint:Text('The Section',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize:20)),underline:Divider(thickness: 0,)),
                ],
              ),
              SizedBox(height: 8,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(

                    height: 150,
                    width: 150,
                    child: _file==null?Icon(Icons.camera_alt_outlined,size: 55,color: Colors.grey,):  Image.file(_file!,fit: BoxFit.fill,),
                  ),
                  Spacer(),
                  ElevatedButton(
                      style:
                      ButtonStyle(
                        overlayColor:MaterialStateProperty .all(Colors.blue),
                        elevation:MaterialStateProperty.all(7),
                        backgroundColor:MaterialStateProperty.all(Colors.blue),


                        padding: MaterialStateProperty.all(EdgeInsets.only(left:20,right:20,top:2,bottom: 2)),),
                      onPressed: ()async{
                    await addImages();
                  }, child: Text('Add image',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
                ],),

              Center(
                child: Card(

                    child: ElevatedButton(
                      style:
                      ButtonStyle(
                          overlayColor:MaterialStateProperty .all(Colors.blue),
                          elevation:MaterialStateProperty.all(7),
                          backgroundColor:MaterialStateProperty.all(Colors.blueGrey),


                          padding: MaterialStateProperty.all(EdgeInsets.only(left:50,right:50,top:4,bottom: 4)),),

                      onPressed: ()async{
                      if(Select=='Baby'){
                        setState(() {
                          rel = 20;
                        });
                      }if(Select=='Man'){
                        setState(() {
                          rel = 13;
                        });
                      } if (Select=='Girle'){
                        setState(() {
                          rel = 15;
                        });
                      } if (Select=='Womens'){
                        setState(() {
                          rel = 18;
                        });
                      } if (Select=='Old man'){
                        setState(() {
                          rel = 19;
                        });
                      } if (Select=='Kids'){
                        setState(() {
                          rel = 16;
                        });
                      }
                    if(SelectScations=='clothes'){
                      setState(() {
                        sections = 5 ;
                      });
                    }if(SelectScations=='sportswear'){
                        setState(() {
                          sections = 6 ;
                        });
                      }if(SelectScations=='watches'){
                        setState(() {
                          sections = 7 ;
                        });
                      }if(SelectScations=='shoes'){
                        setState(() {
                          sections = 8 ;
                        });
                      }if(SelectScations=='accessories'){
                        setState(() {
                          sections = 9 ;
                        });
                      }if(SelectScations=='pajamas'){
                        setState(() {
                          sections = 10 ;
                        });
                      }if(SelectScations=='makeup'){
                        setState(() {
                          sections = 11 ;
                        });
                      }

                      if(rel!=0 && _file!= null && sections !=0 ){
                       await A. AddProdectsADMAIN(data: {
                          'priec':priec.text,
                          'oldpriec':oldPriec.text,
                          'discount':discont.text,
                          'name':name.text,
                          'description':description.text,
                          'relations':'${rel}',
                          'color':color.text,
                          'size':size.text,
                         'sections':'${sections}'

                        }, file: _file!, Url:UrladdPro).then((value) {
                          A.addColorspro(data:{
                          'White':A.boolWhitee==true?'1':'0',
                            'Yellow':A.boolYelloo==true?'1':'0',
                            'Blue':A.boolBluee==true?'1':'0',
                          'Red':A.boolRedd==true?'1':'0',
                        'id':'${A.idprodectsfromaddrecot}',
                          'Green':A.boolGreenn==true?'1':'0',
                          'Black':A.boolBlackk==true?'1':'0',
                          'Brown':A.boolBrownn==true?'1':'0',
                          'Azure':A.boolAzuree==true?'1':'0',
                          'Silver':A.boolSilverr==true?'1':'0',
                          'Purple':A.boolPurplee==true?'1':'0',
                          'Gray':A.boolGrayy==true?'1':'0',
                          'Orange':A.boolOrangee==true?'1':'0',
                                    });
                       }).then((value){
                         Get.offNamed('/HomeAdmain');
                       });
                      }

                      }, child:Text('add Prodects',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),)),
              ),

            ],

          ),
        ),
      ),
    );
  }
}
