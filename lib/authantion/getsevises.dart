import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class servises extends GetxService{
 late SharedPreferences sharedPreferences;
 Future<servises> initsharedpref () async{
  sharedPreferences =   await SharedPreferences.getInstance();
  return this;
 }
}