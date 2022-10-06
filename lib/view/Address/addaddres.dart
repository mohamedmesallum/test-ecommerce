
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Core/MyClass/Widgetss/Widgets.dart';
import '../../controllers/ControlerSign.dart';




class AddAddress extends StatelessWidget {
var Street = TextEditingController();
var Region = TextEditingController();
var Building = TextEditingController();
var turnnumber= TextEditingController();
 var Apartmentnumber = TextEditingController();
 var specialmarque=TextEditingController();
 var DeliveryInstructions= TextEditingController();

  @override
  Widget build(BuildContext context) {
//List<car.Data> listdata = c.Cart!.data!;


    return
      Scaffold(

          appBar: AppBar(
            title:Text('Addresses',style:TextStyle(letterSpacing: 0.5,fontSize: 27,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldAddres(width:double.infinity ,
                    lable: 'Region:',
                    keyboardType: TextInputType.text,
                    controller: Region,),
                  SizedBox(height: 10,),
                  TextFieldAddres(width:double.infinity ,
                    lable: 'Street:',
                    keyboardType: TextInputType.text,
                    controller: Street,),
                  SizedBox(height: 10,),
                  TextFieldAddres(width:double.infinity ,
                    lable: 'Building number or name:',
                    keyboardType: TextInputType.text,
                    controller: Building,),
                  SizedBox(height:10,),
                  TextFieldAddres(width:200 ,
                    lable: 'turn number:',
                    keyboardType: TextInputType.number,
                    controller: turnnumber,),
                  SizedBox(height: 10,),
                  TextFieldAddres(width:200 ,
                    lable: 'Apartment number:',
                    keyboardType: TextInputType.number,
                    controller: Apartmentnumber,),
                  SizedBox(height: 10,),
                  TextFieldAddres(width:double.infinity ,
                    lable: 'Special marque:',
                    keyboardType: TextInputType.text,
                    controller: specialmarque,),
                  SizedBox(height: 10,),
                  TextFieldAddres(width:double.infinity ,
                    lable: 'Delivery Instructions:',
                    keyboardType: TextInputType.text,
                    controller: DeliveryInstructions,),
                  SizedBox(height: 10,),
                  Center(child: GetBuilder<ControlerSign>(
                    init: ControlerSign(),
                    builder: (s)=>
                    s.islodingaddres==true?
                        CircularProgressIndicator():
                     ElvettBoutten(
                      ontap: ()async{

                        if(Region.text !=null || Street.text != null){
                          await s.addAddress(data: {
                      'id_user':'${s.userdata.data!.id}',
                      'Region':Region.text,
                      'Street':'${Street.text}',
                      'Building':'${Building.text}',
                      'turn':'${turnnumber.text}',
                      'Apartme':'${Apartmentnumber.text}',
                      'special_marque':specialmarque.text,
                      'nstructions':DeliveryInstructions.text
                      }).then((value) {
                         Navigator.of(context).pop();
                          });
                        }


                      },name: 'add Address',color: Colors.blueGrey
                    ),
                  ),)


                ],
              ),
            ),
          )


      );
  }
}



