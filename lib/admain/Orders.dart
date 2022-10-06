
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/Core/MyClass/StatusRequest.dart';
import 'package:testapi/controllers/ControllerHome.dart';

import '../Core/MyClass/Widgetss/Widgets.dart';
import '../controllers/CntrollerAdmain.dart';

class AdmainOrders extends StatelessWidget {
  ControllerAdmain CA = Get.find();
  ControllerHome h = Get.put(ControllerHome());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('admin'),),
      body: FutureBuilder(
        future: CA.GetAdmainOrders(),
        builder: (ctx,SnapShot)=>
      SnapShot.connectionState==ConnectionState.waiting?
          Center(child: CircularProgressIndicator(),):
          GetBuilder<ControllerAdmain>(
              init: ControllerAdmain(),
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
              ListView.builder(
                  itemCount: CA.OrdresA!.data!.length,
                  itemBuilder: (ctx,i){
                   return
                     Column(
                      children: [
                        Container(

                          child: InkWell(
                            onTap: ()async{
                             await h.GetdattOredrs(idodred:'${c.OrdresA!.data![i].orderNumber}').then((value){
Get.toNamed('/ShowAdmainOrders');

                            });

                            },
                            child: Card(
                              elevation: 7,
                              shadowColor: Colors.blueGrey,
color: c.OrdresA!.data![i].approval==1?Colors.greenAccent:Colors.white,
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

                                        Text(' ${c.OrdresA!.data![i].timee}' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.blueGrey),),
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Text('Total Price :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(' ${c.OrdresA!.data![i].totalpriec}' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.blueGrey),),
                                            Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.blueGrey)),

                                          ],
                                        ),

                                      ],


                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Text(' Name :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                        Text(' ${c.OrdresA!.data![i].username}' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.blueGrey),),
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Text(' Email :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                        Text(' ${c.OrdresA!.data![i].email}' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.blueGrey),),
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Text(' Phone :' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.deepOrangeAccent),),

                                        Text(' ${c.OrdresA!.data![i].phone}' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.blueGrey),),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    ExpansionTile(
                                      collapsedIconColor: Colors.deepOrangeAccent,
                                      iconColor: Colors.blueAccent,
                                      collapsedTextColor: Colors.deepOrangeAccent,
                                      textColor: Colors.black,
                                      expandedAlignment:Alignment.topLeft,
                                      expandedCrossAxisAlignment:CrossAxisAlignment.start,
                                      tilePadding:EdgeInsets.all(7),
                                      title:
                                      Text('Addres :',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w900,),),
                                      subtitle:Container(
                                          width: 250,
                                          child: Text('${c.OrdresA!.data![i].region}',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w900,color:Colors.blueGrey),maxLines:4,overflow:TextOverflow.ellipsis)),




                                      childrenPadding: EdgeInsets.all(0),
                                      children: [

                                        Rowaddres('Street','${c.OrdresA!.data![i].street}'),
                                        SizedBox(height: 10,),
                                        Rowaddres( 'Building number or name','${c.OrdresA!.data![i].building}'),
                                        SizedBox(height: 10,),
                                        Rowaddres('Turn number','${c.OrdresA!.data![i].turn}'),
                                        SizedBox(height: 10,),
                                        Rowaddres('Apartment number','${c.OrdresA!.data![i].apartme}'),
                                        SizedBox(height: 10,),
                                        Rowaddres('Special marque','${c.OrdresA!.data![i].specialMarque}'),
                                        SizedBox(height: 10,),
                                        Rowaddres('Delivery Instructions','${c.OrdresA!.data![i].nstructions}' ),



                                      ],
                                    ),
                                    SizedBox(height: 20,),

                                   // WidgetAo(,i,'${c.OrdresA!.data![i].orderNumber}'),
                                    SizedBox(height: 30,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                       // ElevatedButton(onPressed: (){}, child: Text('Acceptance')),
                                       // ElevatedButton(onPressed: (){}, child: Text('rejection')),
                    ElevatedButton(onPressed:()async{
                   await  CA.AcceptanceAndRejection(Data: {
                      'idorders':'${c.OrdresA!.data![i].orderNumber}',
                     'approval':'${1}',
                     });
                    },
                    child: Text('Acceptance',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                    style: ButtonStyle(
                    overlayColor:MaterialStateProperty .all(Colors.blue),
                    elevation:MaterialStateProperty.all(7),
                    backgroundColor:MaterialStateProperty.all(Colors.deepOrangeAccent),


                    padding: MaterialStateProperty.all(EdgeInsets.only(left:10,right:10,top:2,bottom: 2))
                    )
                    ),
                                        ElevatedButton(onPressed:()async{
                                          await  CA.AcceptanceAndRejection(Data: {
                                            'idorders':'${c.OrdresA!.data![i].orderNumber}',
                                            'approval':'${3}',
                                          });
                                        },
                                            child: Text('delivered',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                                            style: ButtonStyle(
                                                overlayColor:MaterialStateProperty .all(Colors.blue),
                                                elevation:MaterialStateProperty.all(7),
                                                backgroundColor:MaterialStateProperty.all(Colors.green),


                                                padding: MaterialStateProperty.all(EdgeInsets.only(left:10,right:10,top:2,bottom: 2))
                                            )
                                        ),
                                        ElevatedButton(onPressed:()async{
                                          await  CA.AcceptanceAndRejection(Data: {
                                            'idorders':'${c.OrdresA!.data![i].orderNumber}',
                                            'approval':'${2}',
                                          });
                                        },
                                            child: Text('Rejection',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                                            style: ButtonStyle(
                                                overlayColor:MaterialStateProperty .all(Colors.blue),
                                                elevation:MaterialStateProperty.all(7),
                                                backgroundColor:MaterialStateProperty.all(Colors.redAccent),
                                                padding: MaterialStateProperty.all(EdgeInsets.only(left:10,right:10,top:0,bottom: 0))
                                            )
                                        ),
                                      ],
                                    )


                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }


              ),

              )


          ),
      )

    );
  }
}
