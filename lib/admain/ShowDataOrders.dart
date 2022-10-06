

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/MyClass/HindlingDataView.dart';
import '../Url.dart';
import '../controllers/CntrollerAdmain.dart';
import '../controllers/ControllerHome.dart';

class ShowAdmainOrders extends StatelessWidget {
ControllerHome c= Get.find();
ControllerAdmain A = Get.find();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(

        ),
        body:
        GetBuilder<ControllerHome>(
            init: ControllerHome(),
            builder:(c)=>
                HindlingDataView(c.statusRequest,
                    SingleChildScrollView(
                      child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Card(
                                  elevation: 2,

                                  shadowColor: Colors.red,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Text('Total',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:Colors.black),),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child:
                                        Chip(
                                          // backgroundColor: Colors.black45,
                                          elevation:4,
                                          shadowColor: Colors.red,
                                          labelPadding:EdgeInsets.all(6),
                                          label: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('${c.totalOw}',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,)),
                                              Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),

                                            ],
                                          ),

                                        ),


                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: c.dataWOredrs!.data!.length,
                                itemBuilder:(ctx,i)=>
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2),
                                      child: Column(
                                        children: [


                                          Card(
                                            //elevation: ,
                                            shadowColor: Colors.redAccent,
                                            child: Container(
                                              width: double.infinity,
                                              height: 150,padding: EdgeInsets.all(8),
                                              //color:Colors.blueAccent,
                                              child: Row
                                                (
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:2,top: 2),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [


                                                        Row(
                                                          children: [
                                                            Text('name :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                                            Text(" ${c.dataWOredrs!.data![i].name}",
                                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.blueGrey),),
                                                          ],
                                                        ),
                                                        // SizedBox(height: 20,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text('priec prodects :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                                                Row(
                                                                  //mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                  children: [
                                                                    Text(' ${c.dataWOredrs!.data![i].priecprodect}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,color: Colors.blueGrey)),
                                                                    Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blueGrey)),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        // SizedBox(height: 20,),


                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text('Product count :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                                                Text(' ${c.dataWOredrs!.data![i].cont}',
                                                                  style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.w800),),
                                                              ],
                                                            ),

                                                            SizedBox(width: 7,),

                                                          ],
                                                        ),


                                                        // SizedBox(height: 15,),
                                                        Row(

                                                          children: [
                                                            InkWell(
                                                                onTap:(){

                                                                },
                                                                child: Text('Totel',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.deepOrangeAccent),)),

                                                            SizedBox(width: 10,),
                                                            Chip(
                                                              // backgroundColor: Colors.black45,
                                                              elevation:4,
                                                              //shadowColor: Colors.red,
                                                              labelPadding:EdgeInsets.all(3),
                                                              label: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  Text('${c.dataWOredrs!.data![i].cont! * c.dataWOredrs!.data![i].priecprodect! }',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueGrey)),
                                                                  Text(' L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blueGrey)),

                                                                ],
                                                              ),

                                                            ),


                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width:155,
                                                    child: Image.network('${urlImages}/${c.dataWOredrs!.data![i].image}',fit: BoxFit.fill,),height: 150,),

                                                ],
                                              ),

                                            ),
                                          ),
                                          SizedBox(height: 13,)
                                        ],
                                      ),
                                    ),


                              ),
                            ),
                          ],
                        ),
                    ),
               



                )



        ),






      );
  }
}
