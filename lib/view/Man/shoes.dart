
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/Url.dart';

import '../../Core/MyClass/Widgetss/WidgethorzintelPM.dart';
import '../../Core/MyClass/Widgetss/Widgets.dart';
import '../../Core/MyClass/Widgetss/WidgetsProdectsMan.dart';
import '../../controllers/ControlerSign.dart';
import '../../controllers/ControllerMan.dart';

class shoes extends StatelessWidget {

  ControllerMan c = Get.find();
  ControlerSign x = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      //appBar: AppBar()
      // title:Text('${c.categore.data![0].cName}'),centerTitle: true ,elevation: 0,),
      body:

            GetBuilder<ControllerMan>(
                init: ControllerMan(),
                builder: (c)=>
                    HindlingDataView(c.statusRequest,
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
                                  items: c.shoes.data!.map((i) {
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
                                          Text('${c.shoes.data!.length}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.lightBlueAccent),)
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
                                  // reverse:true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      //mainAxisSpacing: 10,
                                      crossAxisSpacing:0,
                                      childAspectRatio:1.9/3.2,),
                                    itemCount: c.shoes.data!.length,
                                    itemBuilder: (ctx,i){
                                      return
                                        WidgetMan(c.shoes.data!,i);

                                    },
                                  )
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text('Accessories',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.deepOrangeAccent),),
                            // SizedBox(height: 5,),
                            seeALL(ontap: ()async{}),
                            Container(
                              height: 300,
                              //color: Colors.deepOrangeAccent,
                              width: double.infinity,
                              child:
                              ListView.builder(

                                scrollDirection:Axis.horizontal,
                                itemCount:c.accessories.data!.length,
                                itemBuilder: (ctx,i)=>
                                    ListViewHorz(c.accessories.data!,i),

                              ),

                            ),
                          ],),
                      ),
                    )
            ),

    );
  }
}