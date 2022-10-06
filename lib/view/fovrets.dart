
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Url.dart';
import '../controllers/ControlerSign.dart';
import '../controllers/ControllerHome.dart';

class fovret extends StatelessWidget {
  ControllerHome c = Get.find();

  ControlerSign x = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHome>(
      init: ControllerHome(),
      builder:(l)=>
       Scaffold(
        appBar: AppBar(
          elevation: 4,
          shadowColor:Colors.blueGrey ,
          title: Text('Favorites',style: TextStyle(letterSpacing: 0.5,fontSize: 27,fontWeight: FontWeight.bold,),),
        ),
        body: l.fovbool==false ?  Padding(
            padding: EdgeInsets.symmetric(vertical: 100,horizontal: 10),
            child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.favorite,size: 275,color: Colors.blueGrey,),
             SizedBox(height: 10,),
             Text("You can't find your favorite products !",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.blueGrey,),textAlign:TextAlign.center ,)
           ],
         )):

          SingleChildScrollView(
            child: Container(
              //height: 600,
              width: double.infinity,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing:2,
                    childAspectRatio:2.09/3.5,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: c.Favorites!.data!.length,
                  itemBuilder:(ctx,i){
                    //  if(c.Favorites!.data! !=null)
                    //c.bb(c.Prodectsmo.data![i].id);
                    return InkWell(
                      onTap: (){

                        Get.toNamed('/ViewPro',arguments: {
                          'id':c.Favorites!.data![i].id,
                          'sections':c.Favorites!.data![i].sections,
                          'relations':c.Favorites!.data![i].relations,
                          'priec':c.Favorites!.data![i].priec,
                          'oldPriec':c.Favorites!.data![i].oldPriec,
                          'name':c.Favorites!.data![i].name,
                          'discount':c.Favorites!.data![i].discount,
                          'image':c.Favorites!.data![i].image,
                          'description':c.Favorites!.data![i].description,
                          'color':c.Favorites!.data![i].color,
                          'size':c.Favorites!.data![i].size,
                          'inCart':c.Favorites!.data![i].inCart,
                          'inFavorites':c.Favorites!.data![i].inFavorites,
                          'iduser':x.userdata.data!.id,
                        });
                        c.argeoment();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5,left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(

                                border:Border.all(color: Colors.blueGrey,width:2),
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
                                      Container(child: Image.network('${urlImages}/${c.Favorites!.data![i].image}',fit: BoxFit.fill,),height: 210,width: double.infinity,),
                                      Row(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if(c.Favorites!.data![i].discount!=0)
                                            Container(child: Text('desciont',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10),
                                              // border: Border.all(color: Colors.black,width: 1),
                                              color:Colors.redAccent,

                                            ),
                                              padding: EdgeInsets.all(3),),
                                          Spacer(),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              InkWell(onTap: ()async{

    await c.cart(c.Favorites!.data![i].id!).then((value) {
    c.addANDdeletCart(
    idprodect:'${c.productsdiscount.data![i].id}',
    iduser:'${x.userdata.data!.id}',
    sections: '${c.productsdiscount.data![i].sections}',
    relashin: '${c.productsdiscount.data![i].relations}'
    );
    });
                                              },child: CircleAvatar(child: Icon(Icons.shopping_cart,size: 25,color: Colors.black,),radius: 19,backgroundColor:( c.iscart[c.Favorites!.data![i].id!]==c.nolike || c.iscart[c.Favorites!.data![i].id!] == null )? Colors.black12:Colors.redAccent[400])),
                                              SizedBox(height: 7,),
                                               CircleAvatar(child: IconButton(icon:Icon(Icons.favorite_border,size: 27,color:Colors.black,),
                                                        onPressed: ()async{
                                                      await l.fovret(c.Favorites!.data![i].id!);
                                                          await l.setanddeletefov(
                                                            sectionss: '${c.Favorites!.data![i].sections}',
                                                              iduser: '${x.userdata.data!.id}',
                                                              idprodect: '${c.Favorites!.data![i].id}',
                                                              relashin: '${c.Favorites!.data![i].relations}',

                                                          );







                                                          //
                                                        }
                                                    ),radius: 21,backgroundColor:l.isfovret[c.Favorites?.data![i].id!]==l.nolike || l.isfovret[c.Favorites?.data![i].id!] == null ? Colors.black12:Colors.cyan),




                                            ],),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 8,),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("${c.Favorites!.data![i].name}",
                                          style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                                        SizedBox(height:10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text('${c.Favorites!.data![i].priec}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.deepOrangeAccent)),
                                                Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                                              ],
                                            ),
                                            SizedBox(width: 7,),
                                            if(c.Favorites!.data![i].discount!=0)
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text('${c.Favorites!.data![i].oldPriec}',
                                                      style: TextStyle(
                                                          decorationThickness:2,
                                                          decorationColor: Colors.blue,
                                                          decoration:TextDecoration.lineThrough,fontWeight: FontWeight.w800,fontSize: 20,color: Colors.blue)),
                                                  Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                                                ],
                                              ),
                                          ],
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
                    );
                  }),

            ),
          )






      ),
    );
  }
}
