import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/controllers/ControllerGirles.dart';
import 'package:testapi/controllers/ControllerHome.dart';
import '../../../../Data/Model/ModelGirls.dart' as modelGirl;
import '../../../Url.dart';
import '../../../controllers/ControllerMan.dart';
import 'Widgets.dart';

class listviewGirlsH extends StatelessWidget {
  final List<modelGirl.Data> DataGirls;
  final int i;


  listviewGirlsH(this.DataGirls,this.i);
 ControllerGirls g = Get.find();
  ControllerHome h = Get.find();

  @override
  Widget build(BuildContext context) {
    return


      InkWell(
        onTap: ()async{
         if(await CheckIntrnet()){
           await  h.GetColorsPod(IdProd:'${DataGirls[i].id}');
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
             'iduser':DataGirls[i].id,
             'sections':DataGirls[i].sections,
           });

           await  g.argeoment();
         }else{
           ErorrSnackbar(color: Colors.black,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:70,color: Colors.red ,) );
         }
        },
        child: Row(
          children: [
            Container(
              height: 200,
              width: 200,
              // color:Colors.deepOrangeAccent,
              child:Column(
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
                      if(DataGirls[i].discount!=0)
                        Descont(),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${DataGirls[i].priec}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepOrangeAccent)),
                      Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                      SizedBox(width: 8,),
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

                ],
              ),

            ),
            SizedBox(width: 20,),
          ],
        ),
      );
  }
}