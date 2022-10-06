
import 'package:flutter/material.dart';
import 'package:testapi/admain/Man/watchesA.dart';

import 'Colothes.dart';
import 'ShoesA.dart';
import 'SportswearA.dart';
import 'accessoriesAdmain.dart';

class viewprdectsA extends StatefulWidget {

  @override
  State<viewprdectsA> createState() => _viewprdectsManState();
}

class _viewprdectsManState extends State<viewprdectsA> {
  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
          length: 5,
          child:Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title:const Text('Admain',style: TextStyle(letterSpacing: 0.5,fontSize: 25,fontWeight: FontWeight.bold)),
              //  backgroundColor:
              bottom: TabBar(
                indicatorWeight: 2.2,
                indicatorPadding:EdgeInsets.all(0),
                unselectedLabelStyle:TextStyle(fontWeight: FontWeight.w800,fontSize: 15),
                unselectedLabelColor:Colors.black45,
                labelStyle:TextStyle(fontWeight: FontWeight.w900,fontSize: 21),
                indicatorColor:Colors.black,
                isScrollable:true,
                padding:EdgeInsets.all(3),
//Clothes

                labelColor:Colors.deepOrangeAccent,
                tabs: [
                  Tab(
                    child:
                    Container(

                      child: Text(
                        ('Clothes'),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                      // margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(

                          border: Border.all(color: Colors.white,width: 1.5),
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(14)
                      ),

                    ),
                  ),
                  Tab(
                    child: Container(

                        padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                        // margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 1.5),
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(14)
                        ),
                        child: Text('Sportswear')),
                  ),
                  Tab(
                    child:
                    Container(
                      child: Text(
                        ('Watches'),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                      // margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 1.5),
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(14)
                      ),

                    ),
                  ),
                  Tab(
                    child:
                    Container(
                      child: Text(
                          'Shoes'
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                      // margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 1.5),
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(14)
                      ),

                    ),
                  ),
                  Tab(
                    child:
                    Container(
                      child: Text(
                          'Accessories'
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                      // margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 1.5),
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(14)
                      ),

                    ),
                  ),

                ],
              ),


            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:ColothesA()
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SportswearA()
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: watchesAdmain()
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ShoesAdmain()
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:AccessoriesAdmain(),)
              ],),

          )
      );
  }
}
