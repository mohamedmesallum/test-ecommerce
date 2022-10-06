
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/Url.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../controllers/ControlerSign.dart';
import '../../../../../controllers/ControllerHome.dart';
import '../../../../../controllers/ControllerMan.dart';
import '../../../../Data/Model/ModielProdects.dart' as ModelP;
import 'Widgets.dart';

class WidgetMan extends StatelessWidget {
final List<ModelP.Data> DataMAN;
final int i;

WidgetMan(this.DataMAN,this.i);
  ControllerMan c = Get.find();
 ControlerSign x = Get.find();
 ControllerHome h =Get.find();
  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: ()async{
      if(await CheckIntrnet()){
        await h.GetColorsPod(IdProd:'${DataMAN[i].id}');
        Get.toNamed('/ShowPdMan',arguments: {
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
        await c.argeoment();
      }else{
        ErorrSnackbar(color: Colors.black,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:70,color: Colors.red ,) );

      }
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
                                CircleAvatar(child: IconButton(icon:Icon(Icons.shopping_cart,size: 27,color: Colors.black,),
                                    onPressed: ()async{
                                      await    l.cart(DataMAN[i].id).then((value) {
                                        l.addANDdeletCart(
                                            idprodect:'${DataMAN[i].id}',
                                            iduser:'${x.userdata.data!.id}',
                                            sections: '${DataMAN[i].sections}',
                                            relashin: '${DataMAN[i].relations}'
                                        );
                                      });


                                    })
                                    ,radius: 21,backgroundColor: (l.iscart[DataMAN[i].id!]==l.nolike || l.iscart[DataMAN[i].id!] == null )? Colors.black12:Colors.redAccent[400]),
                                SizedBox(height: 7,),

                                CircleAvatar(child: IconButton(icon:Icon(Icons.favorite_border,size: 27,color:Colors.black,),
                                    onPressed: ()async {
                                      await l.fovret(
                                          DataMAN[i].id).then((value) {
                                        l.setanddeletefov(
                                            sectionss: '${DataMAN[i].sections}',
                                            iduser: '${x.userdata.data!.id}',
                                            idprodect: '${DataMAN[i].id}',
                                            relashin: '${DataMAN[i].relations}'
                                        );
                                      });
                                    }

                                ),radius: 21,backgroundColor:(l.isfovret[DataMAN[i].id!]==l.nolike || l.isfovret[DataMAN[i].id!] == null )? Colors.black12:Colors.cyan),

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
                        )

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