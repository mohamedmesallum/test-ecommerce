import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/ControlerSign.dart';

import '../controllers/ControllerChat.dart';

class HomeMassangerAdmain extends StatelessWidget {
  ControllerChat ch = Get.find();
 ControlerSign s = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title:Text('Chats',style: TextStyle(letterSpacing: 0.5,fontSize: 27,fontWeight: FontWeight.bold,color: Colors.black)),
        // Text(''),
      ),
      body:StreamBuilder(
          stream: FirebaseFirestore.instance.collection('HomeChat',).orderBy('time',descending: true).snapshots() ,
          builder: (ctx,SnapShot){

            if(SnapShot.hasData){
              var data = (SnapShot.data! as QuerySnapshot).docs;
              return
                Padding(padding: EdgeInsets.all(8),
                    child: ListView.builder(
                        itemCount: (SnapShot.data! as QuerySnapshot).docs.length,
                        itemBuilder: (ctx,i){
                          return
                            InkWell(
                              onTap: ()async{
                                Get.toNamed('/MassageAdmain',arguments: {
                                  'name':data[i]['name'],
                                  'id':data[i]['id'],
                                });
                                await ch.argumnt();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child:  Container(

                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(radius: 30,backgroundColor: Colors.blueAccent,child: Text('${data[i]['name']}',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19)),),
                                      SizedBox(width: 7,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${data[i]['email']}',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19)),

                                          StreamBuilder(
                                            stream:  FirebaseFirestore.instance.collection('Chat/${data[i]['id']}/massage').orderBy('time',descending: true).snapshots() ,
                                            builder:(ctx,SnapShot){

                                              if(SnapShot.hasData) {
                                                var massge = (SnapShot.data! as QuerySnapshot).docs;
                                                return Container(
                                                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 3),
                                                  //color: Colors.blueGrey,
                                                  height: 37,
                                                  width: 200,
                                                  child: ListView.builder(
                                                    // padding: EdgeInsets.all(8),
                                                    //reverse: true,
                                                      itemCount: 1,
                                                      itemBuilder:(ctx,i){
                                                        var isme = massge[i]['email']==s.userCredentialID!.user!.email;
                                                        return
                                                          Text('${massge[i]['massage']}',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 19,color: isme==true?Colors.grey[500]:Colors.blue),);
                                                      }),
                                                );
                                              }else{
                                                return Text('null');
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  )

                                  ,),
                              ),
                            );
                        }));
            }else{
              return Center(child: Text('لاتوجد محادثات'),);
            }



          } ) ,
    );
  }
}