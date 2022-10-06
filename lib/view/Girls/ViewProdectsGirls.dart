import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Url.dart';
import 'package:testapi/controllers/ControllerGirles.dart';
import 'package:testapi/controllers/ControllerHome.dart';

import '../../Core/MyClass/Widgetss/ColorsWidget.dart';




class ViewProdectsGirls extends StatelessWidget {

  ControllerHome H = Get.find();
  ControllerGirls g = Get.find();

  @override
  Widget build(BuildContext context) {
    TextStyle ss = TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,foregroundColor: Colors.black,),
      body:
      SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [

                Container(
                    width: double.infinity,
                    height: 300,
                    child:
                    Container(child:

                    FadeInImage.assetNetwork(
                        fit:BoxFit.cover,
                        placeholder: 'images/FASHION.PNG',
                        image: '${urlImages}/${g.image}')
                      ,height: 160,width: double.infinity,),  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<ControllerHome>(
                    init: ControllerHome(),
                    builder: (l)=>

                        Column(
                          children: [
                            CircleAvatar(child: IconButton(icon:Icon(Icons.shopping_cart,size: 36.5,color: Colors.black,),
                                onPressed: ()async{
                                  await    H.cart(g.id).then((value) {
                                    H.addANDdeletCart(
                                        idprodect:'${g.id}',
                                        iduser:'${g.iduser}',
                                        sections: '${g.sections}',
                                        relashin: '${g.relations}'
                                    );
                                  });


                                })
                                ,radius: 28.5,backgroundColor: (l.iscart[g.id!]==H.nolike || l.iscart[g.id!] == null )? Colors.white:Colors.redAccent[400]),
                            SizedBox(height: 4,),
                            CircleAvatar(
                                child: IconButton(icon:Icon(Icons.favorite_border,size: 36.5,color: Colors.black,),
                                  onPressed: ()async{
                                    l.fovret(g.id
                                    );
                                    //
                                    await H.setanddeletefov(
                                        sectionss: '${g.sections}',
                                        iduser: '${g.iduser}',
                                        idprodect: '${g.id}',
                                        relashin: '${g.relations}'
                                    );


                                  },),
                                radius:28.5,backgroundColor:l.isfovret[g.id]==l.nolike || l.isfovret[g.id] == null  ? Colors.white:Colors.cyan),
                          ],
                        ),
                  ),
                ),

              ], ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Row(
                    children: [
                      SizedBox(height: 8,),
                      Text('${g.name}',style: ss,),
                      Spacer(),
                      if(g.discount!=0)
                        Container(child: Text('desciont',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.black,width: 1),
                          color:Colors.deepOrangeAccent,

                        ),
                          padding: EdgeInsets.all(3),),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Text('${g.description}',style: ss,),
                  //Available sizes
                  SizedBox(height: 8,),
                  if(H.Colorsbool==true)
                    Text('Color :',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent),),
                  SizedBox(height: 8,),
                  if(H.Colorsbool==true)
                    if(g.id==H.ColorsProdects.data!.id)
                      ColorsWidgets(),

                  SizedBox(height: 8,),
                  Text('Available sizes :',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent),),
                  SizedBox(height: 4,),
                  Text('${g.size}',style: ss,),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          color:Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),

                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('${g.priec}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24,color: Colors.white)),
                            Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      if(g.discount!=0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('${g.oldPriec}',
                                style: TextStyle(
                                    decorationThickness:2.3,
                                    decorationColor: Colors.redAccent[400],
                                    decoration:TextDecoration.lineThrough,fontWeight: FontWeight.w800,fontSize: 20,color: Colors.black)),
                            Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),

            Center(child: GetBuilder<ControllerHome>(
              builder: (l)=>
                  Card(
                    elevation: 6,

                    shadowColor: Colors.blueGrey,
                    child:ElevatedButton.icon(icon: Icon(Icons.shopping_cart,size: 28,),onPressed: ()async{

                      await    H.cart(g.id).then((value) {
                        H.addANDdeletCart(
                            idprodect:'${g.id}',
                            iduser:'${g.iduser}',
                            sections: '${g.sections}',
                            relashin: '${g.relations}'
                        );
                      });

                    },label:
                    Text(l.iscart[g.id]==l.nolike || l.iscart[g.id] == null  ?'Add to cart': 'Delet from cart ' ,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Colors.deepOrangeAccent),

                        padding: MaterialStateProperty.all(EdgeInsets.only(left: 45,right:45,top: 10,bottom: 10))
                    ),) ,),
            )),
          ],
        ),
      ),


    );
  }
}