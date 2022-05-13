import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  final image = [
    'assets/images/caelid.jpg',
    'assets/images/Consecrated_Snowfield.jpg',
    'assets/images/crumbling_farum_azula.jpg',
    'assets/images/deeprot_depths.jpg',
    'assets/images/lake_of_rot.jpg',
    'assets/images/limgrave.jpg',
    'assets/images/liurnia.jpg',
    'assets/images/monta_dos_gigante.jpg',
    'assets/images/plato_altus.jpg',
    'assets/images/rio_siofa.jpg',
    'assets/images/rio_ansiel.jpg',
    'assets/images/weeping_peninsula.jpg'
  ];
   late YoutubePlayerController controller;


  void _proximaRota() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondRota()),
      );
    });
  }
  @override
  void initState() {
    super.initState();

    String url = "https://www.youtube.com/watch?v=AKXiKBnzpBQ&ab_channel=GameSpot";
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
      ),
    );


  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: Text(widget.title),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/elden_ring.jpg'),
            const Text(
              '\nO Maculado em breve voltará',
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
                  leadingDistribution: TextLeadingDistribution.even),
            ),
            Container(
              child:YoutubePlayer(
              controller: controller,
              liveUIColor: Colors.amber,
            ) ,)

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _proximaRota,
        tooltip: 'Maps',
        child: const Icon(Icons.map_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondRota extends StatelessWidget {
  const SecondRota({Key? key}) : super(key: key);

  static var images = [
    'assets/images/caelid.jpg',
    'assets/images/Consecrated_Snowfield.jpg',
    'assets/images/crumbling_farum_azula.jpg',
    'assets/images/deeprot_depths.jpg',
    'assets/images/lake_of_rot.jpg',
    'assets/images/limgrave.jpg',
    'assets/images/liurnia.jpg',
    'assets/images/monta_dos_gigante.jpg',
    'assets/images/plato_altus.jpg',
    'assets/images/rio_siofa.jpg',
    'assets/images/rio_ansiel.jpg',
    'assets/images/weeping_peninsula.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                                fit: BoxFit.fill, image: AssetImage(item)),
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
            child: Hero(tag: "caelid", child: Image.asset(widget.image,scale: 0.5,))),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}


