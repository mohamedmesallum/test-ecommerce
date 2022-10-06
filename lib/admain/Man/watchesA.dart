
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/CntrollerAdmain.dart';

import '../../Core/MyClass/HindlingDataView.dart';
import '../../Core/MyClass/Widgetss/WidgetAdmain.dart';

class watchesAdmain extends StatelessWidget {
ControllerAdmain A = Get.find();
  @override
  Widget build(BuildContext context) {
   return
     FutureBuilder(
         future: A.GetWatches() ,
         builder: (ctx,SnapShot){
           return
             SnapShot.connectionState==ConnectionState.waiting?
             Center(child: CircularProgressIndicator()):

                HindlingDataView(
                 A.statusRequest,
                  GetBuilder<ControllerAdmain>(
                    init: ControllerAdmain(),
                    builder: (a)=> SingleChildScrollView(
                   child: Container(

                       width: double.infinity,
                       child:
                       GridView.builder(

                         physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           //mainAxisSpacing: 10,
                           crossAxisSpacing:2,
                           childAspectRatio:1.9/3.5,),
                         itemCount:A.WatchesModel.data!.length,
                         itemBuilder: (ctx,i){
                           return
                             WidgetViewAdmain(A.WatchesModel.data!,i,);

                         },
                       )
                   ),
                 ),
               ),
             );
         });
  }
}
