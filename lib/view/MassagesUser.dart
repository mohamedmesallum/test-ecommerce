import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/ControlerSign.dart';
import 'package:testapi/controllers/ControllerChat.dart';

import '../Core/MyClass/Widgetss/WidgetMassage.dart';
import '../Core/MyClass/Widgetss/WidgetMassageTextF.dart';




class UserSendMassage extends StatelessWidget {
  ControlerSign s = Get.find();
  ControllerChat F = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fashionable',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w900,color: Colors.black),),backgroundColor: Colors.blueGrey,foregroundColor: Colors.white,
    actions: [
               IconButton(onPressed: ()async{
              await F.SetMassageeee();

                   }, icon:Icon(Icons.add_box_rounded))
               ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 6,left: 3,right: 3),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream:  FirebaseFirestore.instance.collection('Chat/${s.userCredentialID!.user!.uid}/massage').orderBy('time',descending: true).snapshots() ,
                builder:(ctx,SnapShot){

                  if(SnapShot.hasData) {
                    var data = (SnapShot.data! as QuerySnapshot).docs;
                    return ListView.builder(
                      // padding: EdgeInsets.all(8),
                        reverse: true,
                        itemCount: (SnapShot.data! as QuerySnapshot).docs.length,
                        itemBuilder:(ctx,i){
                          return

                            WidgetMassage('${data[i]['massage']}',data[i]['email']==s.userCredentialID!.user!.email);
                        });
                  }else{
                    return Text('');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFildMassage(),
            )

          ],
        ),
      ),
    );
  }
}