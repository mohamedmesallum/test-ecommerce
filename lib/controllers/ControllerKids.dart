import 'package:get/get.dart';
import 'package:testapi/Core/Function/HindlinData.dart';
import 'package:testapi/Data/Model/ModelGirls.dart';
import 'package:testapi/Data/Model/ModelKids.dart';

import '../Core/MyClass/StatusRequest.dart';
import '../Data/DataSours/Remote/Girls/GPUDGirls.dart';
import '../Data/DataSours/Remote/Kids/GUPDKids.dart';
abstract class Kids extends GetxController{
  GetProdctsKids();
  argeoment();
}
class ControllerKids extends Kids{
  FunctionKids functionKids = FunctionKids(Get.find());
  late ModelKids Kids;
  late  StatusRequest statusRequest;
  @override
  void onInit() {
    GetProdctsKids();
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
  @override
  GetProdctsKids()async{
    try{
      statusRequest=StatusRequest.loading;
     var resbons = await functionKids.getProdects();
      statusRequest= hindlinData(resbons);
      if(StatusRequest.success==statusRequest){
        if(resbons["Massege"]=='true'){
          Kids = ModelKids.fromJson(resbons);
          print('get Girlssssssssssssssssssssssssssssssssssss true');
          print(Kids.accessories!.length);
          update();
        }else{
          statusRequest=StatusRequest.failure;
          update();
        }
        update();
      }
      update();

    }catch(e){
      print('Erorr Catsc Get prodcts girls');
      print(e.toString());
      update();
    }
    update();
  }


}