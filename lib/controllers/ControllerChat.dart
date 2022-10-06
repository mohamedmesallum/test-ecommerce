import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/ControlerSign.dart';


abstract class chatss extends GetxController{
  SetMassageeee();
  SetHomeChat();
  SetMassage(); // TEST MASSAGE
  argumnt();

}

class ControllerChat extends chatss{
  ControlerSign cc = Get.find();
  String? name;
  String? id ;
  @override
  argumnt(){
    name = Get.arguments['name'];
    id=Get.arguments['id'];
    update();
  }
  //test
  @override
  Future  SetMassageeee()async{
    try{
      var sessst=await FirebaseFirestore.instance.collection('Chat/${cc.userCredentialID!.user!.uid}/massage');
      sessst.add({
        'massage':'hi',
        'time':Timestamp.now(),
        'email':'xavi@gmail.com'
      });
      print('sent massage  trrrrrrrrue');
      update();
    }catch(e){
      print('eroeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr sent massage');
      print(e.toString());
    }
  }
  @override
  Future  SetHomeChat()async{
    try{
      var sessst=await FirebaseFirestore.instance.collection('HomeChat').doc('${cc.userCredentialID!.user!.uid}');
      sessst.set({
        'id':'${cc.userCredentialID!.user!.uid}',
        'email':'${cc.userCredentialID!.user!.email}',
        'name':'${cc.userdata.data!.username}',
        'time':Timestamp.now(),
      });
      print('sent test chattttttttttttttttt trrrrrrrrue');
      update();
    }catch(e){
      print('eroeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr test chat');
      print(e.toString());
    }
  }
  //test massage
  @override
  Future  SetMassage()async{
    try{
      var sessst=await FirebaseFirestore.instance.collection('Chat/${cc.userCredentialID!.user!.uid}/massage');
      sessst.add({
        'massage':'hi',
        'time':Timestamp.now(),
        'email':'xavi@gmail.com'
      });
      print('sent massage  trrrrrrrrue');
      update();
    }catch(e){
      print('eroeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr sent massage');
      print(e.toString());
    }
  }
}