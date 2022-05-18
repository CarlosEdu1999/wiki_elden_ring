
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'main.dart' as main;
import 'data_connection.dart';



class itemsRota extends StatefulWidget {
  const itemsRota({Key? key}) : super(key: key);

  @override
  State<itemsRota> createState() => _itemsRotaState();
}

class _itemsRotaState extends State<itemsRota> {

  List<Map> items = [];
  late List<Map> _items;

  Future<List<Map>> inializingItems()async{
    return await data.fetch();
  }


  Future<void> initializeItems()async{
    _items = await data.fetch();

    setState(() { items = _items;});

  }
  @override
  void initState() {
    super.initState();
    initializeItems();


  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {



    return FutureBuilder<List<Map>>(
      future: inializingItems(),
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF736AB7),
            appBar: AppBar(
              backgroundColor: Color(0xFF736AB7),
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
                      for (var i =0;i< items.length;i++)
                        InkWell(
                            child: Container(
                                padding: EdgeInsets.all(items.length.toDouble()),
                                decoration: BoxDecoration(
                                  border: Border.all(color:Colors.black),
                                  image: DecorationImage(
                                      fit: BoxFit.fill, image: NetworkImage(items.elementAt(i)['imageURL'] )),
                                ),child: Text(items.elementAt(i)['nome']),
                            ),
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
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
          return CircularProgressIndicator();
      },
    );



    }

    }


////////////////////////////////////////////////////
////////////////////////////////////////////////////

class itemDetail extends StatefulWidget {
  late var item;

  itemDetail(this.item);



  @override
  itemDetailScreenState createState() => itemDetailScreenState();
}

class itemDetailScreenState extends State<itemDetail> {

  late YoutubePlayerController controller;
  @override
  void initState() {
    String url = widget.item['videoURL'];
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: true,
        enableCaption: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF736AB7),

        appBar:  AppBar(
          backgroundColor: Color(0xFF736AB7),
          title:  Text('Descrição da Arma'),
        ),
        body:  ListView(
            children: <Widget>[
               Image.network(
                  NetworkImage(widget.item['imageURL']).url,),

               Container(

                padding: const EdgeInsets.all(32.0),
                child:  Row(
                  children: [
                    // First child in the Row for the name and the
                    // Release date information.
                     Expanded(
                      // Name and Release date are in the same column
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Code to create the view for name.

                          Row(

                             mainAxisAlignment: MainAxisAlignment.center,

                            children:[  Text(
                              widget.item['nome'],
                              textAlign: TextAlign.center,
                              style:  const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            SizedBox(height: 50,)

                          ]
                          ),

                          Container(// Code to create the view for release date.
                            alignment: FractionalOffset.center,
                            height: 35.0,
                            child:
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                              "Alcance da Arma : " + widget.item['alcanceDaArma'],
                              style:  const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                              Text(
                              "Categoria : " +widget.item['categoria'],
                              style:  const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )],),),
                       Container(// Code to create the view for release date.
                         alignment: FractionalOffset.center,
                         height: 35.0,
                         child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Localização : " + widget.item['location'],
                                style:  const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Habilidade : " +widget.item['skill'],
                                style:  const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )],),),
                       Container(// Code to create the view for release date.
                         alignment: FractionalOffset.center,
                         height: 35.0,
                         child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Peso : " + widget.item['peso'].toString(),
                                style:  const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Custo de Estamina : " +widget.item['fpCost'],
                                style:  const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )],),),

                        ],
                      ),
                    ),
                    // Icon to indicate the rating.

                  ],
                ),
              ),
              const Text('Dano',style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,),
              DataTable(

                  columns: const [
                    DataColumn(label: Text('Físico')),
                    DataColumn(label: Text('Mágico')),
                    DataColumn(label: Text('Fogo')),
                    DataColumn(label: Text('Elétrico')),
                    DataColumn(label: Text('Sagrado')),
                    DataColumn(label: Text('Crítico')),

                  ],
                  columnSpacing: 20.0,

                  rows: <DataRow>[
                    DataRow(cells: [
                      DataCell(Text(widget.item['dano']['physical'].toString())),
                      DataCell(Text(widget.item['dano']['magic'].toString())),
                      DataCell(Text(widget.item['dano']['fire'].toString())),
                      DataCell(Text(widget.item['dano']['lightining'].toString())),
                      DataCell(Text(widget.item['dano']['holy'].toString())),
                      DataCell(Text(widget.item['dano']['critical'].toString())),
                    ])

                  ]),
              const Text('Defesa',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
                textAlign: TextAlign.center,),
              DataTable(

                  columns: const [
                    DataColumn(label: Text('Físico')),
                    DataColumn(label: Text('Mágico')),
                    DataColumn(label: Text('Fogo')),
                    DataColumn(label: Text('Elétrico')),
                    DataColumn(label: Text('Sagrado')),
                    DataColumn(label: Text('Crítico')),

                  ],
                  columnSpacing: 20.0,

                  rows: <DataRow>[
                    DataRow(cells: [
                      DataCell(Text(widget.item['defesa']['physical'].toString())),
                      DataCell(Text(widget.item['defesa']['magic'].toString())),
                      DataCell(Text(widget.item['defesa']['fire'].toString())),
                      DataCell(Text(widget.item['defesa']['lightining'].toString())),
                      DataCell(Text(widget.item['defesa']['holy'].toString())),
                      DataCell(Text(widget.item['defesa']['guardBoost'].toString())),
                    ])

                  ]),
              SizedBox(height: 10,),
              const Text('Como e onde encontrar ?',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
                textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              SizedBox(

                child:YoutubePlayer(
                  controller: controller,
                  liveUIColor: Colors.amber,
                ) ,)

            ]
        )
    );
  }
}


