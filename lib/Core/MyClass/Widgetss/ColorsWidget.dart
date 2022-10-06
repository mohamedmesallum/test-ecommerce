import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/ControllerHome.dart';

import '../../../Data/Model/Colorsprodects.dart' as Colorss;


class ColorsWidgets extends StatelessWidget {

ControllerHome c = Get.find();
  @override
  Widget build(BuildContext context) {
    return
        Container(
        // color:  Colors.black26,
          width:  double.infinity,
          height: 40,
          child:
         SingleChildScrollView(
           padding:EdgeInsets.all(3),
           scrollDirection: Axis.horizontal,
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if(c.ColorsProdects.data!.white==1)
                  CircleAvatar(
                      radius: 20.4,backgroundColor: Colors.black,
                      child: CircleAvatar(radius: 20,backgroundColor:Colors.white,)),

                if(c.ColorsProdects.data!.yellow==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.yellow,),
                if(c.ColorsProdects.data!.blue==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.blue,),
                if(c.ColorsProdects.data!.red==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.red,),
                if(c.ColorsProdects.data!.green==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.green,),
                if(c.ColorsProdects.data!.black==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.black,),
                if(c.ColorsProdects.data!.azure==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.blueAccent,),
                if(c.ColorsProdects.data!.brown==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.brown,),
                if(c.ColorsProdects.data!.silver==1)
                  CircleAvatar(
                      child: CircleAvatar(radius: 20,backgroundColor:Colors.white54)),
                if(c.ColorsProdects.data!.purple==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.purple),
                if(c.ColorsProdects.data!.orange==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.orange),
                if(c.ColorsProdects.data!.gray==1)
                  CircleAvatar(radius: 20,backgroundColor:Colors.grey,),
            ],),
         ) ,
        );

  }
}
