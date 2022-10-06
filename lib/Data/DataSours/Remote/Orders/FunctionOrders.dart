import 'package:get/get.dart';
import 'package:testapi/Url.dart';

import '../../../../Core/MyClass/GPUD.dart';
import '../../../../controllers/ControlerSign.dart';

class FunctionOrders{
  ControlerSign si = Get.find();

  GPUD _gpud ;
  FunctionOrders(this._gpud);
 Future  getWOrders({required String numberOrder})async{
   var resbons =await _gpud.PostData(Url:Urltegetwaitingorders, Data:{
     'idorder':'${numberOrder}',
   } );
   return resbons.fold((l) => l, (r) => r);

  }

Future GetOrders ()async{
   var resbons = await _gpud.PostData(Url:UrltegetOrders, Data:{
     'id_user':'${si.userdata.data!.id}',

   });
   return resbons.fold((l) => l, (r) => r);
}

Future GetOrdersAdmain({required Map Data})async{
   var resbons = await _gpud.PostData(Url:UrltegetOrdersAdmain, Data: Data);
   return resbons.fold((l) => l, (r) => r);

}

}