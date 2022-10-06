
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/Url.dart';

import '../../Core/MyClass/Widgetss/WidgethorzintelPM.dart';
import '../../Core/MyClass/Widgetss/Widgets.dart';
import '../../Core/MyClass/Widgetss/WidgetsProdectsMan.dart';
import '../../controllers/ControlerSign.dart';
import '../../controllers/ControllerHome.dart';
import '../../controllers/ControllerMan.dart';

class Man extends StatelessWidget {
  ControllerMan C = Get.find();
  ControlerSign x = Get.find();
  ControllerHome H = Get.find();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: FutureBuilder(
       future: C.GetClothes(),
        builder:(ctx,Snapshot){

         return
        Snapshot.connectionState==ConnectionState.waiting?Center(child: CircularProgressIndicator(),):
          GetBuilder<ControllerMan>(
              init: ControllerMan(),
              builder: (c)=>
                  HindlingDataView(C.statusRequest,
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(width: double.infinity,height: 300,
                                child:CarouselSlider(
                                  options: CarouselOptions(
                                      autoPlayInterval:Duration(seconds: 2),
                                      enlargeCenterPage:true,
                                      autoPlay: true,
                                      height: 280.0),
                                  items: c.Clothes.data!.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Card(
                                          elevation: 7,
                                          shadowColor: Colors.black,
                                          child: Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                                              child: Image.network('${urlImages}/${i.image!}',fit: BoxFit.fill
                                                ,)
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Icon(Icons.star,size: 22,color: Colors.amberAccent,),
                                        Icon(Icons.star,size: 22,color: Colors.amberAccent,),
                                        Icon(Icons.star,size: 22,color: Colors.amberAccent,),
                                        Icon(Icons.star_half,size: 22,color: Colors.amberAccent,),
                                        Icon(Icons.star_border_rounded,size: 22,color: Colors.amberAccent,),



                                      ],
                                    ),
                                    SizedBox(height: 7,),
                                    Row(
                                      children: [

                                        Text('products',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black45),),
                                        SizedBox(width: 3,),
                                        Text('${c.Clothes.data!.length}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.lightBlueAccent),)
                                      ],
                                    )
                                  ],
                                ),
                              )

                            ],

                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child:
                            Container(

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
                                  itemCount:c.Clothes.data!.length,
                                  itemBuilder: (ctx,i){

                                    return
                                      WidgetMan(c.Clothes.data!,i);

                                  },
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Sportswear',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.deepOrangeAccent),),
                          // SizedBox(height: 5,),
                          seeALL(ontap: ()async{}),

                      Container(
                        height: 300,
                        //color: Colors.deepOrangeAccent,
                        width: double.infinity,
                        child:
                          ListView.builder(

                            scrollDirection:Axis.horizontal,
                            itemCount:C.Sportswear.data!.length,
                            itemBuilder: (ctx,i)=>
                                            ListViewHorz(C.Sportswear.data!,i),


                          ),

                      ),

                        ],),
                    ),
                  )
          );
        }


      ),
    );
  }
}
