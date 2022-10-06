

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/controllers/ControllerHome.dart';

import '../Url.dart';
import '../Core/MyClass/Widgetss/Widgets.dart';
import '../controllers/ControlerSign.dart';
import '../controllers/ControllerCartAndFov.dart';

class Home extends StatelessWidget{
  ControllerHome c = Get.find();

  ControlerSign x = Get.find();

 // servises s =  Get.put(servises());

 // ControllerGirls g = Get.put(ControllerGirls());
var fbm = FirebaseMessaging.instance;

  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }


  @override
  Widget build(BuildContext context) {
   List imagesssss=[
    'images/Offers.jpg',
     'images/Offers.jpg',
     'images/Offers.jpg',
     'images/Offers.jpg',
   ];
    return
      AdvancedDrawer(
       backdropColor: Colors.blueGrey,
       controller: _advancedDrawerController,
       animationCurve: Curves.easeInOut,
       animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: false,
    // openScale: 1.0,
    disabledGestures: false,
    childDecoration: const BoxDecoration(
    // NOTICE: Uncomment if you want to add shadow behind the page.
    // Keep in mind that it may cause animation jerks.
    // boxShadow: <BoxShadow>[
    //   BoxShadow(
    //     color: Colors.black12,
    //     blurRadius: 0.0,
    //   ),
    // ],
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),
    drawer: DrawerNew(),
    child:Scaffold(

      backgroundColor: Colors.white,//Colors.blueGrey[600],
      appBar: AppBar(
        backgroundColor: Colors.white10,
        foregroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: _handleMenuButtonPressed,
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: Icon(
                  value.visible ? Icons.clear : Icons.menu,  size: 30,
                  key: ValueKey<bool>(value.visible),
                ),
              );
            },
          ),
        ),

title: Text('Fashionable',style: TextStyle(letterSpacing: 0.5,fontSize: 27,fontWeight: FontWeight.bold,color: Colors.black),),

      ),

      body:
      SingleChildScrollView(
        child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 7,vertical: 8),
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.blueGrey),),
        SizedBox(height: 5,),
         Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Text('See all',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.lightBlueAccent)),
             SizedBox(width: 3,),
             Icon(Icons.double_arrow,color: Colors.lightBlueAccent,size: 14,)
           ],
         ),
         SizedBox(height: 10,),
              FutureBuilder(
                future:c.getCategories() ,
                builder: (ctx,SnapShot)=>
                SnapShot.connectionState==ConnectionState.waiting?
                Center(child: CircularProgressIndicator()): Container(
           width: double.infinity,
           height: 180,
           child:

                ListView(
                   scrollDirection: Axis.horizontal,
                    children: [
                         Catgre(name:'${c.categore.data![0].cName}' ,onTap:()async{
                           if(await CheckIntrnet()){
                             Get.toNamed('/HomMAN');
                           }else{
                             ErorrSnackbar(color: Colors.black,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:70,color: Colors.red ,) );
                           }

                         } ,image:'${c.categore.data![0].cImage}' ),
                         Catgre(name:'${c.categore.data![1].cName}' ,onTap:()async{
                           if(await CheckIntrnet()){
                             Get.toNamed('/HomGirls');
                           }else{
                             ErorrSnackbar(color: Colors.black,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:70,color: Colors.red ,) );
                           }

                         } ,image:'${c.categore.data![1].cImage}' ),
                         Catgre(name:'${c.categore.data![2].cName}' ,onTap:()async{
                           if(await CheckIntrnet()){
                             Get.toNamed('/HomKids');
                           }else{
                             ErorrSnackbar(color: Colors.black,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:70,color: Colors.red ,) );
                           }
                           //
                         } ,image:'${c.categore.data![2].cImage}' ),
                         Catgre(name:'${c.categore.data![3].cName}' ,onTap:()async{
                           if(await CheckIntrnet()){
                             Get.toNamed('/HomWomens');
                           }else{
                             ErorrSnackbar(color: Colors.black,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:70,color: Colors.red ,) );
                           }
                           //
                         } ,image:'${c.categore.data![3].cImage}' ),
                         Catgre(name:'${c.categore.data![4].cName}' ,onTap:()async{} ,image:'${c.categore.data![4].cImage}' ),
                         Catgre(name:'${c.categore.data![5].cName}' ,onTap:()async{} ,image:'${c.categore.data![5].cImage}' ),
          ],
                   ),
              ),
         ),
              SizedBox(height: 15),
              CarouselSlider(
                options: CarouselOptions(
                    enlargeCenterPage:true,
                    autoPlay: true,
                    height: 180.0),
                items: imagesssss.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: double.infinity,
                          //margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Image.asset(i,fit: BoxFit.fill,)
                      );
                    },
                  );
                }).toList(),
              ),
             SizedBox(height: 15,),
             Text('Latest Fashion',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.blueGrey),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('See all',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.lightBlueAccent)),
                  SizedBox(width: 3,),
                  Icon(Icons.double_arrow,color: Colors.lightBlueAccent,size: 14,)
                ],
              ),
              SizedBox(height: 5,),
              FutureBuilder(
                future:c.getprodectsdiscount() ,
                builder: (ctx,Snapshot)=>
                Snapshot.connectionState==ConnectionState.waiting?
                Center(child:CircularProgressIndicator()):
                Container(
                              height: 330,
                               width: double.infinity,

                               child:
                                  ListView.builder(
                                      scrollDirection:Axis.horizontal,
                                    // physics: NeverScrollableScrollPhysics(),
                                // shrinkWrap: true,

                                 //  scrollDirection: Axis.vertical,
                                 itemCount: c.productsdiscount.data!.length,
                                 itemBuilder:(ctx,i){
                                   return Padding(
                                     padding: const EdgeInsets.only(left: 2,right: 5),
                                     child: InkWell(
                                       onTap: ()async{
                                         await c.GetColorsPod(IdProd:'${c.productsdiscount.data![i].id}');
                                         Get.toNamed('/ViewPro',arguments: {
                                           'id':c.productsdiscount.data![i].id,
                                           'relations':c.productsdiscount.data![i].relations,
                                           'priec':c.productsdiscount.data![i].priec,
                                           'oldPriec':c.productsdiscount.data![i].oldPriec,
                                           'name':c.productsdiscount.data![i].name,
                                           'discount':c.productsdiscount.data![i].discount,
                                           'image':c.productsdiscount.data![i].image,
                                           'description':c.productsdiscount.data![i].description,
                                           'color':c.productsdiscount.data![i].color,
                                           'size':c.productsdiscount.data![i].size,
                                           'inCart':c.productsdiscount.data![i].inCart,
                                           'inFavorites':c.productsdiscount.data![i].inFavorites,
                                           'iduser':x.userdata.data!.id,
                                           'sections':c.productsdiscount.data![i].sections,
                                         });
                                        await c.argeoment();
                                       },
                                       child: Padding(
                                         padding: const EdgeInsets.only(right: 5,),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Container(
                                               decoration: BoxDecoration(

                                                 border:Border.all(color: Colors.black38,width:3),
                                                 borderRadius: BorderRadius.circular(25),
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
                                                           image: '${urlImages}/${c.productsdiscount.data![i].image}',
                                                           imageErrorBuilder: (c,o,s)=>Image.asset('images/error.png',fit: BoxFit.fill,),)
                                                           ,height: 160,width: double.infinity,),

                                                          Row(

                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: [
                                                             if(c.productsdiscount.data![i].discount!=0)
                                                             Container(child: Text('desciont',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white),),decoration: BoxDecoration(

                                                               borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight: Radius.circular(50),topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
                                                              // border: Border.all(color: Colors.black,width: 1),
                                                                 color:Colors.deepOrangeAccent,

                                                             ),
                                                             padding: EdgeInsets.all(4),
                                                             margin: EdgeInsets.only(left: 1),
                                                             ),

                                                             Spacer(),
                                                             Column(
                                                               mainAxisAlignment: MainAxisAlignment.start,
                                                               children: [
                                                                 GetBuilder<ControllerHome>(
                                                                    builder:(t)=>
                                                                     CircleAvatar(child: IconButton(icon:Icon(Icons.shopping_cart,size: 27,color: Colors.black,),
                                                                         onPressed: ()async{
                                                                           await    t.cart(c.productsdiscount.data![i].id).then((value) {
                                                                          t.addANDdeletCart(
                                                                             idprodect:'${c.productsdiscount.data![i].id}',
                                                                             iduser:'${x.userdata.data!.id}',
                                                                             sections: '${c.productsdiscount.data![i].sections}',
                                                                             relashin: '${c.productsdiscount.data![i].relations}'
                                                                         );
                                                                       });


                                                                         })
                                                                         ,radius: 21,backgroundColor: (t.iscart[c.productsdiscount.data![i].id!]==t.nolike || t.iscart[c.productsdiscount.data![i].id!] == null )? Colors.black12:Colors.redAccent[400])),
                                                                 SizedBox(height: 7,),
                                                                GetBuilder<ControllerCartAndFov>(
                                                                  init:ControllerCartAndFov(),
                                                                            builder:(fo)=>
                                                                   GetBuilder<ControllerHome>(
                                                                         init:ControllerHome(),
                                                                     builder:(l)=>
                                                                       CircleAvatar(child: IconButton(icon:Icon(Icons.favorite_border,size: 27,color:Colors.black,),
                                                                           onPressed: ()async{
                                                                             await l.fovret(c.productsdiscount.data![i].id).then((value) {
                                                                               l.setanddeletefov(
                                                                                   sectionss:'${c.productsdiscount.data![i].sections}',
                                                                                   iduser: '${x.userdata.data!.id}',
                                                                                   idprodect: '${c.productsdiscount.data![i].id}',
                                                                                   relashin: '${c.productsdiscount.data![i].relations}'
                                                                               );
                                                                             });



                                                                           }
                                                                       ),radius: 21,backgroundColor:(l.isfovret[c.productsdiscount.data![i].id!]==l.nolike || l.isfovret[c.productsdiscount.data![i].id!] == null )? Colors.black12:Colors.cyan),
                                                                   ),
                                                                ),
                                                               ],
                                                             ),
                                                           ],
                                                         ),

                                                       ],
                                                     ),
                                                   SizedBox(height: 8,),
                                                   Center(
                                                     child: Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         Row(
                                                           mainAxisAlignment: MainAxisAlignment.center,
                                                           children: [
                                                             Row(
                                                               mainAxisAlignment: MainAxisAlignment.center,
                                                               crossAxisAlignment: CrossAxisAlignment.end,
                                                               children: [
                                                                 Text('${c.productsdiscount.data![i].priec}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.deepOrangeAccent)),
                                                                 Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                                                               ],
                                                             ),
                                                             SizedBox(width: 15,),
                                                             if(c.productsdiscount.data![i].discount!=0)
                                                             Row(
                                                               mainAxisAlignment: MainAxisAlignment.center,
                                                               crossAxisAlignment: CrossAxisAlignment.end,
                                                               children: [
                                                                 Text('${c.productsdiscount.data![i].oldPriec}',
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
                                                             child: Text("${c.productsdiscount.data![i].description}",
                                                               style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),overflow:TextOverflow.ellipsis,maxLines: 3,),
                                                           ),
                                                         )

                                                       ],
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                           ),
                                             ),

                                           ],
                                         ),
                                       ),
                                     ),
                                   );
                         }
                         ),
                               ),
                             )
            ],
          ),
        ),
      ) ,
    )
      );
  }
}
