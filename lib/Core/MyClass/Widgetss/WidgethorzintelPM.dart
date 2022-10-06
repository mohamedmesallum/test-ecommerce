
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/controllers/ControllerHome.dart';
import '../../../../Data/Model/ModielProdects.dart' as ModelP;
import '../../../Url.dart';
import '../../../controllers/ControllerMan.dart';
import 'Widgets.dart';

class ListViewHorz extends StatelessWidget {
  final List<ModelP.Data> DataMAN;
  final int i;

  ListViewHorz(this.DataMAN,this.i);
  ControllerMan c = Get.find();
  ControllerHome h = Get.find();

  @override
  Widget build(BuildContext context) {
    return

      InkWell(
      onTap: ()async{
if(await CheckIntrnet()){
  await  h. GetColorsPod(IdProd:'${DataMAN[i].id}');
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
    'iduser':DataMAN[i].id,
    'sections':DataMAN[i].sections,
  });

  await c.argeoment();
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
                      image: '${urlImages}/${DataMAN[i].image}',
                      imageErrorBuilder: (c,o,s)=>Image.asset('images/error.png',fit: BoxFit.fill,),)
                      ,height: 160,width: double.infinity,),
                    if(DataMAN[i].discount!=0)
                      Descont(),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${DataMAN[i].priec}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepOrangeAccent)),
                    Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                 SizedBox(width: 8,),
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

              ],
            ),

          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}
