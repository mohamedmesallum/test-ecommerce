import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapi/Url.dart';

import '../../../controllers/ControllerHome.dart';
import '../../../Data/Model/Favorites.dart' as car;

class widgetCart extends StatefulWidget{
  //ControllerHome cotr;

final List<car.Data>  DATALIST;
final int index;
 const widgetCart(this.DATALIST,this.index);

  @override
  State<widgetCart> createState() => _widgetCartState();
}
class _widgetCartState extends State<widgetCart> {
ControllerHome c = Get.find();
  int cont = 1;
  @override
  Widget build(BuildContext context) {
    return

      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
    child: Column(
    children: [
    Card(
    elevation: 7,
    shadowColor: Colors.blueGrey,
    child: Container(
    width: double.infinity,
    height: 150,
    //color:Colors.blueAccent,
    child: Row
      (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Padding(
    padding: const EdgeInsets.only(left:2,top: 2),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text("${widget.DATALIST[widget.index].name}",
    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
   // SizedBox(height: 20,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Row(
    //mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Text('${ widget.DATALIST[widget.index].priec}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,color: Colors.deepOrangeAccent)),
    Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
    ],
    ),
    SizedBox(width: 7,),
    if( widget.DATALIST[widget.index].discount!=0)
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Text('${ widget.DATALIST[widget.index].oldPriec}',
    style: TextStyle(
    decorationThickness:2,
    decorationColor: Colors.blue,
    decoration:TextDecoration.lineThrough,fontWeight: FontWeight.w800,fontSize: 18,color: Colors.blue)),
    Text('L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),
    ],
    ),
    ],
    ),
   // SizedBox(height: 20,),


    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    CircleAvatar(
    backgroundColor: Colors.blueGrey,
    radius:16,
    child: IconButton(onPressed: () {
    setState(() {
    if(cont>1){
    cont--;
    widget.DATALIST[widget.index].count=cont;
    widget.DATALIST[widget.index].total =widget.DATALIST[widget.index].count! * widget.DATALIST[widget.index].priec! ;
   c. gettotal();
   c.getlentheCart();
    print('${ widget.DATALIST[widget.index].count} /========cont ');

    print('${ widget.DATALIST[widget.index].total} /========total ');

    }
    });



    }, icon:Center(child: Icon(Icons.remove,size: 16,color: Colors.white,)) )),
    SizedBox(width: 7,),

    GetBuilder<ControllerHome>(
    init: ControllerHome(),
    builder: (l)=>
    Text('${widget.DATALIST[widget.index].count!}',
    style: TextStyle(fontSize: 27,color: Colors.deepOrangeAccent),),
    ),
    SizedBox(width: 7,),
    CircleAvatar(
    backgroundColor: Colors.blueGrey,
    radius:16,
    child: IconButton(onPressed: (){
    setState(() {

    cont++;
    widget.DATALIST[widget.index].count=cont;
    widget.DATALIST[widget.index].total =widget.DATALIST[widget.index].count! * widget.DATALIST[widget.index].priec! ;
c. gettotal();
    c.getlentheCart();
    print('${ widget.DATALIST[widget.index].count} /========cont ');
    print('${ widget.DATALIST[widget.index].total} /========total ');

    });
    }, icon:Center(child: Icon(Icons.add,size: 16,color: Colors.white,)) )),
    ],
    ),


   // SizedBox(height: 15,),
    Row(

    children: [
    InkWell(
    onTap:(){

    },
    child: Text('Priec',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.blue),)),

    SizedBox(width: 10,),
    Chip(
    // backgroundColor: Colors.black45,
    elevation:4,
    //shadowColor: Colors.red,
    labelPadding:EdgeInsets.all(3),
    label: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Text('${widget.DATALIST[widget.index].count! * widget.DATALIST[widget.index].priec! }',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
    Text(' L.E',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black)),

    ],
    ),

    ),


    ],
    ),
    ],
    ),
    ),
    Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(child:

        FadeInImage.assetNetwork(
          fit:BoxFit.fill,
          placeholder: 'images/FASHION.PNG',
          image: '${urlImages}/${widget.DATALIST[widget.index].image}',
          imageErrorBuilder: (c,o,s)=>Image.asset('images/error.png',fit: BoxFit.fill,),)
          ,height: 150,width: 175,),
      Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child:
            Icon(Icons.arrow_back_outlined,color: Colors.redAccent,size: 22,),

//
      )

      ],
    ),

    ],
    ),

    ),
    ),
    SizedBox(height: 4,)
    ],
    ),
    );

  }
}