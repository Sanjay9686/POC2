import 'dart:async';
import 'dart:developer';

import 'package:POC2/crat_count.dart';
import 'package:POC2/item_model.dart';
import 'package:POC2/tool_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<CartCount>(
          create: (context) => CartCount(),
          child: MyHomePage(title: 'Cart Count')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ItemModel> list = [
    ItemModel(name: "HP", price: 20000),
    ItemModel(name: "DELL", price: 30000),
    ItemModel(name: "LENOVA", price: 40000),
    ItemModel(name: "MAC", price: 50000),
  ];
  // ignore: close_sinks
  final StreamController<CartCount> streamController=StreamController<CartCount>();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CartCount>(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//        actions: <Widget>[
//          Center(child: Text("${counter.value}",style: TextStyle(color: Colors.white,fontSize: 25),)),
//      IconButton(
//      icon: Icon(
//        Icons.card_giftcard,
//        color: Colors.white,
//      ),
//      ),
//
//        ],
//      ),
      body: Center(

        child: Column(

          children: <Widget>[
            CommonToolBar(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Select items and Add to cart',
              style: TextStyle(fontSize: 25),
            ),
            Container(
              height: 400,
              padding: EdgeInsets.all(20),
//           color: Colors.red,
              child: GestureDetector(
                child: ListView.separated(
                  itemCount: list.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
//                 color: Colors.black38,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
//                 boxShadow: Box
                        ),
                        child: ListTile(
                          title: Text(
                            "${list[index].name}",
                            style: TextStyle(color: Colors.red),
                          ),
                          subtitle: Text(
                            "${list[index].price}",
                            style: TextStyle(color: Colors.indigoAccent),
                          ),
                          trailing: GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.indigo,
                            ),
                            onTap: () {
                              counter.cartIncrement();
                            },
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                create: (_) => CartCount(),
                                child: ItemDetails(
                                  cartItem: list[index].name,
                                  price: list[index].price,
                                ))));
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            ),
            RaisedButton(
              child: Text("Reset"),
              onPressed: () {
                counter.reset();
              },
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
