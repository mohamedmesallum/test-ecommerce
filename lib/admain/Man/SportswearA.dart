
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/controllers/CntrollerAdmain.dart';

import '../../Core/MyClass/Widgetss/WidgetAdmain.dart';

class SportswearA extends StatelessWidget {
  ControllerAdmain A = Get.find();
  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
          future: A.GetSportswear() ,
          builder: (ctx,SnapShot){
            return
             SnapShot.connectionState==ConnectionState.waiting?
              Center(child: CircularProgressIndicator()):

                 HindlingDataView(
                  A.statusRequest,
                   GetBuilder<ControllerAdmain>(
                     init: ControllerAdmain(),
                     builder: (A)=> SingleChildScrollView(
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
                          itemCount:A.SportswearModel.data!.length,
                          itemBuilder: (ctx,i){
                            return
                              WidgetViewAdmain(A.SportswearModel.data!,i,);

                          },
                        )
                    ),
                  ),
                ),
              );
          });
  }
}