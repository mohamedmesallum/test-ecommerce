

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/ControlerSign.dart';
import '../controllers/ControllerHome.dart';

class Rigister extends StatelessWidget {
  var email = TextEditingController();
  var passwerd= TextEditingController();
  var name = TextEditingController();
  var phone= TextEditingController();

  GlobalKey<FormState> formSignup = new GlobalKey<FormState>();


  // var verfiycode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('SIGN UP',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
      ),
      body:   Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/fashion.jpg'),
                radius:55,
              ),
              SizedBox(height: 8,),
              Text('welcome',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,)),
              SizedBox(height: 5,),
              Container(
                  width: double.infinity,

                  child: Center(child: Text('Create an account with email and phone ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black45)))),
              SizedBox(height: 20,),
              Center(child:Form(
                key: formSignup,
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                        validator: (text){

                          if(text!.isEmpty){
                            return 'Enter the name';
                          }
                          if(text.length>10){
                            return 'The name must not exceed 10 characters';
                          }else return null;
                        },

                        keyboardType:TextInputType.text,
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                        decoration:InputDecoration(
                          errorStyle:TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.w500),
                          prefixIcon:Icon(Icons.person,size: 23,color: Colors.blueGrey,),
                          hintText:'Name',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blueGrey),
                        )
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: email,
                        validator: (text){
                          if(text!.isEmpty){
                            return 'Enter your Email';
                          }
                          if(!text.contains('@gmail.com')){
                            return 'You must enter a valid email';
                          }else return null;
                        },

                        keyboardType:TextInputType.text,
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                        decoration:InputDecoration(
                          errorStyle:TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.w500),
                          prefixIcon:Icon(Icons.email,size: 23,color: Colors.blueGrey,),
                          hintText:'Email',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blueGrey),
                        )
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                        validator: (text){
                          if(text!.isEmpty){
                            return 'Enter phone number';
                          }
                          if(text.length<11){
                            return 'Please enter the correct phone number';
                          }else return null ;
                        },

                        keyboardType:TextInputType.text,
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                        controller: phone,
                        decoration:InputDecoration(
                          errorStyle:TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.w500),

                          prefixIcon:Icon(Icons.phone,size: 23,color: Colors.blueGrey,),
                          hintText:'Phone Number',
                          hintStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blueGrey),
                        )
                    ),
                    SizedBox(height: 15,),
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

                          keyboardType:TextInputType.text,
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                          controller: passwerd,
                          decoration:InputDecoration(


                            errorStyle:TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.w500),


                            prefixIcon: IconButton(onPressed: (){
                              s.ShowPASW();
                            },icon: Icon(s.HiddinPasw==false?Icons.visibility:Icons.visibility_off),),
                            hintText:'password',
                            hintStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blueGrey),

                          )
                      ),
                    ),
                  ],
                ),
              ),
              ),

              SizedBox(height:30,),
              GetBuilder<ControlerSign>(
                init: ControlerSign(),
                builder: (R)=>
                R.isloding==true?
                    CircularProgressIndicator():
                 ElevatedButton(onPressed: ()async{
                  var formdata = formSignup.currentState!;
                  if(formdata.validate()) {
                    await R.Rigister(
                    name: name.text,
                      email: email.text,
                      passwerd: passwerd.text,
                      phone: phone.text,
                   );








                  }else{
                    print('erorr vld');
                  }
                },child: Text('SIGN UP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                    style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Colors.blueGrey),
                        elevation:MaterialStateProperty .all(7) ,
                        overlayColor:MaterialStateProperty .all(Colors.blue),

                        padding: MaterialStateProperty.all(EdgeInsets.only(left:100,right:100,top: 9,bottom: 9))
                    )
                ),
              ),


              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already have an account ? ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black45)),
                  InkWell(
                      onTap: (){
                        Get.offAllNamed('/SignIn');
                      },
                      child: Text("Sign In",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.redAccent))),

                ],
              )


            ],
          ),
        ),
      ),

    );
  }
  }
//{
//         await c.Rigister(data: {
//           "username":username.text,
//           "email":email.text,
//           "passwerd":passwerd.text,
//         },);
//          if(c.dataUser.user.id != null){
//            s.sharedPreferences.setInt('tokan', c.dataUser.user.id).then((value) {
//              Get.offAllNamed('home');
//            });
//          }
//
//
//
//
//
//       }