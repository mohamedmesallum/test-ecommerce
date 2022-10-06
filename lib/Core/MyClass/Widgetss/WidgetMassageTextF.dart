
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/ControlerSign.dart';
import 'package:testapi/controllers/ControllerChat.dart';

class TextFildMassage extends StatefulWidget {

  @override
  State<TextFildMassage> createState() => _TextFildMassageState();
}

class _TextFildMassageState extends State<TextFildMassage> {
  var massage = TextEditingController();
  ControlerSign s = Get.find();
  ControllerChat ch = Get.find();
  String valtest ='';

  SetMassage()async{
    try{
      await ch.SetHomeChat().then((value) {
        var sessst=  FirebaseFirestore.instance.collection('Chat/${s.userCredentialID!.user!.uid}/massage');
        sessst.add({
          'massage':massage.text,
          'time':Timestamp.now(),
          'email':'${s.userCredentialID!.user!.email}'
        });
        massage.clear();
      });

      print('sent massage  trrrrrrrrue');

    }catch(e){
      print('eroeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr sent massage');
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,),
          controller: massage,
          decoration: InputDecoration(
              contentPadding:EdgeInsets.only(left: 8,top: 5,bottom:5),
              hintText:'Send a Massage' ,
              hintStyle: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.w900,)
          ),
          onChanged: (val){
            setState(() {
              valtest = val;
            });
          },
        )),
        IconButton(
            onPressed:
                (){
              valtest.trim().isEmpty?null: SetMassage();
            },
            icon: Icon(Icons.send,color: Colors.black,))


      ],
    );
  }
}