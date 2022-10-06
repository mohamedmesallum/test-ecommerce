import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/Core/Function/HindlinData.dart';
import 'package:testapi/Core/MyClass/StatusRequest.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:testapi/Data/DataSours/Remote/Orders/FunctionOrders.dart';
import 'dart:io';
import 'package:path/path.dart';
import '../Core/MyClass/Widgetss/Widgets.dart';
import '../Data/DataSours/Remote/Man/GPUDMan.dart';
import '../Data/Model/AdmainOrders.dart';
import '../Data/Model/ModielProdects.dart';
import '../Url.dart';

class ControllerAdmain extends GetxController {
  FunctionMan functionMn = FunctionMan(Get.find());

  funtobool(){

    update();

  }

  late StatusRequest statusRequest;
  void uu(){
    update();
  }
  late prodects ClothesModel;
  late prodects SportswearModel ;
  late prodects WatchesModel;
  late prodects shoesModel;
  late prodects accessoriesAModel;
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
  argeomentAD()async{
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
  var idprodectsfromaddrecot;
  FunctionOrders functionOrders = FunctionOrders(Get.find());
  AdmainOrders? OrdresA;

  var valWhite= 0;
  var valYello=0;
  var valBlue=0;
  var valRed=0;
  var valGreen=0;
 var valBlack  =0;
  var valBrown=0;
  var valAzure=0;
  var valSilver=0;
  var valPurple=0;
  var valGray=0;
  var valOrange=0;
  bool boolWhitee = false;
  bool boolYelloo = false;
  bool boolBluee = false;
  bool boolRedd = false;
  bool boolGreenn = false;
  bool boolBlackk = false;
  bool  boolBrownn = false;
  bool boolAzuree = false;
  bool boolSilverr = false;
  bool boolPurplee = false;
  bool boolGrayy = false;
  bool boolOrangee = false;




  Future GetAdmainOrders() async {
    try {
      statusRequest = StatusRequest.loading;
      var resbons = await functionOrders.GetOrdersAdmain(Data: {
        'paswwerd': '1110003',
      });
      statusRequest = hindlinData(resbons);

      if (StatusRequest.success == statusRequest) {
        if (resbons['Massege'] == 'true') {
          OrdresA = AdmainOrders.fromJson(resbons);
          OrdresA!.data!.forEach((element) {});

          print('lengthhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
          print(statusRequest.toString());
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      print(statusRequest.toString());
    } catch (e) {
      print('Catsh erorr Get oRDERS admain');
      print(e.toString());
    }
    update();
  }

  Future AcceptanceAndRejection({required Map Data}) async {
    try {
      if (await CheckIntrnet()) {
        var resbons = await http.post(
            Uri.parse(UrltacceptOrreject), body: Data);
        var resbonsbody = jsonDecode(resbons.body) as Map<String, dynamic>;
        if (resbonsbody['Massege'] == 'true') {
          print('تم true,,,,,,,,,,,,,,,,,,,,,,,,');
        }
      } else {
        print('false ---------------------');
      }
    } catch (e) {
      print('Erorr catsh  Acceptance And Rejection');
      print(e.toString());
    }
  }


  Future AddProdectsADMAIN(
      {required Map data, required File file, required String Url}) async {
    try {
      var recost = await http.MultipartRequest('POST', Uri.parse(Url));
      var lenthe = await file.length();
      var strem = http.ByteStream(file.openRead());
      var multepartfile = http.MultipartFile(
          'image', strem, lenthe, filename: basename(file.path));
      recost.files.add(multepartfile);
      data.forEach((key, value) {
        recost.fields[key] = value;
      });
      var resbons = await recost.send();
      var resbosbody = await http.Response.fromStream(resbons);
      if (resbons.statusCode == 200 || resbons.statusCode == 201) {
        var resbonsMap = jsonDecode(resbosbody.body) as Map<String, dynamic>;
        print(resbonsMap['masage']);
        idprodectsfromaddrecot = resbonsMap['id'];
        print(resbonsMap.toString());
        print(idprodectsfromaddrecot.toString());
      } else {
        print('erorr add prodects if statusCode');
      }
    } catch (e) {
      print('erorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      print('Eroorr');
      print('${e.toString()}');
    }
    update();
  }

  Future addColorspro({required Map data}) async {
    try {
      update();
      var resbons = await http.post(
          Uri.parse(UrlAddColorsWiethProdects), body: data);
      if (resbons.statusCode == 200 || resbons.statusCode == 201) {
        update();
        var resbonsbody = jsonDecode(resbons.body) as Map<String, dynamic>;
        if (resbonsbody["Massege"] == 'true') {
          print(resbonsbody["data"]);
        boolWhitee = false;
           boolYelloo = false;
      boolBluee = false;
         boolRedd = false;
         boolGreenn = false;
          boolBlackk = false;
          boolBrownn = false;
          boolAzuree = false;
        boolSilverr = false;
       boolPurplee = false;
         boolGrayy = false;
         boolOrangee = false;
         idprodectsfromaddrecot = null;
          update();

        } else {
          update();
          print('erorr massage resnons false');
        }
      } else {
        update();
        print('erorr statusCode');
      }
    } catch (e) {
      update();
      print('Erorr catsh add colors');
      print(e.toString());
    }
    update();
  }

  GetClothesss()async{
    statusRequest=StatusRequest.loading;

    var resbons = await functionMn.getClothes();
    statusRequest=hindlinData(resbons);
    if (StatusRequest.success==statusRequest){
      update();
      if (resbons['Massege']=='true') {
        update();
        ClothesModel=prodects.fromJson(resbons);
        print('tmammmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
        print('${statusRequest}');
        update();
      } else {
        statusRequest=StatusRequest.failure;
        update();
      }
    }
    update();
  }
  GetSportswear()async{
    statusRequest=StatusRequest.loading;
    // await Future.delayed(Duration(seconds: 4));
    var resbons = await functionMn.getSportswear();
    statusRequest=hindlinData(resbons);
    if(StatusRequest.success==statusRequest){
      if(resbons['Massege']=='true'){
        SportswearModel=prodects.fromJson(resbons);
      }else{
        statusRequest=StatusRequest.failure;
    }
    }
    update();
  }
  GetWatches()async{

    statusRequest=StatusRequest.loading;
    var resbons = await functionMn.getWatches();
    statusRequest=hindlinData(resbons);
    if(StatusRequest.success==statusRequest){
      if(resbons['Massege']=='true'){
        WatchesModel=prodects.fromJson(resbons);

        update();
      }else{
        statusRequest=StatusRequest.failure;
        update();
      }
    }
    update();
  }
  GetShoes()async{

    statusRequest=StatusRequest.loading;
    var resbons = await functionMn.getShoes();
    statusRequest=hindlinData(resbons);
    if(StatusRequest.success==statusRequest){
      update();
      if(resbons['Massege']=='true'){
        shoesModel=prodects.fromJson(resbons);
        print('dooooooooooooooooooooooooooo');
      }else{
        update();
        statusRequest=StatusRequest.failure;
      }
      update();
    }
    update();
  }
  GetAccessories()async{
    statusRequest=StatusRequest.loading;
    var resbons= await functionMn.getAccessories();
    // print(resbons);
    statusRequest = hindlinData(resbons);
    if(StatusRequest.success==statusRequest){
      if(resbons['Massege']=='true'){
        accessoriesAModel=prodects.fromJson(resbons);
      }else{
        statusRequest=StatusRequest.failure;
      }

    }else{
      print('no data acssoires');
    }
    update();
  }

  Future deletProdects({required Map data,})async{
    if(await CheckIntrnet()){
      update();
      var resbons = await http.post(Uri.parse(UrldeletProdectsAd),body: data);
      if(resbons.statusCode==200 || resbons.statusCode==201){
        var resbonsbody = jsonDecode(resbons.body)as Map<String,dynamic>;
        if(resbonsbody['Massege']=='true'){
print('delet this Prodcts');
Get.back();
         await ErorrSnackbar(masseg:resbonsbody['delet'],Icon:Icon(Icons.done,color: Colors.black,), color: Colors.green);

          update();
        }else{
          ErorrSnackbar(masseg:resbonsbody['Failure'],Icon:Icon(Icons.error,color: Colors.redAccent,), color: Colors.redAccent);
          update();
        }
      }
    }else{
      ErorrSnackbar(color: Colors.redAccent,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
      update();
    }
  update();
  }
  Future UpdaetProdects({required Map data})async{
    try{
      if(await CheckIntrnet()){
        update();
        var resbons = await http.post(Uri.parse(UrlUpdateProdects),body: data);
        if(resbons.statusCode == 200 || resbons.statusCode ==201)
          update();
        var resbonsbody = jsonDecode(resbons.body)as Map<String,dynamic>;
        if(resbonsbody['Massege']=='true'){
          update();
          Get.back();
          await ErorrSnackbar(masseg:resbonsbody['result'],Icon:Icon(Icons.done,color: Colors.black,), color: Colors.green);
          update();
        }else{
          ErorrSnackbar(masseg:resbonsbody['result'],Icon:Icon(Icons.error,color: Colors.redAccent,), color: Colors.redAccent);
          update();
        }
      }else{
        ErorrSnackbar(color: Colors.redAccent,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
        update();
      }

      update();


  }catch(e){
      print('erorr catch Updetttttttttttttt');
      print(e.toString());
    }
    update();
  }
}