
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/MyClass/Widgetss/Widgets.dart';
import '../../controllers/ControlerSign.dart';

class PersonalInfo extends StatelessWidget {
  ControlerSign c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: double.infinity,

                  height: 190,

                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(50)
                  ),


                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 10,
                    child: Icon(Icons.person,size: 150,color: Colors.white,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 95,),
                  child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black26,
                      child: IconButton(onPressed: (){}, icon:Icon(Icons.camera_alt_outlined,size: 27,color: Colors.black,) )),
                )
              ],

            ),
        SizedBox(height: 15,),
        Divider(height: 10,color: Colors.black54,thickness: 5,),
            SizedBox(height: 20,),
         Text('personal info',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
            SizedBox(height: 20,),
            infoperson(UserData: c.userdata.data!.username!,onTap: (){},Icons: Icons.person,info: 'name :'),
            infoperson(UserData: c.userdata.data!.email!,onTap: (){},Icons: Icons.email,info: 'email :'),
            infoperson(UserData: c.userdata.data!.phone!,onTap: (){},Icons: Icons.phone,info: 'phone :'),
          ],
        ),
      ),
    );
  }
}
