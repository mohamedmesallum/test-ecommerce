
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/Url.dart';
import 'package:testapi/controllers/ControllerGirles.dart';

import '../../../../../controllers/ControlerSign.dart';
import '../../../../../controllers/ControllerHome.dart';
import '../../../../../controllers/ControllerMan.dart';
import '../../../../Data/Model/ModelGirls.dart' as ModelGigl;
import 'Widgets.dart';

class WidgetGirls extends StatelessWidget {
  final List< ModelGigl.Data> DataGirls;
  final int i;


  WidgetGirls(this.DataGirls,this.i);

  ControlerSign x = Get.find();
  ControllerHome h =Get.find();
  ControllerGirls g = Get.find();
  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: ()async{
        if(await CheckIntrnet()){
          await h.GetColorsPod(IdProd:'${DataGirls[i].id}');
          Get.toNamed('/ViewProdectsGirls',arguments: {
            'id':DataGirls[i].id,
            'relations':DataGirls[i].relations,
            'priec':DataGirls[i].priec,
            'oldPriec':DataGirls[i].oldPriec,
            'name':DataGirls[i].name,
            'discount':DataGirls[i].discount,
            'image':DataGirls[i].image,
            'description':DataGirls[i].description,
            'color':DataGirls[i].color,
            'size':DataGirls[i].size,
            'inCart':DataGirls[i].inCart,
            'inFavorites':DataGirls[i].inFavorites,
            'iduser':x.userdata.data!.id,
            'sections':DataGirls[i].sections,
          });
         await g.argeoment();
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
                          image: '${urlImages}/${DataGirls[i].image}',
                      imageErrorBuilder: (c,o,s)=>Image.asset('images/error.png',fit: BoxFit.fill,),)
                        ,height: 160,width: double.infinity,),
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(DataGirls[i].discount!=0)
                            Descont(),
                          Spacer(),
                          GetBuilder<ControllerHome>(
                            init:ControllerHome(),
                            builder:(l)=>  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(child: IconButton(icon:Icon(Icons.shopping_cart,size: 27,color: Colors.black,),
                                    onPressed: ()async{
                                      await    l.cart(DataGirls[i].id).then((value) {
                                        l.addANDdeletCart(
                                            idprodect:'${DataGirls[i].id}',
                                            iduser:'${x.userdata.data!.id}',
                                            sections: '${DataGirls[i].sections}',
                                            relashin: '${DataGirls[i].relations}'
                                        );
                                      });


                                    })
                                    ,radius: 21,backgroundColor: (l.iscart[DataGirls[i].id!]==l.nolike || l.iscart[DataGirls[i].id!] == null )? Colors.black12:Colors.redAccent[400]),
                                SizedBox(height: 7,),

                                CircleAvatar(child: IconButton(icon:Icon(Icons.favorite_border,size: 27,color:Colors.black,),
                                    onPressed: ()async {
                                      await l.fovret(
                                          DataGirls[i].id).then((value) {
                                        l.setanddeletefov(
                                            sectionss: '${DataGirls[i].sections}',
                                            iduser: '${x.userdata.data!.id}',
                                            idprodect: '${DataGirls[i].id}',
                                            relashin: '${DataGirls[i].relations}'
                                        );
                                      });
                                    }

                                ),radius: 21,backgroundColor:(l.isfovret[DataGirls[i].id!]==l.nolike || l.isfovret[DataGirls[i].id!] == null )? Colors.black12:Colors.cyan),

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
                                Text('${DataGirls[i].priec}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepOrangeAccent)),
                                Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                              ],
                            ),
                            SizedBox(width: 7,),
                            if(DataGirls[i].discount!=0)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('${DataGirls[i].oldPriec}',
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
                            child: Text("${DataGirls[i].description}",
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