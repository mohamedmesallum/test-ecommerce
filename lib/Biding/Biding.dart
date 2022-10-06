import 'package:get/get.dart';
import 'package:testapi/Core/MyClass/GPUD.dart';
import 'package:testapi/controllers/CntrollerAdmain.dart';
import 'package:testapi/controllers/ControllerChat.dart';
import 'package:testapi/controllers/ControllerKids.dart';
import 'package:testapi/controllers/ControllerMan.dart';
import 'package:testapi/controllers/ControllerWomens.dart';

import '../controllers/ControlerSign.dart';
import '../controllers/ControllerGirles.dart';
import '../controllers/ControllerHome.dart';

class BidingControllerauth implements Bindings{
  @override
  void dependencies() {
    Get.put( ControlerSign(),permanent: true);

    Get.put(GPUD());

  }

}
class BidingControllerHome implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerHome(),permanent: true);
  }

}
class BidingControllerMan implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerMan());  }
}

class BidingControllerGirls implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerGirls()); }
}
//ControllerGirls  g =
class BidingControllerAdmain implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerAdmain());
  }
}
class BidingControllerKids implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerKids());
  }
}
class BidingControllerWomens implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerWomens());
  }
}
class BidingControllerChat implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerChat());
  }
}