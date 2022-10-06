import 'package:get/get.dart';
import 'package:testapi/Core/Function/HindlinData.dart';
import 'package:testapi/Data/Model/ModelGirls.dart';
import '../Core/MyClass/StatusRequest.dart';
import '../Data/DataSours/Remote/Womens/GUPDWomens.dart';

abstract class Womens extends GetxController{
  GetProdctsWomens();
  argeoment();
}

class ControllerWomens extends Womens{
  FunctionWomens functionwomens =  FunctionWomens(Get.find());
  late Girles Womens;
  late  StatusRequest statusRequest;
  @override
  void onInit() {
    GetProdctsWomens();
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
  Future GetProdctsWomens()async{
    try{
      statusRequest=StatusRequest.loading;
      var resbons = await functionwomens.getProdects();
      statusRequest= hindlinData(resbons);
      if(StatusRequest.success==statusRequest){
        if(resbons["Massege"]=='true'){
          Womens = Girles.fromJson(resbons);
        }else{
          statusRequest=StatusRequest.failure;
          update();
        }
        update();
      }
    }catch(e){
      print('Erorr Catsh Get prodcts womens');
      print(e.toString());
      update();
    }
    update();
  }
}