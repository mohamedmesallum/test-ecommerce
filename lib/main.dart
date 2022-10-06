import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Biding/Biding.dart';
import 'package:testapi/route%20.dart';

import 'authantion/getsevises.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Service();
  runApp( MyApp());
}
Future Service()async{
 await Get.putAsync(() => servises().initsharedpref());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title:'Fashionable',
      debugShowCheckedModeBanner: false,
      initialBinding: BidingControllerauth(),
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
        appBarTheme:AppBarTheme(
          iconTheme:IconThemeData(
            size: 28.5
          ) ,
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
        )
      ),
      initialRoute:'/SignIn',
      getPages: routes,


    );
  }
}
