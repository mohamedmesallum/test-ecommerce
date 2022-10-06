import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/Core/MyClass/Widgetss/Widgets.dart';

import '../Core/Function/HindlinData.dart';
import '../Core/MyClass/StatusRequest.dart';
import '../Data/DataSours/Remote/CartAndFov/FovrietsGPUD.dart';
import '../Data/Model/Favorites.dart';
//test Cntroller does not work
abstract class CartAndFovirets extends GetxController{
  setanddeletefov({required String iduser,
    required String idprodect,required String relashin,required String sectionss});
  FoviretsMap(id);
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
}
class ControllerCartAndFov extends CartAndFovirets{
  FunctionFov functionfov = FunctionFov(Get.find());
  late StatusRequest statusRequest;
 late modelfavorites  Favorites;
  Map<dynamic,dynamic>isfovret={};
  var like = 1;
  var nolike = 0;
bool fovbool = true;
  @override
  setanddeletefov({required String iduser, required String idprodect,
    required String relashin, required String sectionss})async{
try{
  statusRequest=StatusRequest.loading;
  var resbons = await functionfov.AddAndDeletfov(Data: {
    'iduser':iduser,
    'idprodect':idprodect,
    'relashin':relashin,
    'sections':sectionss,
  });
  statusRequest = hindlinData(resbons);
  print('${statusRequest}');
  if(StatusRequest.success==statusRequest){
    SnackarCARTAndFov(message:'${resbons['Massege']} ' ,color:Colors.black);
    update();
  }
}catch(e){
  ErorrSnackbar(color: Colors.red,masseg: 'An error occurred, try again !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
  print('Catch erorr add and delet Fovirets');
  print(e.toString());
}
   update();
  }

  @override
  FoviretsMap(id) async{
    if(await CheckIntrnet()){
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
    }else{
      ErorrSnackbar(color: Colors.red,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
      update();
    }
    update();

  }

  @override
  getFov({required String idd})async {
try{
  statusRequest=StatusRequest.loading;
  var resbons = await functionfov.GetFovirets(idd: idd);
  statusRequest=hindlinData(resbons);
  if(StatusRequest.success==statusRequest){
    print(statusRequest.toString());
    if(resbons['Massege']=='true'){

      Favorites=modelfavorites.fromJson(resbons);
      print(Favorites.data!.length);
      if(Favorites != null){
        Favorites.data!.forEach((element) {
          isfovret.addAll({
            element.id:like,
          });
        });
        fovttrue();
        print(Favorites.data!.length);
        print('Favorites true');
        update();
      }
    }else{
      fovtfalse();

      print('لاتوجد بينات jjjjjمفضله');
      update();
    }
  }else{
    print(';;');
  }
}catch(e){
  print('erorrr catch get fovvvvvvvvvvvvvvvvvvvvvv');
  print(e.toString());
  update();
}
update();
  }

  @override
  addANDdeletCart({required String iduser, required String idprodect, required String relashin, required String sections}) {
    // TODO: implement addANDdeletCart
    throw UnimplementedError();
  }

  @override
  cart(id) {
    // TODO: implement cart
    throw UnimplementedError();
  }

  @override
  cartfalse() {
    // TODO: implement cartfalse
    throw UnimplementedError();
  }

  @override
  carttrue() {
    // TODO: implement carttrue
    throw UnimplementedError();
  }

  @override
  fovtfalse() {
    fovbool=false;
    update();
  }

  @override
  fovttrue() {
    fovbool=true;
    update();
  }

  @override
  getCart({required String iduser}) {
    // TODO: implement getCart
    throw UnimplementedError();
  }

  @override
  getlentheCart() {
    // TODO: implement getlentheCart
    throw UnimplementedError();
  }

  @override
  gettotal() {
    // TODO: implement gettotal
    throw UnimplementedError();
  }

}