
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:testapi/view/cart.dart';
import 'package:testapi/view/fovrets.dart';
import 'package:testapi/view/home.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var SlectIndex=0;
  List<Widget>NavigationBar=[
    Home(),
    cart(),
    fovret(),
    //Profiel(),
  ];
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
return Scaffold(
  bottomNavigationBar:  ConvexAppBar(
  backgroundColor:Colors.white,
  activeColor:Colors.blueGrey,
      curveSize:50,
      color:Colors.grey,
      style: TabStyle.textIn,
      elevation:5 ,
       height: 50,



  items: [
    TabItem(icon: Icons.home, title: 'Home',),
    TabItem(icon: Icons.shopping_cart, title: 'Cart',),

     TabItem(icon: Icons.favorite, title: 'Favorite'),
   // TabItem(icon: Icons.person, title: 'Profile'),

    //

  ],
  initialActiveIndex:SlectIndex,
  //initialActiveIndex: 0,//optional, default as 0
  onTap: (int i) {
    setState(() {
      SlectIndex=i;
    });
  },
),
  body: NavigationBar.elementAt(SlectIndex),
);




  }
}
