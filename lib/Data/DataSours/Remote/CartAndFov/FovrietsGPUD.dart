import '../../../../Core/MyClass/GPUD.dart';
import '../../../../Url.dart';

class FunctionFov{
  GPUD gpud;
  FunctionFov(this.gpud);

  Future AddAndDeletfov({required Map Data})async{
    var resbons = await gpud.PostData(Url:favorites, Data: Data);
    return resbons.fold((l) => l, (r) => r);
  }

  Future GetFovirets({required String idd})async{
    var resbons = await gpud.PostData(Url:getfavorites, Data: {
      'iduser':idd,
    });
    return resbons.fold((l) => l, (r) => r);

  }


}