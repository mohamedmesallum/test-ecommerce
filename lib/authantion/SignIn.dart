
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/controllers/ControlerSign.dart';



class SignIn extends StatelessWidget {
  GlobalKey<FormState> formstetSin = new GlobalKey<FormState>();
  var email = TextEditingController();
  var passwerd= TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('SIGN IN',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/fashion.jpg'),
                radius:90,
              ),
              SizedBox(height: 8,),
              Text('welcome back',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,)),
              SizedBox(height: 5,),
              Text('Sing In With Your Email And Password ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black45)),
              SizedBox(height:2,),
              Text('OR ',style: TextStyle(fontSize:18,fontWeight: FontWeight.w800,color: Colors.black45)),
              SizedBox(height:2,),
              Text('Sing In Via Social Media',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black45)),
              SizedBox(height: 20,),
              Center(child:Form(
                key: formstetSin,
                child: Column(
                  children: [
                    TextFormField(
                        validator: (text){
                          if(text!.isEmpty){
                            return 'Enter your Email';
                          }
                          if(!text.contains('@gmail.com')){
                            return 'You must enter a valid email';
                          }else return null;
                        },
                        controller:email,
                        keyboardType:TextInputType.text,
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                        decoration:InputDecoration(
                          errorStyle:TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.w500),

                          prefixIcon:Icon(Icons.email,size: 23,color: Colors.blueGrey,),
                          hintText:'Email',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blueGrey),
                        )
                    ),
                    SizedBox(height: 23,),
                    GetBuilder<ControlerSign>(
                      init: ControlerSign(),
                      builder: (s)=>
                       TextFormField(
                         obscureText:s.HiddinPasw ,
                          validator: (text){
                            if(text!.isEmpty){
                              return 'Enter the password';
                            }
                            if(text.length<5){
                              return 'Password must be greater than 6 numbers ';
                            }else return null;
                          },
                          controller: passwerd,
                          keyboardType:TextInputType.text,

                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                          decoration:InputDecoration(

                            errorStyle:TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.w500),




                            prefixIcon:
                            IconButton(onPressed: (){
                              s.ShowPASW();
                            },icon: Icon(s.HiddinPasw==false?Icons.visibility:Icons.visibility_off,color: Colors.blueGrey,),),
                            hintText:'password',
                            hintStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blueGrey),

                          )
                      ),
                    ),
                  ],
                ),
              ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot password ?',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.redAccent)),

                ],),
              SizedBox(height:15,),

               GetBuilder<ControlerSign>(
                 init: ControlerSign(),
                 builder: (n)=>
                 n.isloding==true?CircularProgressIndicator():
                 ElevatedButton(onPressed: ()async{
                    var formdata = formstetSin.currentState!;
                    if(formdata.validate()){
                    await n.Sign(
                      email:email.text,
                      passwerd:passwerd.text,
                    );

             }else{
                   print('erorr vald');
             }
                  },child: Text('SIGN IN',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                      style: ButtonStyle(
                          overlayColor:MaterialStateProperty .all(Colors.blue),
                          elevation:MaterialStateProperty.all(7),
                          backgroundColor:MaterialStateProperty.all(Colors.blueGrey),

                          padding: MaterialStateProperty.all(EdgeInsets.only(left:100,right:100,top: 9,bottom: 9))
                      )

              )
               ),
              SizedBox(height:15,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/Facebook.png'),
                    radius: 15,
                  ),
                  SizedBox(width:20,),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/gmail.png'),
                    backgroundColor: Colors.white,
                    radius: 15,
                  ),
                  SizedBox(width:17),
                  InkWell(
                    onTap: (){
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/twter.jpg'),
                      radius: 15,
                    ),
                  ),


                ],
              ),
              SizedBox(height:10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an account ? ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black45)),
                  InkWell(
                      onTap: (){
                        Get.offAllNamed('/Rigister');
                      },
                      child: Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.redAccent))),

                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
