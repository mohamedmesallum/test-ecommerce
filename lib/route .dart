import 'package:get/get.dart';

import 'package:testapi/admain/ShowDataOrders.dart';
import 'package:testapi/testview.dart';
import 'package:testapi/view/Address/ChooseAddres.dart';
import 'package:testapi/view/Address/MyAddress.dart';
import 'package:testapi/view/Address/addaddres.dart';
import 'package:testapi/view/Girls/HomGirls.dart';
import 'package:testapi/view/Girls/ViewProdectsGirls.dart';
import 'package:testapi/view/Kids/HomeKids.dart';
import 'package:testapi/view/Kids/ViewProdectsKids.dart';
import 'package:testapi/view/Man/HomMAN.dart';
import 'package:testapi/view/Man/ShowProdectsMan.dart';
import 'package:testapi/view/Man/clothes.dart';
import 'package:testapi/admain/Massages.dart';
import 'package:testapi/view/MassagesUser.dart';
import 'package:testapi/view/Oredrs/ShowOrders.dart';
import 'package:testapi/view/Profiel/personalInfo.dart';
import 'package:testapi/view/Womens/HomeWomens.dart';
import 'package:testapi/view/Womens/ViewProdectsWomens.dart';


import 'Biding/Biding.dart';
import 'HomePage.dart';
import 'admain/Man/UpdetProdectsAD.dart';
import 'admain/MassahesAdmainMassanger.dart';
import 'admain/Orders.dart';
import 'admain/homeAdmain.dart';
import 'admain/Man/viewProdectsA.dart';
import 'view/Oredrs/TapOredrs.dart';

import 'admain/AdmainAddCategories.dart';
import 'admain/AdmainAddProdects.dart';
import 'authantion/Rigiseter.dart';
import 'authantion/SignIn.dart';
import 'authantion/middleware.dart';
import 'view/Profiel/profiel.dart';
import 'view/ViewProdects.dart';

List<GetPage> routes = [
  //  GetPage(name:'/home',page: ()=>Home(),),
  GetPage(name:'/SignIn',page: ()=>SignIn(), ),
  GetPage(name:'/Rigister',page: ()=>Rigister() ),//BidingControllerauth()
  GetPage(name:'/AddProdects',page: ()=>AddProdects() ),
  GetPage(name:'/Addcatgires',page: ()=>Addcatgires() ),
  GetPage(name:'/ViewPro',page: ()=>ViewPro() ),
  GetPage(name:'/Man',page: ()=>Man() ),
  GetPage(name:'/HomGirls',page: ()=>HomGirls(),binding: BidingControllerGirls() ),
  GetPage(name:'/HomePage',page: ()=>HomePage(),middlewares:[midielwhere()],binding: BidingControllerHome()),
  GetPage(name:'/PersonalInfo',page: ()=>PersonalInfo(),),
  GetPage(name:'/AddAddress',page: ()=>AddAddress(),),
  GetPage(name:'/Profiel',page: ()=>Profiel(),),
  GetPage(name:'/HomMAN',page: ()=>HomMAN(),binding: BidingControllerMan()),
  GetPage(name:'/Testview',page: ()=>Testview(),),
  GetPage(name:'/MyAddess',page: ()=>MyAddess(),),
  GetPage(name:'/ChooseAddres',page: ()=>ChooseAddres(),),
  GetPage(name:'/TapOredrs',page: ()=>TapOredrs(),),
  GetPage(name:'/ShowOrder',page: ()=>ShowOrder(),),
  GetPage(name:'/ShowPdMan',page: ()=>ShowPdMan(),),
  GetPage(name:'/AdmainOrders',page: ()=>AdmainOrders()),
  GetPage(name:'/ShowAdmainOrders',page: ()=>ShowAdmainOrders(),),
  GetPage(name:'/HomeAdmain',page: ()=>HomeAdmain(),binding: BidingControllerAdmain()),
  GetPage(name:'/viewprdectsA',page: ()=>viewprdectsA(),),
  GetPage(name:'/UpdetProdctsAD',page: ()=>UpdetProdctsAD(),),
  GetPage(name:'/ViewProdectsGirls',page: ()=>ViewProdectsGirls(),),
  GetPage(name:'/HomKids',page: ()=>HomKids(),binding: BidingControllerKids()),
  GetPage(name:'/ViewProdectsKids',page: ()=>ViewProdectsKids()),
  GetPage(name:'/HomWomens',page: ()=>HomWomens(),binding: BidingControllerWomens()),
  GetPage(name:'/ViewProdectsWomens',page: ()=>ViewProdectsWomens()),
  GetPage(name:'/HomeMassangerAdmain',page: ()=>HomeMassangerAdmain(),binding: BidingControllerChat()),
  GetPage(name:'/MassageAdmain',page: ()=>MassageAdmain()),
  GetPage(name:'/UserSendMassage',page: ()=>UserSendMassage(),binding: BidingControllerChat()),




//UserSendMassage


];