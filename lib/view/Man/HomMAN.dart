
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/controllers/ControllerKids.dart';
import 'package:testapi/view/Man/accessories.dart';
import 'package:testapi/view/Man/shoes.dart';
import 'package:testapi/view/Man/sportswear.dart';
import 'package:testapi/view/Man/watches.dart';

import 'clothes.dart';

class HomMAN extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 5,
        child:Scaffold(

          appBar: AppBar(


           title: Text('Man',style: TextStyle(letterSpacing: 0.5,fontSize: 25,fontWeight: FontWeight.bold)),
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
                child: Man(),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Sportswear(),
            ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child:watches(),
             ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:  shoes()
          ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: accessories()
            ),
          ],),

    )
    );
  }
}
