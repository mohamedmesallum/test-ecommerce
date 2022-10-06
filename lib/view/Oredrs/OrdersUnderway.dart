
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/Core/MyClass/StatusRequest.dart';
import 'package:testapi/controllers/ControllerHome.dart';

class WitingOrders extends StatelessWidget {
  ControllerHome c = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: FutureBuilder(
          future: c.GetOrderss(),
          builder: (ctx,SnapShot)=>
            SnapShot.connectionState==ConnectionState.waiting?Center(child: CircularProgressIndicator(),):
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
                              HindlingDataView(c.statusRequest,
                                GetBuilder<ControllerHome>(
                                  builder: (c)=>
                                ListView.builder(
                                      itemCount: c.oredrsss
                                      !.data!.length,
                                      itemBuilder:(ctx,i){

                                        return

                                          Column(

                               children: [
                               Container(

                               child: InkWell(
                                   onTap: ()async{
                                     await c.GetdattOredrs(idodred:'${c.oredrsss!.data![i].orderNumber}').then((value) => Get.toNamed('/ShowOrder'));
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

                                            Text(' ${c.oredrsss!.data![i].timee}' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.blueGrey),),
                                             ],
                                           ),
                                           SizedBox(height: 8,),
                                           Row(
                                             children: [
                                               Text('Total Price :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.end,
                                                 children: [
                                                   Text(' ${c.oredrsss!.data![i].totalpriec}' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.blueGrey),),
                                                   Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blueGrey)),

                                                 ],
                                               ),

                                             ],


                                           ),

                                           SizedBox(height: 12,),
                                           Row(
                                             children: [
                                               Text('status :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),
                                               if(c.oredrsss!.data![i].approval==0)
                                               Text(' waiting' ,style: TextStyle(fontSize:20,fontWeight: FontWeight.w900,color: Colors.blueGrey),),
                                               if(c.oredrsss!.data![i].approval==1)
                                                 Expanded(

                                                      child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: [
                                                           Text(' accepted' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),
                                                           Icon(Icons.done,size: 35,color: Colors.deepOrangeAccent,)
                                                         ],
                                                       ),


                                                 ),
                                               if(c.oredrsss!.data![i].approval==2)

                                                 Expanded(
                                                   child: Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                     children: [
                                                       Text(' rejected' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.redAccent),),
                                                       Icon(Icons.clear,size: 35,color: Colors.redAccent,)

                                                     ],
                                                   ),
                                                 ),

                                             ],
                                           ),
                                           SizedBox(height: 8,),
                                           if(c.oredrsss!.data![i].approval==1)
                                            Text('Your order has been accepted and will be delivered within 90 minutes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepOrangeAccent),),
                                           if(c.oredrsss!.data![i].approval==0)
                                             Text('Your request is pending and will be answered soon',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey),),
                                           SizedBox(height: 15,),




                                           if(c.oredrsss!.data![i].approval==0)
                                           Container(
                                             width: double.infinity,
                                             height: 25,
                                             child:
                                             LiquidLinearProgressIndicator(
                                               value: 0.6, // Defaults to 0.5.
                                               valueColor: AlwaysStoppedAnimation(Colors.black26), // Defaults to the current Theme's accentColor.
                                               backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
                                               borderColor: Colors.deepOrangeAccent,
                                               borderWidth: 1.5,
                                               borderRadius: 12.0,
                                               direction: Axis.horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                                               center: Text("On Request...",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.deepOrangeAccent),),
                                             ),
                                           ),
                                           if(c.oredrsss!.data![i].approval==1)

                                             Container(
                                             width: double.infinity,
                                             height: 25,
                                             child: LiquidLinearProgressIndicator(
                                               value: 0.98, // Defaults to 0.5.
                                               valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent), // Defaults to the current Theme's accentColor.
                                               backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
                                               borderColor: Colors.black,
                                               borderWidth: 1.3,
                                               borderRadius: 12.0,
                                               direction: Axis.horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                                               center: Text("accepted..",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.white),),
                                             ),
                                           ),
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
                    )

                ),





      )   ,
    );
  }
}
