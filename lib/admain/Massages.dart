import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/ControlerSign.dart';
import 'package:testapi/controllers/ControllerChat.dart';

import '../Core/MyClass/Widgetss/WidgetMassage.dart';
import '../Core/MyClass/Widgetss/WidgetMassageTextF.dart';

class MassageAdmain extends StatelessWidget {
 ControllerChat ch = Get.find();
 ControlerSign s = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('${ch.name}'),backgroundColor: Colors.blueGrey,),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 6,left: 3,right: 3),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream:  FirebaseFirestore.instance.collection('Chat/${ch.id}/massage').orderBy('time',descending: true).snapshots() ,
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