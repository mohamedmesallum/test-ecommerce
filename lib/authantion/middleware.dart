import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getsevises.dart';
class midielwhere extends GetMiddleware{
  servises s =  Get.put(servises(),permanent: true);
  @override
  RouteSettings? Seting (String? route){
if(s.sharedPreferences.getString('tokan')!=null){
return RouteSettings(name:'/HomePage' );
}
  }
}

