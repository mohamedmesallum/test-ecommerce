import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/CntrollerAdmain.dart';

import '../../Core/MyClass/HindlingDataView.dart';
import '../../Core/MyClass/Widgetss/WidgetAdmain.dart';

class ShoesAdmain extends StatelessWidget {
  ControllerAdmain A = Get.find();
  @override
  Widget build(BuildContext context) {
    return

              FutureBuilder(
                future: A.GetShoes() ,
                builder: (ctx,SnapShot){
                  return
                    SnapShot.connectionState==ConnectionState.waiting?
                   Center(child: CircularProgressIndicator()):

                       RefreshIndicator(
                        onRefresh: ()async=> await A.GetShoes(),
                        child:

                           HindlingDataView(
                            A.statusRequest,
                               GetBuilder<ControllerAdmain>(
                                 init: ControllerAdmain(),
                                 builder: (A)=>  SingleChildScrollView(
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
                                    itemCount:A.shoesModel.data!.length,
                                    itemBuilder: (ctx,i) {
                                      return

                                        WidgetViewAdmain(A.shoesModel.data!, i,);
                                    }
                                  ),
                              ),
                            ),
                          )

                        )
                      );

                });




  }
}