
import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/StatusRequest.dart';

import '../Core/Function/HindlinData.dart';
import '../Data/DataSours/Remote/Man/GPUDMan.dart';
import '../Data/Model/ModielProdects.dart';


abstract class Man extends GetxController{
  GetClothes();
  GetSportswear();
  GetWatches();
  GetShoes();
  GetAccessories();
  argeoment();
}

class ControllerMan extends Man{
  @override
  void onInit()async{
    super.onInit();

    GetShoes();
    GetAccessories();
    GetSportswear();
    GetWatches();
  }
  FunctionMan  functionMn = FunctionMan(Get.find());
  late  StatusRequest statusRequest;
  late prodects Clothes;
  late prodects Sportswear;
  late prodects Watches;
  late prodects shoes;
  late prodects accessories;
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
GetClothes()async{
  update();
    statusRequest=StatusRequest.loading;
    var resbons = await functionMn.getClothes();
    statusRequest=hindlinData(resbons);
    if(StatusRequest.success==statusRequest){
      if(resbons['Massege']=='true'){
        Clothes=prodects.fromJson(resbons);

      }else{
        statusRequest=StatusRequest.failure;

      }
      update();
    }
    update();
  }

  @override
GetSportswear()async{
    statusRequest=StatusRequest.loading;
   // await Future.delayed(Duration(seconds: 4));
    var resbons = await functionMn.getSportswear();
    statusRequest=hindlinData(resbons);
    if(StatusRequest.success==statusRequest){
      if(resbons['Massege']=='true'){
        Sportswear=prodects.fromJson(resbons);
      }else{
        statusRequest=StatusRequest.failure;
      }
    }
    update();
  }

  @override
GetWatches()async{

    statusRequest=StatusRequest.loading;
    var resbons = await functionMn.getWatches();
    statusRequest=hindlinData(resbons);
    if(StatusRequest.success==statusRequest){
      if(resbons['Massege']=='true'){
        Watches=prodects.fromJson(resbons);

        update();
      }else{
        statusRequest=StatusRequest.failure;
        update();
      }
    }
    update();
  }

  @override
GetShoes()async{
    update();
    statusRequest=StatusRequest.loading;
    var resbons = await functionMn.getShoes();
    statusRequest=hindlinData(resbons);
    if(StatusRequest.success==statusRequest){
      update();
      if(resbons['Massege']=='true'){
        shoes=prodects.fromJson(resbons);
      }else{
        update();
        statusRequest=StatusRequest.failure;
      }
    }
    update();
  }
//Future GetShoesMan()async{
//     try{
//       var resbons= await http.post(Uri.parse(Urlgetproducts),body: {
//         'Relations': '13',
//         'sections':'8'
//       });
//       var resbonsbody=jsonDecode(resbons.body)as Map<String,dynamic>;
//       shoes=prodects.fromJson(resbonsbody);
//       print('true Fuincashin Get prodacts shoes Man oooooooooooooooooooooooooooooooooo');
//       print(shoes.data!.length);
//       return shoes;
//
//
//
//     }catch(e){
//       print('Erorr Catch shoes oooooooooooooooooooooooooooooooooooooo');
//       print(e.toString());
//     }
//   }
  @override
GetAccessories()async{
    statusRequest=StatusRequest.loading;
    var resbons= await functionMn.getAccessories();
   // print(resbons);
    statusRequest = hindlinData(resbons);
    if(StatusRequest.success==statusRequest){
      if(resbons['Massege']=='true'){
        accessories=prodects.fromJson(resbons);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      print('no data acssoires');
    }
update();
  }

}