
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/Widgetss/Widgets.dart';


import '../Core/MyClass/Widgetss/WidgetCart.dart';
import '../controllers/ControlerSign.dart';
import '../controllers/ControllerHome.dart';


class cart extends StatelessWidget {

  ControllerHome c = Get.find();

  ControlerSign x = Get.find();
  var cont = 1;

  @override
  Widget build(BuildContext context) {
   // List<car.Data> listdata = c.Cart!.data!;

    return
      GetBuilder<ControllerHome>(
        init: ControllerHome(),
    builder: (c)=>
          Scaffold(
            floatingActionButton:
            c.Cartbool==false? null :
            c.orders==true?
            CircularProgressIndicator():
            InkWell(
              onTap: ()async{

                if(x.idaddres == null){
                  return
                    showDialog(context: context, builder:(context){

                      return AlertDialog(

                        actions: [


                          ElvetBouttenCansel(),
                          ElevatedButton(onPressed:(){
                            Get.back();
                            Get.toNamed('/ChooseAddres');

                          },
                              child: Text('choose addres',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                              style: ButtonStyle(
                                  overlayColor:MaterialStateProperty .all(Colors.blue),
                                  elevation:MaterialStateProperty.all(7),
                                  backgroundColor:MaterialStateProperty.all(Colors.deepOrangeAccent),


                                  padding: MaterialStateProperty.all(EdgeInsets.only(left:10,right:10,top:2,bottom: 2))
                              )

                          ),
                        ],
                        actionsAlignment:MainAxisAlignment.spaceAround,
                        title: Text('Please choose addres'),
                        titleTextStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.w800,color: Colors.black),


                      );
                    });
                }
                else if (x.idaddres != null){
                  showDialog(context: context, builder:(context){
                    return AlertDialog(
                      actions: [


                        ElvetBouttenCansel(),
                        ElevatedButton(onPressed:()async{
                          await c.addOrders().then((value) {
                            if(c.idorderr != null){
                              for(var t in c.Cart!.data!) {
                                c.addDataOrders(
                                    data: {
                                      'id': '${c.idorderr}',
                                      'id_products': '${t.id}',
                                      'cont': '${t.count}',
                                      'priecprodect': '${t.priec}',
                                    }
                                );
                                x.idaddres=null;
                                Get.back();

                              }
                            }
                          });

                        },
                            child: Text('Set',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                            style: ButtonStyle(
                                overlayColor:MaterialStateProperty .all(Colors.blue),
                                elevation:MaterialStateProperty.all(7),
                                backgroundColor:MaterialStateProperty.all(Colors.deepOrangeAccent),


                                padding: MaterialStateProperty.all(EdgeInsets.only(left:30,right:30,top:2,bottom: 2))
                            )

                        ),
                      ],
                      actionsAlignment:MainAxisAlignment.spaceAround,
                      title: Text('Set Orders Now'),
                      titleTextStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.w800,color: Colors.black),

                    );
                  });
                }







              },
              child: Chip(
                padding: EdgeInsets.all(10),
                    backgroundColor: Colors.blueGrey,
                    label:                Text('Order Now',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white),),


                ),
            ),
           
              appBar: AppBar(
                elevation: 3,
               shadowColor: Colors.blueGrey,
               actions: [
                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Icon(Icons.add_shopping_cart_sharp,size: 32,color: Colors.deepOrangeAccent,),
                    c.Cartbool==false?                           Text('0',style: TextStyle(fontSize: 22,color: Colors.blueGrey,fontWeight: FontWeight.bold),):

                       Text('${c.lentheCart}',style: TextStyle(fontSize: 22,color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),),


                     ],
                   ),
                 )
               ],
                title: Text('Cart',style: TextStyle(letterSpacing: 0.5,fontSize: 27,fontWeight: FontWeight.bold,color: Colors.black),),

              ),
              body:
              GetBuilder<ControllerHome>(
                  init: ControllerHome(),
                  builder:(l)=> l.Cartbool==false ?
                  Padding(
                  padding: EdgeInsets.symmetric(vertical: 100,horizontal: 10),
                  child: Container(
                    height: double.infinity,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined,size: 275,color: Colors.blueGrey,),
                        SizedBox(height: 10,),
                        Center(child: Text("You can't find your cart products !",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.blueGrey),))
                      ],
                    ),
                  )):



                  SingleChildScrollView(
                    child: Container(
                   // height: double.infinity,
                     // width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
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
                                    child: GetBuilder<ControllerHome>(
                                      builder: (r)=>
                                     Chip(
                                       // backgroundColor: Colors.black45,
                                          elevation:4,
                                          shadowColor: Colors.red,
                                          labelPadding:EdgeInsets.all(6),
                                          label: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('${r.TotalCart.toStringAsFixed(2)}',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,)),
                                              Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),

                                            ],
                                          ),

                                      ),
                                    ),

                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),


                          Container(
                         // height: double.infinity,
                            width: double.infinity,
                            child:  ListView.builder(
                         shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                                itemCount: l.Cart!.data!.length ,
                                itemBuilder: (ctx,i)=>

                                    Dismissible(
                                        direction: DismissDirection.endToStart,
                                        background:Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment:Alignment.centerRight ,
                                            color:Colors.redAccent,
                                            child: Icon(Icons.delete_forever_rounded,size: 40,color: Colors.white,),
                                          ),
                                        ),
                                        key: ValueKey(l.Cart!.data![i].id),
                                        child: widgetCart(l.Cart!.data!,i),
                                        confirmDismiss:(Decoration){
                                          return
                                          showDialog(context: context, builder:(context){
                                            return AlertDialog(
                                              title: Center(
                                                  child: Text('Remove product from cart ?',)),
                                              actionsAlignment: MainAxisAlignment.spaceEvenly,
                                              titlePadding: EdgeInsets.all(10),
                                            titleTextStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.w800,color: Colors.blueGrey),
                                          actions: [
                                            ElvetBouttenCansel(),
                                            ElevatedButton(onPressed:()async{
                                              await    c.cart(c.Cart!.data![i].id).then((value) {
                                                c.addANDdeletCart(
                                                    idprodect:'${c.Cart!.data![i].id}',
                                                    iduser:'${x.userdata.data!.id}',
                                                    sections: '${c.Cart!.data![i].sections}',
                                                    relashin: '${c.Cart!.data![i].relations}'
                                                );
                                              }).then((value) {
                                                Get.back();
                                              });

                                                      },
                                                child: Text('OK',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                                                style: ButtonStyle(
                                                    overlayColor:MaterialStateProperty .all(Colors.blue),
                                                    elevation:MaterialStateProperty.all(7),
                                                    backgroundColor:MaterialStateProperty.all(Colors.deepOrangeAccent),


                                                    padding: MaterialStateProperty.all(EdgeInsets.only(left:10,right:10,top:2,bottom: 2))
                                                )

                                            ),
                                          ],


                                            );

                                          });
                                        }


                                    ),


                            ),

                          ),
                        ],
                      ),
                    ),
                  ),







          ),
    ),
          );
  }
}
