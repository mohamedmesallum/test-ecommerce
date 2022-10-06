import '../../../../Core/MyClass/GPUD.dart';
import '../../../../Url.dart';

class FunctionWomens{
  GPUD gpud;
  FunctionWomens(this.gpud);


  Future getProdects()async{
    var resbons = await gpud.GetData(Url:UrlGetWomens);
    return resbons.fold((l) => l, (r) => r);
  }




}