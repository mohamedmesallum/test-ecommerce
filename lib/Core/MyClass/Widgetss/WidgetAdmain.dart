
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/Url.dart';
import 'package:testapi/controllers/CntrollerAdmain.dart';

import '../../../../../controllers/ControlerSign.dart';
import '../../../../../controllers/ControllerHome.dart';
import '../../../../../controllers/ControllerMan.dart';
import '../../../../Data/Model/ModielProdects.dart' as ModelP;
import 'Widgets.dart';

class WidgetViewAdmain extends StatelessWidget {
  final List<ModelP.Data> DataMAN;
  final int i;

  WidgetViewAdmain(this.DataMAN,this.i);
  ControlerSign x = Get.find();
  ControllerHome h =Get.find();
  ControllerAdmain A = Get.find();
  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: ()async{
       await h.GetColorsPod(IdProd:'${DataMAN[i].id}');
                Get.toNamed('UpdetProdctsAD',arguments: {
                  'id':DataMAN[i].id,
                   'relations':DataMAN[i].relations,
                   'priec':DataMAN[i].priec,
                   'oldPriec':DataMAN[i].oldPriec,
                   'name':DataMAN[i].name,
                   'discount':DataMAN[i].discount,
                   'image':DataMAN[i].image,
                   'description':DataMAN[i].description,
                   'color':DataMAN[i].color,
                   'size':DataMAN[i].size,
               'inCart':DataMAN[i].inCart,
                   'inFavorites':DataMAN[i].inFavorites,
                 'iduser':x.userdata.data!.id,
                 'sections':DataMAN[i].sections,
                });
               await A.argeomentAD();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5,left: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(

                border:Border.all(color: Colors.black,width:2),
                borderRadius: BorderRadius.circular(18),
              ),

              height: 300,width: 200,child:
            Padding(
              padding: const EdgeInsets.only(top: 6.0,right: 3,left: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(child:

                      FadeInImage.assetNetwork(
                        fit:BoxFit.fill,
                        placeholder: 'images/FASHION.PNG',
                        image: '${urlImages}/${DataMAN[i].image}',
                        imageErrorBuilder: (c,o,s)=>Image.asset('images/error.png',fit: BoxFit.fill,),)
                        ,height: 160,width: double.infinity,),
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(DataMAN[i].discount!=0)
                            Descont(),
                          Spacer(),
                          GetBuilder<ControllerHome>(
                            init:ControllerHome(),
                            builder:(l)=>  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(child: IconButton(icon:Icon(Icons.delete_forever_rounded,size: 27,color: Colors.white,),
                                    onPressed: ()async{
                                           return showDialog(context: context, builder:(context){
                                             return AlertDialog(
                                               insetPadding: EdgeInsets.all(20),
                                               actionsAlignment:MainAxisAlignment.spaceEvenly ,
                                               titlePadding: EdgeInsets.all(30),

                                               title: Text('Confirm product removal'),
                                               titleTextStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),
                                              actions: [

                                                ElvetBouttenCansel(),
                                                ElevatedButton(onPressed:()async{
                                                  showDialog(context: context, builder:(context){
                                                    return AlertDialog(
                                                      actions: [


                                                        ElvetBouttenCansel(),
                                                        ElevatedButton(onPressed:()async{
                                                          await  A.deletProdects(data: {
                                                            'Relations':'${DataMAN[i].relations}',
                                                            'sections':'${DataMAN[i].sections}',
                                                            'id':'${DataMAN[i].id}',
                                                            'nameimage':'${DataMAN[i].image}'
                                                          }).then((value){
                                                            var delet =  DataMAN.indexWhere((element) => element.id==DataMAN[i].id );
                                                            DataMAN.removeAt(delet);
                                                            A.uu();


                                                          }
                                                          );
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


                                    })
                                    ,radius: 21,backgroundColor:  Colors.redAccent),
                                SizedBox(height: 7,),

                                CircleAvatar(child: IconButton(icon:Icon(Icons.update,size: 27,color:Colors.white,),
                                    onPressed: ()async {
                                      await h.GetColorsPod(IdProd:'${DataMAN[i].id}');
                                      Get.toNamed('UpdetProdctsAD',arguments: {
                                        'id':DataMAN[i].id,
                                        'relations':DataMAN[i].relations,
                                        'priec':DataMAN[i].priec,
                                        'oldPriec':DataMAN[i].oldPriec,
                                        'name':DataMAN[i].name,
                                        'discount':DataMAN[i].discount,
                                        'image':DataMAN[i].image,
                                        'description':DataMAN[i].description,
                                        'color':DataMAN[i].color,
                                        'size':DataMAN[i].size,
                                        'inCart':DataMAN[i].inCart,
                                        'inFavorites':DataMAN[i].inFavorites,
                                        'iduser':x.userdata.data!.id,
                                        'sections':DataMAN[i].sections,
                                      });

                                    }

                                ),radius: 21,backgroundColor: Colors.redAccent),

                              ],),),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 8,),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('${DataMAN[i].priec}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepOrangeAccent)),
                                Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                              ],
                            ),
                            SizedBox(width: 7,),
                            if(DataMAN[i].discount!=0)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('${DataMAN[i].oldPriec}',
                                      style: TextStyle(
                                          decorationThickness:2,
                                          decorationColor: Colors.blue,
                                          decoration:TextDecoration.lineThrough,fontWeight: FontWeight.w800,fontSize: 18,color: Colors.blue)),
                                  Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                                ],
                              ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Container(
                          //color: Colors.orange,
                          width: 160,
                          height:90,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text("${DataMAN[i].description}",
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),overflow:TextOverflow.ellipsis,maxLines: 3,),
                          ),
                        ),


                      ],
                    ),
                  ),





                ],
              ),
            ),),






          ],
        ),
      ),
    ) ;



  }
}