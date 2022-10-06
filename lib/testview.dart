

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/HindlingDataView.dart';
import 'package:testapi/Core/MyClass/StatusRequest.dart';
import 'package:testapi/controllers/ControlerSign.dart';

import 'Core/MyClass/Widgetss/WidgethorzintelPM.dart';
import 'Core/MyClass/Widgetss/Widgets.dart';
import 'Url.dart';
import 'controllers/ControllerHome.dart';
import 'controllers/ControllerMan.dart';
import '../../../../Data/Model/ModielProdects.dart' as ModelP;

class Testview extends StatelessWidget {

  ControllerMan c = Get.find();

  ControllerHome f = Get.find();

  ControlerSign x = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text('null')
    );

  }
}
