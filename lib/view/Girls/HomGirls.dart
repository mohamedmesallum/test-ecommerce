
import 'package:flutter/material.dart';

import 'AccessoriesGirls.dart';
import 'MakeupGirls.dart';
import 'PajamasGirls.dart';
import 'ShoesGirls.dart';
import 'clothes.dart';

class HomGirls extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
          length: 5,
          child:Scaffold(
            appBar: AppBar(
              title: Text('Girls',style: TextStyle(letterSpacing: 0.5,fontSize: 25,fontWeight: FontWeight.bold)),
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
                        child: Text('Shoes')),
                  ),
                  Tab(
                    child:
                    Container(
                      child: Text(
                        ('Pajamas'),
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
                          'Makeup'
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
                  child: clothesGirls(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                  ShoesGirls()
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:PajamasGirls()
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:MakeupGirls()
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:GirlsAccess()
                ),
              ],),

          )
      );
  }
}
