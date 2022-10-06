import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:path/path.dart';
import 'package:testapi/Data/Model/Addres.dart';

import 'package:testapi/Url.dart';
import 'package:testapi/Data/Model/ModelUser.dart';

import '../Core/Function/CheckIntrnet.dart';
import '../Core/MyClass/Widgetss/Widgets.dart';
import '../authantion/getsevises.dart';


class ControlerSign extends GetxController{
bool addresbool=false;
bool deletaddrs = false;
bool HiddinPasw = false;
UserCredential? userCredentialID;
late DataUser userdata;
Address? address;
var idaddres;
servises s =  Get.put(servises());
var isloding= false;
var islodingaddres = false;

ShowPASW(){
  HiddinPasw = !HiddinPasw ;
  update();
}



addresbooltrue(){
  addresbool = true;
  update();
}
addresboolfalse(){
  addresbool=false;
  update();
}


Future Rigister({required String email,required String name,required String passwerd,required String phone})async{

       try{
       if(await CheckIntrnet()){
         update();
         isloding=true;
         await Future.delayed(Duration(seconds: 5));
         var respons= await http.post(Uri.parse(UrlRigister),body:{
         'username': name,
          'email': email,
           'passwerd': passwerd,
           'phone': phone,
           'verfiycode': '0',
         });
         if(respons.statusCode==200 ||respons.statusCode==201 ){

           var responsbody= jsonDecode(respons.body)as Map<String,dynamic>;
           if(responsbody['Massege']=='true'){
             userdata= DataUser.fromJson(responsbody);
             userCredentialID  = await RigisterFir(email: email,password: passwerd);
                 if(userCredentialID!.user!.uid != null){
                   print('ooooooooooooooooooooooooooooooooooooooooooooooo');
                   print('${userCredentialID.toString()}');
                   await SetDataUser(id:'${userCredentialID!.user!.uid}', name:name, email:email);
                   s.sharedPreferences.setString('tokan', '${userdata.data!.id}').then((value) {
                     isloding=false;
                     Get.offAllNamed('/HomePage');

                     update();
                   });
                 }else{
                   print('userCredentialID ===================== null ');
                   isloding=false;
                 }

           }else if (responsbody['Massege']=='This data was used by'){
             ErorrSnackbar(color: Colors.redAccent,masseg:'${responsbody['Massege']} !!',Icon:Icon(Icons.error,size:40,color: Colors.red ,) );
             isloding=false;
             update();
           }



         }else{

           print('erorr,عيب عليك');
         }
       }else{
         ErorrSnackbar(color: Colors.redAccent,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
         isloding=false;
       }
       }catch(e){
         isloding=false;
         print('Eroorr catch ');
         print('${e.toString()}');
         update();
       }
update();

  }
//Firestore Rigister Wieth Set Data Firebase Firestore
  Future RigisterFir({required String email , required String password})async{
  try{
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    update();
    print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    print(userCredential.user!.email);
    return userCredential;

  }catch(e){
    print(e.toString());
    update();
  }
  update();
}
  Future SetDataUser({required String id,required String name,required String email ,})async{
    try{
      var setData=await FirebaseFirestore.instance.collection('User').doc(id);
      setData.set({
        'name':name,
        'id':id,
        'email':email,

      });
    }catch(e){
      print('erorrrrrrrrrrrrrrrrr catsh  rrrrrrrrrrrrrrrrrrr Firestore');
      print(e.toString());
    }
    update();
  }




  Future Sign({required String email,required String passwerd,})async{
 try{
   if(await CheckIntrnet()){
     isloding=true;
     update();
     var respons= await http.post(Uri.parse(UrlSingIN),body:{
       'email':email,
       'passwerd':passwerd,
     });
     if(respons.statusCode==200 || respons.statusCode==201){
       var responsbody= jsonDecode(respons.body)as Map<String,dynamic>;
       if(responsbody['Massege']=='true'){
         userdata=DataUser.fromJson(responsbody);
         userCredentialID = await  SignFir(email: email, paswer:passwerd,);
         if(userCredentialID!.user!.uid != null){
           s.sharedPreferences.setString('tokan','${userdata.data!.id}').then((value) {
             Get.offAllNamed('/HomePage');
             isloding=false;
             update();
           });
         }else{
           print('userCredentialID ===================== null ');
           isloding=false;
           update();
         }
       }else if(responsbody['Massege']=='The password is incorrect'){
         update();
         ErorrSnackbar(color: Colors.redAccent,masseg:'${responsbody['Massege']} !!',Icon:Icon(Icons.error,size:40,color: Colors.red ,) );
isloding=false;
update();
       }else{
         ErorrSnackbar(color: Colors.redAccent,masseg:  '${responsbody['Massege']} !!',Icon:Icon(Icons.error,size:40,color: Colors.red ,) );
 isloding=false;
 update();
       }

     }else{

       isloding=false;
     }
   }else{

     ErorrSnackbar(color: Colors.redAccent,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
     isloding=false;
     update();
   }
 }catch(e){
   isloding=false;
   update();
   print('erorr catscsign');
   print(e.toString());


 }

update();

 isloding=false;
  }
  // Sing Firebase
  Future SignFir({required String email , required String paswer})async{
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: paswer,
    );
    update();
    return userCredential;
  }

  Future addAddress({required Map data})async{
    if(await CheckIntrnet()){
      update();
      islodingaddres=true;
      var resbons = await http.post(Uri.parse(Urladdaddress),body: data);
      if(resbons.statusCode==200 || resbons.statusCode==201 ){
        var resbonsbody = jsonDecode(resbons.body);
        if(resbonsbody['Massege']=='true'){
          await  await GetAddress();
          ErorrSnackbar(color: Colors.black,masseg: 'Address has been added successfully',Icon:Icon(Icons.done,size:40,color: Colors.green ,) );

          islodingaddres=false;

          update();
        }else{
          ErorrSnackbar(color: Colors.redAccent,masseg: 'Failed please try again',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
          islodingaddres=false;
          update();
        }
      }

    }else{
      ErorrSnackbar(color: Colors.redAccent,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
      islodingaddres=false;
      update();
    }
  }
  Future GetAddress()async{
    try{
      update();
      if(await CheckIntrnet()){
        var resbons = await http.post(Uri.parse(Urlgetaddress),body: {
          'id_user':'${userdata.data!.id}'
        });
        var resbonsbody = jsonDecode(resbons.body)as Map<String,dynamic>;
        if(resbonsbody["Massege"]=='true'){
          address= Address.fromJson(resbonsbody);
          addresbooltrue();
          print(address!.data!.length);

          update();
        }else{
          addresboolfalse();
          print(resbonsbody["Massege"]);
          print('لاتوجدبيانات');

          update();
        }

      }
    }catch(e){

      print('erorr catch get addres ');
      print(e.toString());
    }
    update();
  }
Future deleteAddres({required String idaddres})async{
    if(await CheckIntrnet()){
      deletaddrs = true;
      update();
      var resbons = await http.post(Uri.parse(Urldeleteaddress),body: {
'id_user':'${userdata.data!.id}',
        'id':idaddres,
      });
      if(resbons.statusCode==200 || resbons.statusCode==201){
        var resbonsbody = jsonDecode(resbons.body)as Map<String,dynamic>;
        if(resbonsbody['Massege']=='true'){
          update();
          await
         await GetAddress();
         deletaddrs = false;
          ErorrSnackbar(color: Colors.black,masseg: 'Address has been delete successfully',Icon:Icon(Icons.done,size:40,color: Colors.green ,) );
        Get.offNamed('/MyAddess');
        }else{
          ErorrSnackbar(color: Colors.redAccent,masseg: 'Failed please try again',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );
          deletaddrs = false;
          update();
        }
      }
    }else{
      update();
      deletaddrs = false;
      ErorrSnackbar(color: Colors.redAccent,masseg: 'There is no internet connection !',Icon:Icon(Icons.wifi_off_rounded,size:40,color: Colors.red ,) );

    }
    update();
}

  Future AddProdct({required Map data , required File file})async{
    String Url = "http://10.0.2.2/cors/addprodects.php";
    try{
var recost = http.MultipartRequest('POST',Uri.parse(Url));
var lenthe = await file.length();
var strem = http.ByteStream(file.openRead());
var multepartfile = http.MultipartFile('image',strem,lenthe,filename:basename(file.path) );
recost.files.add(multepartfile);
data.forEach((key, value) {
  recost.fields[key]= value;
});
await recost.send();



    }catch(e){

      print('Eroorr');
      print('${e.toString()}');
    }
    update();
  }

}