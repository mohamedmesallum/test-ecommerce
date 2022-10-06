import 'package:testapi/Core/MyClass/GPUD.dart';

import '../../../../Url.dart';

class FunctionMan{
  GPUD gpud;
  FunctionMan(this.gpud);
 Future getAccessories()async{
var resbons = await gpud.PostData(Url:Urlgetproducts, Data: {
  'Relations':'13',
  'sections':'9'
});
return resbons.fold((l) => l, (r) => r);
  }
Future getShoes()async{
   var resbons = await gpud.PostData(Url:Urlgetproducts, Data: {
     'Relations': '13',
     'sections':'8',
   });
   return resbons.fold((l) => l, (r) => r);
}
Future getWatches()async{
   var resbons = await gpud.PostData(Url:Urlgetproducts, Data: {
     'Relations': '13',
     'sections':'7'
   });
   return resbons.fold((l) => l, (r) => r);
}
Future getSportswear()async{
   var resbons = await gpud.PostData(Url:Urlgetproducts, Data: {
     'Relations': '13',
     'sections':'6'
   });
   return resbons.fold((l) => l, (r) => r);
}
Future getClothes()async{
   var resbons = await gpud.PostData(Url:Urlgetproducts, Data:{
     'Relations': '13',
     'sections':'5'
   });
   return resbons.fold((l) => l, (r) => r);
}
}