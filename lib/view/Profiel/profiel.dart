
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/MyClass/Widgetss/Widgets.dart';
import '../../controllers/ControlerSign.dart';

class Profiel extends StatelessWidget {
  ControlerSign c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,

          flexibleSpace:Padding(
            padding: const EdgeInsets.all(0),
            child: Image.asset('images/fashion.jpg',fit: BoxFit.fill,),
          )

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
         ListTile(
           leading: Icon(Icons.person_outlined,size: 30,color: Colors.blueGrey,
           ),
           title:
           Text('${c.userdata.data!.username}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),

    ),
          ListTile(
            leading: Icon(Icons.email_outlined,size: 30,color: Colors.blueGrey,
            ),
            title:
            Text('${c.userdata.data!.email}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),

          ),
          ListTile(
            leading: Icon(Icons.phone_outlined,size: 30,color: Colors.blueGrey,
            ),
            title:
            Text('${c.userdata.data!.phone}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),

          ),


          SizedBox(height: 30,),

          SizedBox(height:15,),
          profielwidget(titel:'add address' ,onTap: (){
            Get.toNamed('/AddAddress');
          }),
          SizedBox(height:15,),
          profielwidget(titel:'change password' ,onTap: (){}),
          SizedBox(height:15,),
          profielwidget(titel:'change email address' ,onTap: (){}),
          SizedBox(height:15,),
          Container(child: profielwidget(titel:'add another number' ,onTap: (){})),

        ],
      ),
    );
  }
}
// Container(
//             width: double.infinity,
//             //height: 50,
//             child: Card(
//               elevation: 7,
//               color: Colors.white,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//
//
//                       Container(
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                          borderRadius: BorderRadius.circular(7)
//                        ),
//                         padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
//
//                           child: Text('information',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
//                      SizedBox(width: 15,),
//                       Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(7)
//                           ),
//                           padding: EdgeInsets.symmetric(vertical: 2,horizontal:5),
//
//                           child: Text('Latest orders',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
//                       SizedBox(width: 15,),
//
//                       Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10)
//                           ),
//                           padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
//
//                           child: Text('Messages',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
//                     ],
//                   ),
//                 ),
//               )
//             ),
//           ),
// //
//Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
//                 child: Stack(
//                   alignment: Alignment.bottomRight,
//                   children: [
//                     Container(
//                       width: double.infinity,
//
//                       height: 190,
//
//                       decoration: BoxDecoration(
//                           color: Colors.white10,
//                           borderRadius: BorderRadius.circular(50)
//                       ),
//
//
//                       child: CircleAvatar(
//                         backgroundColor: Colors.grey,
//                         radius: 10,
//                         child: Icon(Icons.person,size: 150,color: Colors.white,),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 95,),
//                       child: CircleAvatar(
//                           radius: 22,
//                           backgroundColor: Colors.black26,
//                           child: IconButton(onPressed: (){}, icon:Icon(Icons.camera_alt_outlined,size: 27,color: Colors.black,) )),
//                     )
//                   ],
//
//                 ),
//               ),
//             ),