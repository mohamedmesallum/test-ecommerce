import 'package:testapi/Core/MyClass/StatusRequest.dart';

hindlinData(resbons){
  if(resbons is StatusRequest){
return resbons;
  }else{
    return StatusRequest.success;
  }

}