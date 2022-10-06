import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Url.dart';
import 'package:testapi/controllers/CntrollerAdmain.dart';
import 'package:testapi/controllers/ControllerHome.dart';

import '../../Core/MyClass/Widgetss/ColorsWidget.dart';
import '../../Core/MyClass/Widgetss/Widgets.dart';




class UpdetProdctsAD extends StatelessWidget {
var name = TextEditingController();
var description = TextEditingController();
var size = TextEditingController();
var priec = TextEditingController();
var oldPriec = TextEditingController();
var discount = TextEditingController();


  ControllerAdmain c = Get.find();
  ControllerHome h = Get.find();

  @override
  Widget build(BuildContext context) {
    TextStyle ss = TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.blue);
    TextStyle sss = TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38);


    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,foregroundColor: Colors.black,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [

                  Container(
                      width: double.infinity,
                      height: 200,
                      child:
                      Container(child:

                      FadeInImage.assetNetwork(
                          fit:BoxFit.cover,
                          placeholder: 'images/FASHION.PNG',
                          image: '${urlImages}/${c.image}')
                        ,height: 160,width: double.infinity,),
                  ),


                ], ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(


                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          TextFormField(
                              controller:name,
                            style: ss,
                            keyboardType: TextInputType.text,
                            decoration:InputDecoration(
                              focusedBorder:InputBorder.none,

                              suffixIcon: Icon(Icons.edit),
                              hintText:'${c.name}',
                              hintStyle:sss,
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            style: ss,
                            keyboardType: TextInputType.text,
                            controller:description,
                            decoration:InputDecoration(
                              focusedBorder:InputBorder.none,

                              suffixIcon: Icon(Icons.edit),
                            hintText:'${c.description}',
                             hintMaxLines: 3,
                             hintStyle: sss,
                            ),
                          ),
                          SizedBox(height:10,),
                          TextFormField(
                            style: ss,
                            keyboardType: TextInputType.text,
                              controller:size,
                              decoration:InputDecoration(
                                focusedBorder:InputBorder.none,

                                suffixIcon: Icon(Icons.edit),
                                hintText:'${c.size}',

                               hintStyle: sss,
                              ),
                            ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.5)
                                ),
                                width: 150,
                                child: TextFormField(
                                  style: ss,
                                  keyboardType: TextInputType.number,
                                  controller:priec,
                                  decoration:InputDecoration(
                                    focusedBorder:InputBorder.none,

                                    suffixIcon: Icon(Icons.edit),
                                   hintText:'${c.priec} lE',
                                   hintStyle:sss,
                                  ),
                                ),
                              ),

                              if(c.discount!=0)
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1.5)
                                ),
                                width: 150,
                                child: TextFormField(
                                  style: ss,
                                  keyboardType: TextInputType.number,
                                  controller:oldPriec,
                                  decoration:InputDecoration(
                                    focusedBorder:InputBorder.none,

                                    suffixIcon: Icon(Icons.edit),
                                   hintText:'${c.oldPriec} lE',
                                   hintStyle: sss,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          if(c.discount!=0)
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1.5)
                                ),
                                width: 150,
                                child: TextFormField(
                                  style: ss,
                                  keyboardType: TextInputType.text,
                                  controller:discount,
                                  decoration:InputDecoration(
                                    focusedBorder:InputBorder.none,

                                    suffixIcon: Icon(Icons.edit),
                                   hintText:'${c.discount} %',
                                    hintStyle: sss,
                                  ),
                                ),
                              ),
                            ),

                        ],
                      ),
                    ),

                    //Available sizes
                    SizedBox(height: 8,),
                    if(h.Colorsbool==true)
                      Text('Color :',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent),),
                    SizedBox(height: 8,),
                    if(h.Colorsbool==true)
                      if(c.id==h.ColorsProdects.data!.id)
                        ColorsWidgets(),

                  ],
                ),
              ),

              Center(

                child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          elevation: 6,
                          child:ElevatedButton(onPressed: ()async{
                            showDialog(context: context, builder:(context){
                              return AlertDialog(
                                actions: [


                                  ElvetBouttenCansel(),
                                  ElevatedButton(onPressed:()async{
                                    await  c.deletProdects(data: {
                                      'Relations':'${c.relations}',
                                      'sections':'${c.sections}',
                                      'id':'${c.id}',
                                      'nameimage':'${c.image}'
                                    });
                                  },
                                      child: Text('Ok',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                                      style: ButtonStyle(
                                          overlayColor:MaterialStateProperty .all(Colors.blue),
                                          elevation:MaterialStateProperty.all(7),
                                          backgroundColor:MaterialStateProperty.all(Colors.blueAccent),


                                          padding: MaterialStateProperty.all(EdgeInsets.only(left:30,right:30,top:2,bottom: 2))
                                      )

                                  ),
                                ],
                                actionsAlignment:MainAxisAlignment.spaceAround,
                                title: Text('delet this prodect now ??'),
                                titleTextStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.w800,color: Colors.black),

                              );
                            });
                          },child: Text( 'delet',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),style: ButtonStyle(
                              backgroundColor:MaterialStateProperty.all(Colors.redAccent[400]),

                              padding: MaterialStateProperty.all(EdgeInsets.only(left: 30,right:30,top: 10,bottom: 10))
                          ),) ,),
                        Card(
                          elevation: 6,
                          child:ElevatedButton(onPressed: ()async{
                            showDialog(context: context, builder:(context){
                              return AlertDialog(
                                actions: [


                                  ElvetBouttenCansel(),
                                  ElevatedButton(onPressed:()async{
                                    await c.UpdaetProdects(data: {
                                      'name':name.text.isEmpty?'${c.name}':name.text,
                                      'old_priec':oldPriec.text.isEmpty?'${c.oldPriec}':oldPriec.text,
                                      'discount':discount.text.isEmpty?'${c.discount}':discount.text,
                                      'priec':priec.text.isEmpty?'${c.priec}':priec.text,
                                      'description':description.text.isEmpty?'${c.description}':description.text,
                                      'size':size.text.isEmpty?'${c.size}':size.text,
                                      'id':'${c.id}',
                                    });
                                  },
                                      child: Text('Ok',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                                      style: ButtonStyle(
                                          overlayColor:MaterialStateProperty .all(Colors.blue),
                                          elevation:MaterialStateProperty.all(7),
                                          backgroundColor:MaterialStateProperty.all(Colors.blueAccent),


                                          padding: MaterialStateProperty.all(EdgeInsets.only(left:30,right:30,top:2,bottom: 2))
                                      )

                                  ),
                                ],
                                actionsAlignment:MainAxisAlignment.spaceAround,
                                title: Text('send edits now ?'),
                                titleTextStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.w800,color: Colors.black),

                              );
                            });

                          },child: Text( 'send edit',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),style: ButtonStyle(
                              backgroundColor:MaterialStateProperty.all(Colors.blue),

                              padding: MaterialStateProperty.all(EdgeInsets.only(left: 30,right:30,top: 10,bottom: 10))
                          ),) ,),
                      ],
                    ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}