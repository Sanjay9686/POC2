import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'crat_count.dart';

class CommonToolBar extends StatefulWidget {
  @override
  _CommonToolBarState createState() => _CommonToolBarState();
}

class _CommonToolBarState extends State<CommonToolBar> {
  @override
  Widget build(BuildContext context) {
//    final counter=Provider.of<CartCount>(context);
    return Container(
//      height: 30,
       width: double.infinity,
       color: Colors.blue,
       padding: EdgeInsets.only(top: 30,left: 20,),
       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Text("Cart Count",style: TextStyle(fontSize: 30,color: Colors.white),),
       SizedBox(width: 200,),
       Center(
           child: Consumer<CartCount>(
           builder:(context,count,child){

             return Text("${count.value}",style: TextStyle(color: Colors.white,fontSize: 25),);
           },
           )),
       IconButton(
         icon: Icon(
           Icons.card_giftcard,
           color: Colors.white,
         ),
       )
         ],
       ),

    );
  }
}
