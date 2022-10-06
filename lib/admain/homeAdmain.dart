
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/Widgetss/Widgets.dart';
import 'package:testapi/controllers/CntrollerAdmain.dart';

import '../Core/MyClass/Widgetss/WidgetColorsChebox.dart';
import '../Core/MyClass/Widgetss/addcolorsprodects.dart';


class HomeAdmain extends StatelessWidget {
  ControllerAdmain  A = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           ElvettBoutten(ontap: ()async{
              Get.toNamed('/AdmainOrders');
            }, name:'Orders' ,color: Colors.blue),
       SizedBox(height: 20,),
            ElvettBoutten(ontap: ()async{
              Get.toNamed('/AddProdects');
            }, name:'add prodects' ,color: Colors.blue),
            SizedBox(height: 20,),
            ElvettBoutten(ontap: ()async{
Get.toNamed('/viewprdectsA');
            }, name:'change prodects man' ,color: Colors.blue),
            SizedBox(height: 20,),


            SizedBox(height: 8,),
            ElvettBoutten(ontap: ()async{
Get.toNamed('/HomeMassangerAdmain');
            }, name:'Massages' ,color: Colors.blue),
          ],

        ),
      )

    );
  }
}
