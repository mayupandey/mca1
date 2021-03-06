import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'asset.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'asse.dart';

import 'cn.dart';
import 'cg.dart';
import 'package:quick_actions/quick_actions.dart';


import 'package:firebase_messaging/firebase_messaging.dart';

import 'ws.dart';

final List<String> imgList = [
  'https://cdn.dribbble.com/users/2071898/screenshots/6586059/ezgif.com-resize.gif',

  'https://cdn.dribbble.com/users/2326066/screenshots/7446803/image.gif'
];

void main() {
 SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BCA 5',
      theme: ThemeData(
          brightness: Brightness.light,
         primaryColor: Color.fromRGBO(58, 66, 86, 1.0)



      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title:'BCA 5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {


  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {

    super.initState();
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");

      },

      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");

      },
    );
firebaseMessaging.getToken().then((token){});

  }



  @override
  Widget build(BuildContext context) {
    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(

        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              tooltip: "Home",
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bubble_chart, color: Colors.white),
              tooltip: "Quiz",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => asse()));
              },
            ),


          ],
        ),
      ),
    );
    final QuickActions quickActions =  QuickActions();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == 'action_decrement') {
        print('The user tapped on the "increment" action.');
      } else {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>asse()));

      }
    });
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor:
      Color.fromRGBO(58, 66, 86, 1.0),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.device_unknown,color:Colors.white,),

          tooltip:"About Us",
          onPressed: () {
            _settingModalBottomSheet(context);

          },
        )
      ],
      title:new Center(child:Text(widget.title,textAlign: TextAlign.center,)),

    );

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'action_decrement', localizedTitle: 'Read', icon:'book'),
      const ShortcutItem(
          type: 'action_increment', localizedTitle: 'Contact Us', icon: 'ic_launcher')
    ]);
     final bd= Scaffold(
       backgroundColor:
       Color.fromRGBO(58, 66, 86, 1.0) ,
         body: SingleChildScrollView(
           child: Column(

               children: <Widget>[

             CarouselSlider(
              pauseAutoPlayOnTouch:const Duration(seconds: 20) ,
               autoPlay: true,
               autoPlayInterval: const Duration(seconds: 20),
               height: 200.0,

               scrollDirection: Axis.horizontal,
               enlargeCenterPage: true,
             items: imgList.map((url) {
               return Builder(
                 builder: (BuildContext context) {
                   return Container(
                       width: MediaQuery.of(context).size.width,
                       margin: EdgeInsets.symmetric(horizontal: 5.0),
                       decoration: BoxDecoration(
                           boxShadow: <BoxShadow>[
                             BoxShadow(
                                 color: Colors.grey,
                                 offset: Offset(2.1, 1.1),
                                 blurRadius: 5.0),
                           ],
                           image: DecorationImage(
                             image: new AssetImage(
                                 'assets/nic.gif'),
                             fit: BoxFit.fill,
                           ),

                           color: Colors.white

                       ),
                       child: Image.network(
                         url,


                         fit: BoxFit.cover,
                         width: 1000.0,
                       ),
                   );
                 },
               );
             }).toList(),
           ),
                 SizedBox(height: 20),
                 Row(

                 children: <Widget>[
                   InkWell(
                     onTap:(){
                       showDialog(
                           context: context,builder: (_) => AssetGiffyDialog(
                         image:Image.asset('assets/spec.gif',

                         fit:BoxFit.cover),
                         title: Text('Specilization',
                           style: TextStyle(
                               fontSize: 22.0, fontWeight: FontWeight.w600),
                         ),
                         description: Text('Choose specilization down below',
                           textAlign: TextAlign.center,
                           style: TextStyle(),
                         ),
                       ) );

                     },
                   child:Padding(
                     padding: EdgeInsets.only(left: 50.0,top: 5.0),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20.0),

                       child: Image.asset("assets/spec.png",
                         height: 60,
                       ),
                     ),
                   ),
                   ),
                 ],
               ),
                 Row(
                   children: <Widget>[
                     InkWell(
                       onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => cg()));},
                       child:Padding(
                         padding: EdgeInsets.only(left: 50.0,top: 25.0),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(20.0),

                           child: Image.asset("assets/cg.png",
                               height: 60

                           ),
                         ),
                       ),
                     ),


                   ],
                 ),
                 Row(
                   children: <Widget>[
                     InkWell(
                       onTap:(){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => cn()));
                       }

                       ,
                       child:Padding(

                         padding: EdgeInsets.only(left: 50.0,top: 25.0),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(20.0),

                           child: Image.asset("assets/net.png",
                               height: 60
                               ),
                         ),
                       ),
                     ),


                   ],
                 ),
                 Row(
                   children: <Widget>[
                     InkWell(
                       onTap:(){

                         Navigator.push(context, MaterialPageRoute(builder: (context) => ws()));
                       }

                       ,
                       child:Padding(

                         padding: EdgeInsets.only(left: 50.0,top: 25.0),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(20.0),

                           child: Image.asset("assets/ws.png",
                               height: 60

                           ),
                         ),
                       ),
                     ),


                   ],
                 ),
                ],
           ),
         ),
     );

    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      bottomNavigationBar: makeBottom,
      body: bd,
    );

  }
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            color: Colors.white,
            child:SafeArea(
            child: new Wrap(
              children: <Widget>[
                new Center(
                  child:RaisedButton(
                    color:Colors.blueAccent,
                    child: Text('Privacy Policy'),
                    onPressed: _launchURL,
                  ),
                ),
                FlatButton(
                  onPressed:_mack,

                  child: Image.asset("assets/man1.png",
                    height: 100,
                    width: 100,
                  ),
                ),
                FlatButton(

                  onPressed:_srk,
                  child: Image.asset("assets/man2.png",
                    height: 100,
                    width: 100,),
                ),
                FlatButton(
                  onPressed: _sachin,
                  child:Image.asset("assets/man3.png",
                    height: 100,
                    width: 100,),
                ),

              ],
            ),
            )
          );
        }
    );
  }
  _launchURL() async {
    const url = 'https://github.com/mayupandey';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Please connect to the internet';
    }
  }
  _sachin() async {
    const url = 'https://www.instagram.com/sachin_ss_sharma/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Please connect to the internet';
    }
  }
  _mack() async {
    const url = 'https://www.instagram.com/geek_programmer/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Please connect to the internet';
    }
  }
  _srk() async {
    const url = 'https://www.instagram.com/srk_name_izz_enough/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Please connect to the internet';
    }
  }

  }
class Notification {
  final String title;
  final String body;
  final Color color;
  const Notification(
      {@required this.title, @required this.body, @required this.color});
}
