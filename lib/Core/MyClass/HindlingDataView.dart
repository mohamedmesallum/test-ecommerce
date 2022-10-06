
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapi/Core/MyClass/StatusRequest.dart';

class HindlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
 HindlingDataView(this.statusRequest,this.widget);

  @override
  Widget build(BuildContext context) {
    return
        statusRequest==StatusRequest.loading?
          const  Center(child:CircularProgressIndicator(),) :
            statusRequest==StatusRequest.serverfailure?
                 Center(child:
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const  Icon(Icons.error,size: 100,color: Colors.red,),
                    const   Text('invalid address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.red),),
                  ],
                ),):
                statusRequest==StatusRequest.offlienfailure?
                Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const  Icon(Icons.wifi_off_rounded,size:100,color: Colors.blueGrey,),
                    const   Text('There is no internet connection !',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.red),),
                  ],
                ),):
                    statusRequest==StatusRequest.failure?
                    Center(child: const   Text('Data not available ?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.red),)):
                      widget;


  }
}
