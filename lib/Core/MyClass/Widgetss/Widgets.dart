import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Core/Function/CheckIntrnet.dart';
import 'package:testapi/controllers/CntrollerAdmain.dart';
import 'package:testapi/controllers/ControlerSign.dart';
import 'package:testapi/controllers/ControllerHome.dart';
import 'package:testapi/Data/Model/Favorites.dart';

import '../../../Url.dart';
import '../../../authantion/getsevises.dart';

Widget textFiledlogin({required TextEditingController controller,required TextInputType keyboardType ,
  required String lable,required Icon Icon }){
  return   TextFormField(
    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      suffixIcon:Icon,
      enabledBorder:OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black,width: 2,),
        borderRadius: BorderRadius.circular(20),
      ),
      label: Text(lable),
      labelStyle:  TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
    ),
  );
}
Widget Catgre ({required String image,required String name,required Future onTap()}){
  return InkWell(
    onTap:  onTap,
    child: Padding(
      padding: const EdgeInsets.only(right: 5,left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius:48,
            backgroundImage:NetworkImage('${urlImages}/${image}'),
          ),
          Text('${name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.black))
        ],
      ),

    ),
  );
}
Widget profielwidget({required String titel,required Function() onTap}){
  return
    Container(
    height: 65,
    child: InkWell(
      onTap: onTap,
      child: Card(
        elevation: 1,
        shadowColor: Colors.blueGrey,

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(titel,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.blueAccent),),
              Spacer(),
              Icon(Icons.arrow_forward_ios,size: 23,color: Colors.blueAccent,)
            ],
          ),
        ),
      ),
    ),
  );
}
Widget infoperson({required String info,required String UserData,required Function() onTap,required IconData Icons}){
  return     Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(onPressed: onTap, icon: Icon(Icons,size: 30,color: Colors.lightBlueAccent)),
      Text(info,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.blueGrey),),

      Text(UserData,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),


    ],
  );
}
Widget DrawerNew(){
  servises s =  Get.find();
  ControlerSign c = Get.find();
  return SafeArea(
    child: Container(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,

        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 170.0,
              height: 128.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 64.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                  'images/fashion.jpg',
              ),
            ),

            ListTile(
              onTap: () {
                Get.toNamed('/Profiel');
              },
              leading: Icon(Icons.account_circle_rounded,size: 25,),
              title: Text('Profile',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
            ),
            ListTile(
              onTap: ()async {
                Get.toNamed('/MyAddess');
              //  await c.GetAddress();
//.then((value) => );
              },
              leading: Icon(Icons.add_location,size: 25,),
              title: Text('Addresses',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
            ),
            //language
            ListTile(
              onTap: () {
                Get.toNamed('/TapOredrs');
              },
              leading: Icon(Icons.add_shopping_cart_rounded,size: 25,),
              title: Text('Orders',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
            ),
            ListTile(
              onTap: () {
                Get.toNamed('/UserSendMassage');
              },
              leading: Icon(Icons.mark_chat_unread_sharp,size: 25,),
              title: Text('Massages',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
            ),

            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings,size: 25,),
              title: Text('Settings',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
            ),

            ListTile(
              onTap: () async{
                Get.toNamed('/HomeAdmain');


              },
              leading: Icon(Icons.logout,size: 25,),
              title: Text('Admain',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
            ),
            ListTile(
              onTap: () async{
             await   s.sharedPreferences.remove('tokan').then((value){
                  Get.offAllNamed('/SignIn');

                });
              },
              leading: Icon(Icons.logout,size: 25,),
              title: Text('Log out',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
            ),


            Spacer(),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 15,
                color: Colors.white38,
                fontWeight: FontWeight.w900
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,

                  ),
                  child: Text('Fashionable Shopping without limits'),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
SnackarCARTAndFov({required String message,required Color color}){
  Get.snackbar('', '',duration: Duration(seconds: 1),
      snackPosition: SnackPosition.BOTTOM,margin:EdgeInsets.only(bottom: 30,left: 100,right: 100),
      borderRadius:50,
      titleText:Text(message,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: color),textAlign: TextAlign.center,)

  );
}


SnackbarController ErorrSnackbar ({required String masseg,required Icon Icon ,required Color color}){
  return

    Get.snackbar('', '',duration: Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,margin:EdgeInsets.only(bottom: 30,left: 100,right: 100),
        borderRadius:50,
        titleText:Text(masseg,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: color),textAlign: TextAlign.center,)
,icon: Icon,
    );
}
Widget Descont (){
  return  Container(child: Text('desciont',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(10),
    // border: Border.all(color: Colors.black,width: 1),
    color:Colors.deepOrangeAccent,

  ),
    padding: EdgeInsets.all(3),);
}
Widget seeALL({required Future ontap()}){
  return    InkWell(
    onTap:ontap,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('See all',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.redAccent)),
        SizedBox(width: 3,),
        Icon(Icons.double_arrow,color: Colors.redAccent,size: 14,)
      ],
    ),
  );
}
Widget ElvetBouttenCansel(){
  return  ElevatedButton(onPressed:(){

    Get.back();
  },
      child: Text('Cancel',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
      style: ButtonStyle(
          overlayColor:MaterialStateProperty .all(Colors.blue),
          elevation:MaterialStateProperty.all(7),
          backgroundColor:MaterialStateProperty.all(Colors.redAccent),


          padding: MaterialStateProperty.all(EdgeInsets.only(left:20,right:20,top:2,bottom: 2))
      )

  );
}
Widget ElvettBoutten ({required Future ontap(),required String name ,required Color color }){
  return   ElevatedButton(onPressed:ontap,
      child: Text(name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
      style: ButtonStyle(
          overlayColor:MaterialStateProperty .all(Colors.blue),
          elevation:MaterialStateProperty.all(7),
          backgroundColor:MaterialStateProperty.all(color),


          padding: MaterialStateProperty.all(EdgeInsets.only(left:50,right:50,top:10,bottom: 10))
      )

  );
}
class TextFieldAddres extends StatelessWidget{
  double width;
  String lable;
  TextEditingController controller;
  TextInputType keyboardType;

  TextFieldAddres({required this.width,required this.lable,required this.keyboardType,required this.controller});
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(lable,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.blueGrey),),
        const SizedBox(height: 7,),
        Container(
          width: width,

          decoration:BoxDecoration(

            border: Border.all(width: 1.5,color: Colors.black),
            borderRadius: BorderRadius.circular(35),
          ) ,
          child: TextField(

              controller: controller,
              style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 22),
              decoration: const InputDecoration(


                  focusedBorder:InputBorder.none,

                  contentPadding:EdgeInsets.only(left: 15,top: 5,bottom:5)
              ),
              keyboardType:keyboardType

          ),

        ),
      ],
    );
  }

}
Widget Rowaddres(String name , String Data){
  return  Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('${name} :',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w900,color: Colors.black),),
     SizedBox(height: 3,),
      Container(
width: 250,
          child: Text('${Data}',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w900,color: Colors.black45,),maxLines:4,overflow:TextOverflow.ellipsis),),

    ],
  );
}
//Widget CheckoxColors ({required bool boolColors ,required  int nameColor , required Color color ,required Function FunSerStet }){
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children:[
//
//       CircleAvatar(radius: 20,backgroundColor:color,),
//
//       Checkbox(value: boolColors , onChanged: (val){
//         FunSerStet(() {
//           boolColors = val! ;
//           if(boolColors==true){
//            nameColor = 1;
//           }else{
//             nameColor = 0;
//           }
//           print('${boolColors}'.toString());
//           print(' white = ${nameColor}'.toString());
//
//
//         });
//       })
//     ],
//   );
// }
Widget ceckbox({required String name,required Color color,required bool boolcolor,required int intcolor }){
  return
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[

        InkWell(
            onTap: (){
              print(boolcolor.toString());
            },
            child: CircleAvatar(radius: 15,backgroundColor:color,)),
        Text(name),
        GetBuilder<ControllerAdmain>(
          init: ControllerAdmain(),
          builder: (A)=>
              GetBuilder<ControllerAdmain>(
                init: ControllerAdmain(),
                builder: (A)=>
                 Checkbox(value: boolcolor , onChanged: (val){
                   boolcolor = val!;

                   A.funtobool();








                  print('${intcolor}');
                  print('${name} = ${boolcolor}'.toString());
                }),
              ),
        ),

      ],
    );
}