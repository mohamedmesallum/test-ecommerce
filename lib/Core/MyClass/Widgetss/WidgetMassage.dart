import 'package:flutter/material.dart';

class WidgetMassage extends StatelessWidget {
  final String massage;
  final bool isme;
  WidgetMassage(this.massage,this.isme);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isme? MainAxisAlignment.start:MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isme?Colors.lightBlue:Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(14) ,
              topRight:Radius.circular(14) ,
              bottomLeft: isme? Radius.circular(0):Radius.circular(14),
              bottomRight:isme? Radius.circular(0):Radius.circular(14),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical:10 ,horizontal:16 ),
          margin:EdgeInsets.symmetric(vertical:4 ,horizontal:8 ),
          child: Column(
            mainAxisAlignment:  isme? MainAxisAlignment.end: MainAxisAlignment.start,
            children: [
              Text(
                massage,style:TextStyle(
                  fontSize: 22,fontWeight: FontWeight.w900,
                  color: isme ? Colors.white:Colors.black
              ),
                textAlign: isme? TextAlign.end : TextAlign.start,
              )

            ],
          ),
        )
      ],
    );
  }
}