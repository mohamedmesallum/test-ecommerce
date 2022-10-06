import '../../../../Core/MyClass/GPUD.dart';
import '../../../../Url.dart';

class FunctionKids{
  GPUD gpud;
  FunctionKids(this.gpud);


  Future getProdects()async{
    var resbons = await gpud.GetData(Url:UrlGetKids);
    return resbons.fold((l) => l, (r) => r);
  }




}