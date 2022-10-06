import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Url.dart';
import 'package:testapi/controllers/ControllerHome.dart';
import 'package:testapi/controllers/ControllerMan.dart';

import '../../Core/MyClass/Widgetss/ColorsWidget.dart';




class ShowPdMan extends StatelessWidget {

  ControllerMan c = Get.find();
  ControllerHome h = Get.find();

  @override
  Widget build(BuildContext context) {
    TextStyle ss = TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black);

    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,foregroundColor: Colors.black,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [

                  Container(
                      width: double.infinity,
                      height: 300,
                      child: Image.network('${urlImages}/${c.image}',fit: BoxFit.fitHeight,)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetBuilder<ControllerHome>(
                      init: ControllerHome(),
                      builder: (H)=>
                          Column(
                            children: [
                              CircleAvatar(child: IconButton(icon:Icon(Icons.shopping_cart,size: 36.5,color: Colors.black,),
                                  onPressed: ()async{
                                    await    h.cart(c.id).then((value) {
                                      h.addANDdeletCart(
                                          idprodect:'${c.id}',
                                          iduser:'${c.iduser}',
                                          sections: '${c.sections}',
                                          relashin: '${c.relations}',
                                      );
                                    });


                                  })
                                  ,radius: 28.5,backgroundColor: (h.iscart[c.id!]==h.nolike || h.iscart[c.id!] == null )? Colors.white:Colors.redAccent[400]),
                              CircleAvatar(
                                  child: IconButton(icon:Icon(Icons.favorite_border,size: 36.5,color: Colors.black,),
                                    onPressed: ()async{
                                      h.fovret(c.id
                                      );
                                      //
                                      await h.setanddeletefov(
                                          sectionss: '${c.sections}',
                                          iduser: '${c.iduser}',
                                          idprodect: '${c.id}',
                                          relashin: '${c.relations}'
                                      );


                                    },),
                                  radius:28.5,backgroundColor:h.isfovret[c.id]==h.nolike || h.isfovret[c.id] == null  ? Colors.white:Colors.cyan),
                            ],
                          ),
                    ),
                  ),

                ], ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${c.name}',style: ss,),
                        Spacer(),
                        if(c.discount!=0)
                          Container(child: Text('desciont',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.black,width: 1),
                            color:Colors.redAccent,

                          ),
                            padding: EdgeInsets.all(3),),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Text('${c.description}',style: ss,),
                    //Available sizes
                    SizedBox(height: 8,),
                    if(h.Colorsbool==true)
                      Text('Color :',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent),),
                    SizedBox(height: 8,),
                    if(h.Colorsbool==true)
                      if(c.id==h.ColorsProdects.data!.id)
                        ColorsWidgets(),
                    SizedBox(height: 8,),
                    Text('Available sizes :',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),),
                    SizedBox(height: 4,),
                    Text('${c.size}',style: ss,),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          decoration: BoxDecoration(
                            color:Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('${c.priec}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24,color: Colors.white)),
                              Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white)),
                            ],
                          ),
                        ),
                        SizedBox(width: 15,),
                        if(c.discount!=0)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('${c.oldPriec}',
                                  style: TextStyle(
                                      decorationThickness:2,
                                      decorationColor: Colors.blue,
                                      decoration:TextDecoration.lineThrough,fontWeight: FontWeight.w800,fontSize: 20,color: Colors.blue)),
                              Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              Center(child: GetBuilder<ControllerHome>(
                builder: (h)=>
                Card(
                  elevation: 6,
                  child:ElevatedButton.icon(icon: Icon(Icons.shopping_cart,size: 28,),onPressed: ()async{
                    await   h.cart(c.id).then((value) {
                      h.addANDdeletCart(
                          idprodect:'${c.id}',
                          iduser:'${c.iduser}',
                          sections: '${c.sections}',
                          relashin: '${c.relations}'
                      );
                    });
                  },label: Text(h.iscart[c.id]==h.nolike || h.iscart[c.id] == null  ?'Add to cart': 'Delet from cart ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.deepOrangeAccent),

                      padding: MaterialStateProperty.all(EdgeInsets.only(left: 45,right:45,top: 10,bottom: 10))
                  ),) ,),
              )),
            ],
          ),
        ),
      ),

    );
  }
}