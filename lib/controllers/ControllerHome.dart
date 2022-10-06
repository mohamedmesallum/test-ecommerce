
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/Core/Function/HindlinData.dart';
import 'package:testapi/Core/MyClass/StatusRequest.dart';
import 'package:testapi/Data/Model/modeloders.dart';
import 'package:testapi/Data/Model/modieTO.dart';

import 'package:testapi/Url.dart';
import 'package:testapi/controllers/ControlerSign.dart';

import '../Data/DataSours/Remote/Orders/FunctionOrders.dart';
import '../Data/Model/Colorsprodects.dart';
import '../Data/Model/Favorites.dart';
import '../Data/Model/ModielProdects.dart';
import '../Data/Model/WitingOredrs.dart';
import '../Core/MyClass/Widgetss/Widgets.dart';

 abstract class HomeC extends GetxController{

   argeoment();
   GetColorsPod({required String IdProd});
   addOrders();
   addDataOrders({required Map data});
   GetOrderss();
   GetdattOredrs({required String idodred});
   setanddeletefov({required String iduser,
     required String idprodect,required String relashin,required String sectionss});
   fovret(id);
   getFov({required String idd});
   fovtfalse();
   fovttrue();
   cart(id);
   addANDdeletCart({required String iduser ,required String idprodect,
     required String relashin,required String sections});
   getCart({required String iduser});
   getlentheCart();
   carttrue();
   cartfalse();
   gettotal();
   getprodectsdiscount();
   getCategories();
   gettotalOrders();

}
class ControllerHome extends HomeC {
  ControlerSign si = Get.find();
  FunctionOrders _functionOrders= FunctionOrders(Get.find());
  late StatusRequest statusRequest;
  late prodects productsdiscount;
  late categories categore;
  orderswaiting? dataWOredrs;
  modelfavorites?  Favorites;
  modelfavorites? Cart;
  Oredrs? oredrsss;
  late colorsprodect ColorsProdects;
  Map<dynamic,dynamic>isfovret={};
  Map<dynamic,dynamic>iscart={};
  var  TotalCart ;
  var lentheCart = 0;
  var like = 1;
  var nolike = 0;
  bool Cartbool = true ;
  bool fovbool =  true;
  bool orders= false;
  var idorderr;
  bool Colorsbool= false;

  @override
  void onInit() async{
    if (si.userdata.data!.id != null) {
    await  getFov(idd:si.userdata.data!.id!.toString());
     await getCart(iduser:si.userdata.data!.id!.toString());
      super.onInit();
    }
  }

  int? id;
  int? priec;
  int? oldPriec;
  int? discount;
  String? image;
  String? name;
  String? description;
  int? inFavorites;
  int? inCart;
  int? relations;
  String? color;
  String? size;
  int?sections;
  int? iduser;
  argeoment(){
    id=Get.arguments['id'];
    priec=Get.arguments['priec'];
    oldPriec=Get.arguments['oldPriec'];
    discount=Get.arguments['discount'];
    image=Get.arguments['image'];
    name=Get.arguments['name'];
    description=Get.arguments['description'];
    inFavorites=Get.arguments['inFavorites'];
    inCart=Get.arguments['inCart'];
    color=Get.arguments['color'];
    size=Get.arguments['size'];
    relations=Get.arguments['relations'];
    iduser=Get.arguments['iduser'];
    sections=Get.arguments['sections'];
update();
  }

  Future GetColorsPod({required String IdProd})async{
try{
  update();
  var resbons = await http.post(Uri.parse(UrlgetColors,),body: {
    'id':IdProd,
  }) ;
  if(resbons.statusCode==200 ||resbons.statusCode==201){
    var resboonsbody = jsonDecode(resbons.body)as Map<String,dynamic>;
    if(resboonsbody["Massege"]=='true'){
      ColorsProdects = colorsprodect.fromJson(resboonsbody);
      print('Colorsssssssssssssssssssssssssssssssssssssssssss whiet');
      print(ColorsProdects.data!.white);
      update();
      Colorsbool= true;
      return ColorsProdects;
    }else if(resboonsbody["Massege"]=='false'){
      Colorsbool= false;
      update();
print('not colorssssssssssssssss');
    }
  }else{
    update();
    print('ERorrrrrrrrrrrrrr statues code');
  }
}catch(e){
  update();
  print('ERORRRRRRRRR CATSH COLORS ');
  print(e.toString());
}
update();
   }

  
  
//test
Future addOrders()async{
  try{
    if(await CheckIntrnet()){
      update();
      orders=true;
      var resbons = await http.post(Uri.parse(Urltestorder),body:{
        'id_user':'${si.userdata.data!.id}',
        'totalpriec':'${TotalCart}',
        'tiem':DateTime.now().toString(),
        'id_addres':'${si.idaddres}'
      });
      if(resbons.statusCode==200 || resbons.statusCode==201){

        var resbonsbode = jsonDecode(resbons.body);
        if(resbonsbode['Massege']=='true'){
          update();
          idorderr = resbonsbode['id'];
         print(resbonsbode['id']);
        }else{
          orders=false;
          ErorrSnackbar(color: Colors.redAccent,masseg: 'Failed please try again',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
          update();
        }
      }else{
        orders=false;
        ErorrSnackbar(color: Colors.redAccent,masseg: 'Failed please try again',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
        update();
      }
    }else{
      orders=false;
      ErorrSnackbar(color: Colors.redAccent,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
      update();
    }
    update();
  }catch(e){
    orders=false;
    print('catsh erorr add Orders ');
    print(e.toString());
  }
update();
}
//test
  Future addDataOrders({required Map data})async{
 try{
   if(await CheckIntrnet()){
     update();
     orders=true;
     var resbons = await http.post(Uri.parse(Urltestdataorders),body: data);
     if(resbons.statusCode==200 || resbons.statusCode==201){
       var resbonsbody= jsonDecode(resbons.body);
       if(resbonsbody['Massege']=='true'){
         orders=false;
         ErorrSnackbar(color: Colors.green,masseg: 'Order has been sent successfully',Icon:Icon(Icons.done,size:40,color: Colors.green ,) );
         update();
       }
       orders=false;
       update();
     }else{
       orders=false;
       ErorrSnackbar(color: Colors.redAccent,masseg: 'Failed please try again',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
       update();
     }
   }else{
     orders=false;
     ErorrSnackbar(color: Colors.redAccent,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
     update();
   }

   update();
 }catch(e){
   orders=false;
   print('catch erorr add data orders ');
   print(e.toString());
   update();
 }
 update();
  }
 Future GetOrderss()async{
   statusRequest=StatusRequest.loading;
   var resbons = await _functionOrders.GetOrders();
   statusRequest=hindlinData(resbons);
   if(StatusRequest.success==statusRequest){
     if(resbons['Massege']=='true'){
       oredrsss=Oredrs.fromJson(resbons);
       print('lengthhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh data');
       print(oredrsss!.data!.length);
       print('lengthhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh data receive');
       print(oredrsss!.receive!.length);
     }else{
       statusRequest=StatusRequest.failure;
     }
   }
   update();

 }
  Future GetdattOredrs({required String idodred})async{
  update();
  statusRequest=StatusRequest.loading;
    if(await CheckIntrnet()){
  var resbons = await _functionOrders.getWOrders(numberOrder:idodred);
  statusRequest= hindlinData(resbons);
  if(StatusRequest.success == statusRequest){
    if(resbons['Massege']=='true'){
      print(resbons['data']);
      dataWOredrs =orderswaiting.fromJson(resbons);
      print('donnnnnnnnnnnnnnnnnnnnnnnnnnnn');
      print(dataWOredrs!.data!.length);
      gettotalOrders();


     print(dataWOredrs!.data!.length);
    }else{
      statusRequest=StatusRequest.failure;
    }
  }

update();
    }
    update();
  }


Future setanddeletefov({required String iduser,
  required String idprodect,required String relashin,required String sectionss})async{

  try{
    var resbons = await http.post(Uri.parse(favorites),body: {
      'iduser':iduser,
      'idprodect':idprodect,
      'relashin':relashin,
      'sections':sectionss,
    });
    await getFov(idd: iduser);
    var resbonsbody = json.decode(resbons.body)as Map<String,dynamic>;
    print(resbonsbody['Massege']);


    update();
  }catch(e){
    print('erorr catshhhhhhhhhhh');
    print(e.toString());
    update();
  }
  update();
}
 Future fovret(id)async{
    if(isfovret[id]==nolike || isfovret[id]==null){
     isfovret.addAll({
       id:like,
     });
     update();
  }else {
      isfovret.addAll({
       id:nolike,
      });
      update();
  }
    update();
}
  Future getFov({required String idd})async{
    try{
      var resbons = await http.post(Uri.parse(getfavorites),body: {
        'iduser':idd,
      });
      var resbonsbody = jsonDecode(resbons.body)as Map<String,dynamic>;
      if(resbonsbody['Massege']=='true'){
        Favorites=modelfavorites.fromJson(resbonsbody);
        if(Favorites != null){
          Favorites!.data!.forEach((element) {
            isfovret.addAll({
              element.id:like,
            });
          });
          fovttrue();
          print(Favorites!.data!.length);
          print('Favorites true');
          update();
        }else{

          print('لاتوجد بينات مفضله');
          update();
        }
      }else{
        fovtfalse();
        print('لاتوجد بينات jjjjjمفضله');
        update();
      }
      update();

    }catch(e){
      print('erorr catsh getFov');
      print(e.toString());
      update();
    }
    update();
  }

  fovtfalse(){
    fovbool=false;
    update();
  }
  fovttrue(){
    fovbool=true;
    update();
  }

  Future cart(id)async{
    if(iscart[id]==nolike || iscart[id]==null){
        iscart.addAll({
          id:like,
        });
        update();
    }else {

        iscart.addAll({
          id:nolike,
        });
        update();
    }
    update();

  }
  Future addANDdeletCart({required String iduser ,required String idprodect,
    required String relashin,required String sections})async{
    try{
      update();
      var resbons =await http.post(Uri.parse(UrladdanddeletCart),body:{
        'iduser':iduser,
        'idprodect':idprodect,
        'relashin':relashin,
        'sections':sections,
      });
      await getCart(iduser: iduser);
      var resbonsbody = jsonDecode(resbons.body)as Map<String,dynamic>;

      print(resbonsbody['Massege']);
      update();
    }catch(e){
      update();
      print('erorr addANDdeletCart ooooooooooooooooooooooooooooooooooooooo');
      print(e.toString());
    }
    update();
  }
  Future getCart({required String iduser})async{
    try{
      var resbons = await http.post(Uri.parse(UrlgetCart),body: {
        'iduser':iduser
      });
      var resbonsbody= jsonDecode(resbons.body)as Map<String,dynamic>;
      if(resbonsbody['Massege']=='true'){
        Cart = modelfavorites.fromJson(resbonsbody);

        if(Cart != null){
          gettotal();
          Cart!.data!.forEach((element) {

            iscart.addAll({

              element.id:like,

            });


          });
          carttrue();
          // gettotal();
          getlentheCart();

          print(Cart!.data!.length);
          print('CART true');
          update();
        }else{

          print('لاتوجد بينات ttttttcart ');
          update();
        }

        update();
      }else{

        print('لاتوجد بينات cart ');
        cartfalse();
      }
    }catch(e){
      print('erorr getCART OOOOOOOOOOOOOOOOOOOOOOOO');
      print(e.toString());
    }
  }
  getlentheCart(){
    update();
    if(Cart!.data!.isNotEmpty){
      lentheCart = Cart!.data!.map((e) => e.count!).reduce((value, element) => value +element );
      print( lentheCart.toString());
      print('jhjhja');
      return lentheCart;

    }else{
      return ;
    }

  }
  carttrue(){
    Cartbool = true;
    update();
  }
  cartfalse(){
    Cartbool = false;
    update();
  }


Future getprodectsdiscount()async{
  //String Url = "http://10.0.2.2/cors/getpro.php";
  try{
    var resbons = await http.get(Uri.parse(getprodectdiscount));
    var resbonsbody=json.decode(resbons.body)as Map<String,dynamic>;
    productsdiscount = prodects.fromJson(resbonsbody);
    print(productsdiscount.data!.length);
    return productsdiscount;
  }catch(e){
    print('Erorr Catch');
    print(e.toString());
  }
}
  Future getCategories()async{
//String Url = "http://10.0.2.2/cors/getcategories.php";
    try{
      var resbons = await http.get(Uri.parse(UrlGCategories),);
      var resbonsbody=json.decode(resbons.body)as Map<String,dynamic>;
      categore =  categories.fromJson(resbonsbody);


      print(categore.data!.length);
    }catch(e){

      print('Erorr Catch');
      print(e.toString());
    }
  }











 var totalOw;
  gettotalOrders(){
    totalOw = dataWOredrs!.data!.map((e) => e.priecprodect! * e.cont!).reduce((value, element) => value +element ).toDouble();
    update();
    return totalOw;
  }
 gettotal(){
  TotalCart = Cart!.data!.map((e) => e.priec! * e.count!).reduce((value, element) => value +element ).toDouble();
update();
return TotalCart;
}


 // Future GetProducts({required String sections ,required String Relations, required prodects model  })async{
  //     try{
  //       var resbons= await http.post(Uri.parse(Urlgetproducts),body: {
  //         'Relations': Relations,
  //         'sections':sections
  //       });
  //       var resbonsbody=jsonDecode(resbons.body)as Map<String,dynamic>;
  //      model=prodects.fromJson(resbonsbody);
  //       print('true Fuincashin Get prodacts shoes man oooooooooooooooooooooooooooooooooo');
  //       print(model.data!.length);
  //       return model;
  //
  //
  //
  //     }catch(e){
  //       print('Erorr Catch GetProducts');
  //       print(e.toString());
  //     }
  //   }


}
