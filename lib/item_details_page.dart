import 'package:POC2/crat_count.dart';
import 'package:POC2/tool_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatelessWidget {
  final String cartItem;
  final int price;

  ItemDetails({Key key, this.cartItem, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {

//    print("$cartItem");
    return Scaffold(
      body: Column(
        children: <Widget>[
          CommonToolBar(),
          SizedBox(height: 50,),
          Text(
            "Product Details",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 50,),
          Container(
            padding: EdgeInsets.all(20),
            height: 100,
            width: 400,
            color: Colors.cyan,
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                        child: Text(
                      "Product :$cartItem",
                      style: TextStyle(fontSize: 20),
                    )),
                    Text("price :$price", style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  width: 150,
                ),
                Consumer<CartCount>(
                  builder: (context, count, child) {
                    return GestureDetector(
                      child: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.white,
                      ),
                      onTap: () {
                        count.cartIncrement();
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
