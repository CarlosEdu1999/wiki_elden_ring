
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'main.dart';
import 'data_connection.dart';




////////////////////////////////////////////////////
////////////////////////////////////////////////////
class ItemsRota extends StatelessWidget {
   ItemsRota({Key? key}) : super(key: key);

   late List<Map> items;

  get isSelected => null;


   Future<List<Map>> getData() async {
     var listaItems = await data.fetch();
     items = listaItems;
     return listaItems;
   }

  @override
  Widget build(BuildContext context) {
     getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[

          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                for (var i =0;i<items.length;i++)
                  InkWell(
                      child: Container(
                          padding: EdgeInsets.all(items.length.toDouble()),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill, image: AssetImage(items.elementAt(i)['imageURL'])),
                          )),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return itemDetail(items.elementAt(i));
                        }));
                      })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class itemDetail extends StatefulWidget {
  late var item;

  itemDetail(this.item);



  @override
  itemDetailScreenState createState() => itemDetailScreenState();
}

class itemDetailScreenState extends State<itemDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
            child: Hero(tag: "caelid", child: Image.asset(widget.item['imageURL'],scale: 0.5,))),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}


