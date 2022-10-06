

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/Core/MyClass/StatusRequest.dart';
import 'package:testapi/controllers/ControllerHome.dart';

class RejectedOrders extends StatelessWidget {
  ControllerHome c = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
      GetBuilder<ControllerHome>(
        init: ControllerHome(),
        builder:(c)=>
        c.statusRequest==StatusRequest.failure?
        Padding(
            padding: EdgeInsets.symmetric(vertical: 100,horizontal: 10),
            child: Container(
              height: double.infinity,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_shopping_cart_sharp,size: 275,color: Colors.blueGrey,),
                  SizedBox(height: 10,),
                  Center(child: Text("There are no orders !",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.blueGrey),))
                ],
              ),
            )):

        GetBuilder<ControllerHome>(
          builder: (c)=>
              ListView.builder(
                  itemCount: c.oredrsss!.rejected!.length,
                  itemBuilder:(ctx,i){
                    return
                      Column(

                        children: [
                          Container(

                            child: InkWell(
                              onTap: ()async{
                                await c.GetdattOredrs(idodred:'${c.oredrsss!.rejected![i].orderNumber}').then((value) => Get.toNamed('/ShowOrder'));
                              },
                              child: Card(
                                elevation: 7,
                                shadowColor: Colors.blueGrey,

                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                          Text(' ${i+1}' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.blueGrey),),
                                          Spacer(),
                                          IconButton(onPressed: ()async{
                                          }, icon: Icon(Icons.double_arrow,color: Colors.deepOrange,))//total price
                                        ],
                                      ),
                                      SizedBox(height: 8,),
                                      Row(
                                        children: [
                                          Text('Time :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                          Text(' ${c.oredrsss!.rejected![i].timee}' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.blueGrey),),
                                        ],
                                      ),
                                      SizedBox(height: 8,),
                                      Row(
                                        children: [
                                          Text('Total Price :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(' ${c.oredrsss!.rejected![i].totalpriec}' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.blueGrey),),
                                              Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blueGrey)),

                                            ],
                                          ),

                                        ],


                                      ),

                                      SizedBox(height: 12,),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('status :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.redAccent),),
                                        ],
                                      ),
                                      SizedBox(height: 7,),
                                      Text('Sorry, your order was rejected. The product may no longer be available',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.redAccent),),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                  }),
        ),


      ),






    );
  }
}