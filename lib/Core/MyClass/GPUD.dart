import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/Core/MyClass/StatusRequest.dart';
import 'package:http/http.dart'as http;

class GPUD{
  Future<Either<StatusRequest,Map>> PostData({required String Url,required Map Data})async{
if(await CheckIntrnet()){
  var resbons = await http.post(Uri.parse(Url),body:Data);
  if(resbons.statusCode==200 || resbons.statusCode==201 ){
Map resbonsbody = jsonDecode(resbons.body);
return  Right(resbonsbody);
  }else{

 return const Left(StatusRequest.serverfailure);
  }
}else{
  print('CheckIntrnet');
  return const Left(StatusRequest.offlienfailure);
}
  }


  Future<Either<StatusRequest,Map>> GetData({required String Url})async{
    if(await CheckIntrnet()){
      var resbons = await http.get(Uri.parse(Url));
      if(resbons.statusCode==200 || resbons.statusCode==201 ){
        Map resbonsbody = jsonDecode(resbons.body);
        return  Right(resbonsbody);
      }else{
        return const Left(StatusRequest.serverfailure);
      }
    }else{
      print('CheckIntrnet');
      return const Left(StatusRequest.offlienfailure);
    }
  }
}

