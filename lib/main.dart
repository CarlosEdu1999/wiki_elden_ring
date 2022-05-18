import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'itemsPage.dart';
import 'package:photo_view/photo_view.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        primarySwatch: Colors.lime,
      ),
      home: const MyHomePage(title: 'Elden Ring Wiki'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final image = [
  //   'assets/images/caelid.jpg',
  //   'assets/images/Consecrated_Snowfield.jpg',
  //   'assets/images/crumbling_farum_azula.jpg',
  //   'assets/images/deeprot_depths.jpg',
  //   'assets/images/lake_of_rot.jpg',
  //   'assets/images/limgrave.jpg',
  //   'assets/images/liurnia.jpg',
  //   'assets/images/monta_dos_gigante.jpg',
  //   'assets/images/plato_altus.jpg',
  //   'assets/images/rio_siofa.jpg',
  //   'assets/images/rio_ansiel.jpg',
  //   'assets/images/weeping_peninsula.jpg'
  // ];
  final image = [
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/limgrave_reg_map_elden_ring_wiki_guide_1920px.jpg?v=1652594978719',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/weeping-peninsula_location_map_elden_ring_wiki_guide_2560px.jpg?v=1648027950824',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/liurnia_of_the_lakes_location_map_elden_ring_wiki_guide_2560px.jpg?v=1648030170450',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/siofra_river_location_map_elden_ring_wiki_guide_2560px.jpg?v=1647877354088',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/caelid_location_map_elden_ring_wiki_guide_2560px.jpg?v=1648008336140',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/altus_plateau_location_map_elden_ring_wiki_guide_2560px.jpg?v=1647583002486',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/mountaintops_of_the_giants_location_map_elden_ring_wiki_guide_2560px.jpg?v=1647590875551',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/consecrated_snowfield_location_map_elden_ring_wiki_guide_1920px.jpg?v=1647592652165',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/crumbling_farum_azula_location_map_elden_ring_wiki_guide_1920px.jpg?v=1647593867305',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/ainsel_river_location_map_elden_ring_wiki_guide_1920px.jpg?v=1647625959534',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/lake_of_rot_location_map_elden_ring_wiki_guide_1920px.jpg?v=1647626169089',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/deeproot_depths_location_map_elden_ring_wiki_guide_2560px.jpg?v=1647626370795'
  ];
  late YoutubePlayerController controller;


  void _proximaRota() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  SecondRota()),
      );
    });
  }

  void _itemRota() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const itemsRota()),
      );
    });
  }


  @override
  void initState() {
    String url = "https://www.youtube.com/watch?v=AKXiKBnzpBQ&ab_channel=GameSpot";
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

  Container _getBackground() {
    return Container(
      child: Image.network(
        'https://i0.wp.com/metagalaxia.com.br/wp-content/uploads/2022/02/Elden-Ring-capa-1.webp?w=1280&ssl=1',
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: const BoxConstraints.expand(height: 300.0),
    );
  }

  Widget _getContent() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        Container(

          height: 154.0,
          margin: const EdgeInsets.only(top: 72.0),
          decoration: BoxDecoration(

            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
        ),
        Container(
          child: Column(children:  [
            const Text(
              '\nElden Ring Wiki',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\nHistória: O Maculado em breve voltará',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Text(
              '\nElden Ring é um RPG de fantasia sombria que permite que você jogue '
                  'um dos descendentes dos Maculados. Um pária, você deve entrar nas '
                  'Terras Intermediárias para tentar ser readmitido na sociedade de lá '
                  'como um Elden Lord. \nPara fazer isso, você deve revelar o mistério do '
                  'lendário Elden Ring. Suas aventuras nas Terras Intermediárias estarão repletas'
                  ' de ameaças e cheias de desconhecidos. \nOnde quer que você vá, você terá a oportunidade'
                  ' de personalizar quase todos os aspectos do seu personagem, de classe a armadura e armamento.'
                  ' \nE você terá grande liberdade sobre onde, exatamente, você anda e como você interage com os'
                  ' personagens que encontra ao longo do caminho.',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  leadingDistribution: TextLeadingDistribution.proportional),
            ),
            SizedBox(height: 20,),
            SizedBox(

              child:YoutubePlayer(
              controller: controller,
              liveUIColor: Colors.amber,
            ) ,)
          ]),
          height: 900,
          margin: const EdgeInsets.only(top: 72.0),
          decoration: BoxDecoration(

            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
        ),


      ],
    );
  }

  Container _getGradient() {
    return Container(
      margin: const EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0x00736AB7),
            Color(0xFF736AB7)
          ],
          stops: [0.0, 0.9],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          color: Color(0xFF736AB7),
          child: Stack(
            children: <Widget>[
              _getBackground(),
              _getGradient(),
              _getContent(),

            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Color(0xFF736AB7),
                    heroTag: "%4",
                    onPressed: _proximaRota,
                    child: const Icon(Icons.map),
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xFF736AB7),
                    heroTag: "%%%",
                    onPressed: _itemRota,
                    child: const Icon(MdiIcons.sword),
                  )
                ])));
  }
}
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//
//       body: SingleChildScrollView(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Image.asset('assets/images/elden_ring.jpg'),
//             const Text(
//               '\nO Maculado em breve voltará',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               '\nElden Ring é um RPG de fantasia sombria que permite que você jogue '
//               'um dos descendentes dos Maculados. Um pária, você deve entrar nas '
//               'Terras Intermediárias para tentar ser readmitido na sociedade de lá '
//               'como um Elden Lord. \nPara fazer isso, você deve revelar o mistério do '
//               'lendário Elden Ring. Suas aventuras nas Terras Intermediárias estarão repletas'
//               ' de ameaças e cheias de desconhecidos. \nOnde quer que você vá, você terá a oportunidade'
//               ' de personalizar quase todos os aspectos do seu personagem, de classe a armadura e armamento.'
//               ' \nE você terá grande liberdade sobre onde, exatamente, você anda e como você interage com os'
//               ' personagens que encontra ao longo do caminho.',
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.normal,
//                   leadingDistribution: TextLeadingDistribution.even),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width *1,
//               height: MediaQuery.of(context).size.height *0.60,
//               child:YoutubePlayer(
//               controller: controller,
//               liveUIColor: Colors.amber,
//             ) ,)
//
//           ],
//         ),
//       ),
//
//



  class SecondRota extends StatelessWidget {
   SecondRota({Key? key}) : super(key: key);

  final images = [
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/limgrave_reg_map_elden_ring_wiki_guide_1920px.jpg?v=1652594978719',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/weeping-peninsula_location_map_elden_ring_wiki_guide_2560px.jpg?v=1648027950824',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/liurnia_of_the_lakes_location_map_elden_ring_wiki_guide_2560px.jpg?v=1648030170450',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/siofra_river_location_map_elden_ring_wiki_guide_2560px.jpg?v=1647877354088',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/caelid_location_map_elden_ring_wiki_guide_2560px.jpg?v=1648008336140',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/altus_plateau_location_map_elden_ring_wiki_guide_2560px.jpg?v=1647583002486',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/mountaintops_of_the_giants_location_map_elden_ring_wiki_guide_2560px.jpg?v=1647590875551',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/consecrated_snowfield_location_map_elden_ring_wiki_guide_1920px.jpg?v=1647592652165',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/crumbling_farum_azula_location_map_elden_ring_wiki_guide_1920px.jpg?v=1647593867305',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/ainsel_river_location_map_elden_ring_wiki_guide_1920px.jpg?v=1647625959534',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/lake_of_rot_location_map_elden_ring_wiki_guide_1920px.jpg?v=1647626169089',
    'https://eldenring.wiki.fextralife.com/file/Elden-Ring/deeproot_depths_location_map_elden_ring_wiki_guide_2560px.jpg?v=1647626370795'
  ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFF736AB7),
  appBar: AppBar(
    backgroundColor: Color(0xFF736AB7),
  title: const Text("Mapas"),
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
  for (String item in images)
  InkWell(
  child: Container(
  padding: EdgeInsets.all(images.length.toDouble()),
  decoration: BoxDecoration(
  image: DecorationImage(
  fit: BoxFit.fill, image: NetworkImage(item) ),
  )),
  onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (_) {
  return DetailScreen(item);
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

  class DetailScreen extends StatefulWidget {
  late String image;

  DetailScreen(this.image);

  @override
  DetailScreenState createState() => DetailScreenState();
  }

  class DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: GestureDetector(
  child: Center(

  child: Container(
  child: PhotoView( imageProvider: NetworkImage(widget.image,scale: 1,),))),
  onTap: () {
  Navigator.pop(context);
  },
  ),
  );
  }
  }


