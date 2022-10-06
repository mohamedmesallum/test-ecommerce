
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/ControllerWomens.dart';

import '../../Core/MyClass/HindlingDataView.dart';
import '../../Core/MyClass/Widgetss/WidgetWomens.dart';
import '../../Core/MyClass/Widgetss/WidgetWomensHz.dart';
import '../../Core/MyClass/Widgetss/Widgets.dart';
import '../../Url.dart';

class AccessoriesWomens extends StatelessWidget {
  ControllerWomens w = Get.find();
  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        body:
        GetBuilder< ControllerWomens>(
            init: ControllerWomens(),
            builder:(w)=>   HindlingDataView(w.statusRequest,
              GetBuilder< ControllerWomens>(
                builder: (w)=>
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(width: double.infinity,height: 300,child:
                              CarouselSlider(
                                options: CarouselOptions(
                                    autoPlayInterval:Duration(seconds: 2),
                                    enlargeCenterPage:true,
                                    autoPlay: true,
                                    height: 280.0),
                                items: w.Womens.accessoriesGirls!.map((i) {
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
                              ),),
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
                                        Text('${w.Womens.accessoriesGirls!.length}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.lightBlueAccent),)
                                      ],
                                    )
                                  ],
                                ),
                              )

                            ],

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                                width: double.infinity,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  reverse:true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    //mainAxisSpacing: 10,
                                    crossAxisSpacing:0,
                                    childAspectRatio:1.9/3.2,),
                                  itemCount: w.Womens.accessoriesGirls!.length,
                                  itemBuilder: (ctx,i){
                                    return
                                      WidgetWomen(w.Womens.accessoriesGirls!,i);

                                  },
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Clothes',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.deepOrangeAccent),),
                          // SizedBox(height: 5,),
                          seeALL(ontap: ()async{}),
                          Container(
                            height: 300,
                            //color: Colors.deepOrangeAccent,
                            width: double.infinity,
                            child:
                            ListView.builder(

                              scrollDirection:Axis.horizontal,
                              itemCount:w.Womens.data!.length,
                              itemBuilder: (ctx,i)=>
                                  listviewWomens(w.Womens.data!,i),

                            ),

                          ),
                        ],),
                    ),
              ),
            )
        ),

      );
  }
}