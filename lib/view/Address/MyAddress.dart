
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/ControlerSign.dart';

import '../../Core/MyClass/Widgetss/Widgets.dart';


class MyAddess extends StatelessWidget {
  ControlerSign S = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('My Address',style: TextStyle(letterSpacing: 0.5,fontSize: 27,fontWeight: FontWeight.bold,color: Colors.black)),
      ),
      body:
      FutureBuilder(
        future: S.GetAddress(),
        builder: (ctx,SnapShot)=>
        SnapShot.connectionState==ConnectionState.waiting?
            Center(child: CircularProgressIndicator()):
        GetBuilder<ControlerSign>(
          init: ControlerSign(),
          builder: (s)=>
          s.addresbool==false?
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Icon(Icons.home_outlined,size: 275,color: Colors.blueGrey,),
                    Text('You did not add a addess !' ,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.blueGrey))
                 ,Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('add Now',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.blueAccent)),
                    IconButton(onPressed: (){
                      Get.toNamed('/AddAddress');
                    }, icon: Icon(Icons.arrow_forward,size: 55,color: Colors.blueAccent,))
                    ],
                  )
                  ],
                ),
              ):
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  profielwidget(titel:'add another address' ,onTap: (){
                    Get.toNamed('/AddAddress');
                  }),
                  //SizedBox(height: 30,),
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: s.address!.data!.length,
                      itemBuilder: (ctx,i){
                        return
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              ExpansionTile(
                                expandedAlignment:Alignment.topLeft,
                                expandedCrossAxisAlignment:CrossAxisAlignment.start,
                                tilePadding:EdgeInsets.all(7),
                                title:
                                  Text('Addres Region :',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w900),),
                              subtitle:Container(
                                  width: 250,
                                  child: Text('${s.address!.data![i].region}',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w900),maxLines:4,overflow:TextOverflow.ellipsis)),




                                childrenPadding: EdgeInsets.all(0),
                                children: [

                                  Rowaddres('Street','${s.address!.data![i].street}'),
                                  SizedBox(height: 10,),
                                  Rowaddres( 'Building number or name','${s.address!.data![i].building}'),
                                  SizedBox(height: 10,),
                                  Rowaddres('Turn number','${s.address!.data![i].turn}'),
                                  SizedBox(height: 10,),
                                  Rowaddres('Apartment number','${s.address!.data![i].apartme}'),
                                  SizedBox(height: 10,),
                                  Rowaddres('Special marque','${s.address!.data![i].specialMarque}'),
                                  SizedBox(height: 10,),
                                  Rowaddres('Delivery Instructions','${s.address!.data![i].nstructions}' ),
Center(child:
   GetBuilder<ControlerSign>(
     builder:(S)=>
     S.deletaddrs==true?
         CircularProgressIndicator():
    ElevatedButton.icon(

      style: ButtonStyle(
          elevation:MaterialStateProperty.all(7),
          backgroundColor:MaterialStateProperty.all(Colors.blueGrey),
    padding: MaterialStateProperty.all(EdgeInsets.only(left:20,right:20,top:5,bottom: 5))
      ),
      onPressed: (){
        S.deleteAddres(idaddres: '${S.address!.data![i].id}');

      }, icon: Icon(Icons.delete,size: 30,color: Colors.redAccent,), label: Text('Delete this address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white),)),
          ),)


                                ],
                                ),
                            );
                      }


                  ),
                ],
              ),
            ),
          ),
      ),

    );
  }
}
