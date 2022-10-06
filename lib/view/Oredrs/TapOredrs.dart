
import 'package:flutter/material.dart';

import 'OrderExecuted.dart';
import 'OrdersUnderway.dart';
import 'RejectedOrders.dart';

class TapOredrs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child:Scaffold(
        appBar: AppBar(
centerTitle: false,
        title: Text('My Oredrs',style: TextStyle(letterSpacing: 0.5,fontSize: 25,fontWeight: FontWeight.bold,)),
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

    labelColor:Colors.white,
    tabs: [
    Tab(
    child: Container(

    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            // margin: EdgeInsets.all(7),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 1.5),
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(14)
            ),
            child: Text('Order is underway')),
        ),
      Tab(
        child: Container(

            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            // margin: EdgeInsets.all(7),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 1.5),
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(14)
            ),
            child: Text('Order executed')),
      ),

      Tab(
        child: Container(

            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            // margin: EdgeInsets.all(7),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 1.5),
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(14)
            ),
            child: Text('Rejected orders')),
      ),
    ],
    ),


    ),
          body:  TabBarView(
              children: [
          Padding(
          padding: const EdgeInsets.all(10.0),
          child: WitingOrders(),
        ),
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child:OrderExecuted())
      ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(child:RejectedOrders())
                ),
    ]
    )

    ),
    );
  }
}
