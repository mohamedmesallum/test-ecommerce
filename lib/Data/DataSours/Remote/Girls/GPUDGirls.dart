import '../../../../Core/MyClass/GPUD.dart';
import '../../../../Url.dart';

class FunctionGirls{
  GPUD gpud;
  FunctionGirls(this.gpud);
  Future getclothes()async{
    var resbons = await gpud.PostData(Url: Urlgetproducts, Data: {
      'Relations':'15',
      'sections':'5'
    });
    return resbons.fold((l) => l, (r) => r);
  }

  Future getProdects()async{
    var resbons = await gpud.GetData(Url: UrlGetGirls);
    return resbons.fold((l) => l, (r) => r);
  }
 
 

 
}