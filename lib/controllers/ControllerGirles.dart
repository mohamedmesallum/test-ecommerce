import 'package:get/get.dart';
import 'package:testapi/Core/Function/HindlinData.dart';
import 'package:testapi/Data/Model/ModelGirls.dart';

import '../Core/MyClass/StatusRequest.dart';
import '../Data/DataSours/Remote/Girls/GPUDGirls.dart';

abstract class Girls extends GetxController{
  GetClothes();
  GetProdctsGirls();
  argeoment();
}

class ControllerGirls extends Girls{
  FunctionGirls functionGirls = FunctionGirls(Get.find());
 late Girles girles;
  late  StatusRequest statusRequest;
  @override
  void onInit() {
    GetProdctsGirls();
    super.onInit();

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

  @override
  argeoment()async{

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
  @override
  Future GetProdctsGirls()async{
   try{
     statusRequest=StatusRequest.loading;
   //  await Future.delayed(Duration(seconds: 3));
     var resbons = await functionGirls.getProdects();
     statusRequest= hindlinData(resbons);
     if(StatusRequest.success==statusRequest){
       if(resbons["Massege"]=='true'){
         girles = Girles.fromJson(resbons);

         update();
       }else{
         statusRequest=StatusRequest.failure;
         update();
       }
       update();
     }
   }catch(e){
     print('Erorr Catsc Get prodcts girls');
     print(e.toString());
     update();
   }
   update();
  }

  @override
  Future GetClothes()async{
    try{
      statusRequest=StatusRequest.loading;
      var resbons = await functionGirls.getclothes();
      statusRequest = hindlinData(resbons);
      if(StatusRequest.success==StatusRequest){
        if(resbons["Massege"]=='true'){
          girles= Girles.fromJson(resbons);
          update();
        }else{
          statusRequest=StatusRequest.failure;
          update();
        }
      }
      update();
    }catch(e){
      print('ERorrrrrrrrrrrr catsh get colothes justtttttttttttttttttt');
      print(e.toString());
    }
    update();
  }

}