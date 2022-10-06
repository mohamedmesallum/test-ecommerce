
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/CntrollerAdmain.dart';

class WidgetCesckbox extends StatelessWidget {

  ControllerAdmain A = Get.find();
  @override
  Widget build(BuildContext context) {
    return

      GetBuilder<ControllerAdmain>(
      init: ControllerAdmain(),
        builder: (A)=>
            Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                   CircleAvatar(radius: 15,backgroundColor:Colors.black,),
                    Text('black'),

                                Checkbox(value:A.boolBlackk , onChanged: (val){
                                  A.boolBlackk  = val!;
                                  A.boolBlackk ==true?A.valBlack=1:A.valBlack=0;
                                  A.funtobool();
                                  print('${A.boolBlackk }=${A.valBlack}');

                                }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(radius: 15,backgroundColor:Colors.yellow,),
                    Text('Yello'),

                    Checkbox(value:A.boolYelloo , onChanged: (val){
                      A.boolYelloo  = val!;
                      A.boolYelloo ==true?A.valYello=1:A.valYello=0;
                      A.funtobool();
                      print('${A.boolYelloo }=${A.valYello}');

                    }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(backgroundColor: Colors.black,radius: 15.5,child: CircleAvatar(radius: 15,backgroundColor:Colors.white,)),
                    Text('white'),

                    Checkbox(value:A.boolWhitee , onChanged: (val){
                      A.boolWhitee   = val!;
                      A.boolWhitee  ==true?A.valWhite=1:A.valWhite=0;
                      A.funtobool();
                      print('${A.boolWhitee  }=${A.valWhite}');

                    }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(radius: 15,backgroundColor:Colors.blue,),
                    Text('black'),

                    Checkbox(value:A.boolBluee , onChanged: (val){
                      A.boolBluee  = val!;
                      A.boolBluee ==true?A.valBlue=1:A.valBlue=0;
                      A.funtobool();
                      print('${A.boolBluee }=${A.valBlue}');

                    }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(radius: 15,backgroundColor:Colors.red,),
                    Text('red'),

                    Checkbox(value:A.boolRedd , onChanged: (val){
                      A.boolRedd  = val!;
                      A.boolRedd ==true?A.valRed=1:A.valRed=0;
                      A.funtobool();
                      print('${A.boolRedd }=${A.valRed}');

                    }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(radius: 15,backgroundColor:Colors.green,),
                    Text('green'),

                    Checkbox(value:A.boolGreenn , onChanged: (val){
                      A.boolGreenn = val!;
                      A.boolGreenn  ==true?A.valGreen=1:A.valGreen=0;
                      A.funtobool();
                      print('${A.boolGreenn }=${A.valGreen}');

                    }),


                  ],
                ),



              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(radius: 15,backgroundColor:Colors.brown,),
                    Text('brown'),

                    Checkbox(value:A.boolBrownn , onChanged: (val){
                      A.boolBrownn = val!;
                      A.boolBrownn ==true?A.valBrown=1:A.valBrown=0;
                      A.funtobool();
                      print('${A.boolBrownn }=${A.valBrown}');

                    }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(radius: 15,backgroundColor:Colors.blueAccent,),
                    Text('azure'),

                    Checkbox(value:A.boolAzuree , onChanged: (val){
                      A.boolAzuree  = val!;
                      A.boolAzuree ==true?A.valAzure=1:A.valAzure=0;
                      A.funtobool();
                      print('${A.boolAzuree }=${A.valAzure}');

                    }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                     CircleAvatar(backgroundColor: Colors.black,radius: 15.5,child: CircleAvatar(radius: 15,backgroundColor:Colors.white54,)),
                    Text('silver'),

                    Checkbox(value:A.boolSilverr , onChanged: (val){
                      A.boolSilverr= val!;
                      A.boolSilverr==true?A.valSilver=1:A.valSilver=0;
                      A.funtobool();
                      print('${A.boolSilverr}=${A.valSilver}');

                    }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(radius: 15,backgroundColor:Colors.purple,),
                    Text('purple'),

                    Checkbox(value:A.boolPurplee , onChanged: (val){
                      A.boolPurplee  = val!;
                      A.boolPurplee ==true?A.valPurple=1:A.valPurple=0;
                      A.funtobool();
                      print('${A.boolPurplee }=${A.valPurple}');

                    }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(radius: 15,backgroundColor:Colors.grey,),
                    Text('grey'),

                    Checkbox(value:A.boolGrayy , onChanged: (val){
                      A.boolGrayy = val!;
                      A.boolGrayy==true?A.valGray=1:A.valGray=0;
                      A.funtobool();
                      print('${A.boolGrayy }=${A.valGray}');

                    }),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[

                    CircleAvatar(radius: 15,backgroundColor:Colors.orange),
                    Text('orange'),
                    Checkbox(value:A.boolOrangee , onChanged: (val){
                      A.boolOrangee = val!;
                      A.boolOrangee  ==true?A.valOrange=1:A.valOrange=0;
                      A.funtobool();
                      print('${A.boolOrangee}=${A.valOrange}');

                    }),


                  ],
                ),



              ],
            ),
          ],
        ),
      );


  }
}
