import 'asset.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'asse.dart';
import 'cont.dart';
import 'cn.dart';
import 'firebase_notification_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BCA 5',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0)
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


  @override
  void initState() {

    super.initState();
    new FirebaseNotifications().setUpFirebase();
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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bubble_chart, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => asse()));
              },
            ),

            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => cont()));},
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.device_unknown),
          onPressed: () {
            _settingModalBottomSheet(context);

          },
        )
      ],
      title:new Center(child:Text(widget.title,textAlign: TextAlign.center,)),

    );
     final bd= Scaffold(
       backgroundColor:Color.fromRGBO(58, 66, 86, 1.0) ,
         body: SingleChildScrollView(
           child: Column(
               children: <Widget>[

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
                       ),
                     ),
                   ),
                   ),
                 ],
               ),
                 Row(
                   children: <Widget>[
                     InkWell(
                       onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => cn()));},
                       child:Padding(
                         padding: EdgeInsets.only(left: 50.0,top: 25.0),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(20.0),

                           child: Image.asset("assets/cg.png",
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
                         Navigator.push(context, MaterialPageRoute(builder: (context) => cont()));
                       }

                       ,
                       child:Padding(

                         padding: EdgeInsets.only(left: 50.0,top: 25.0),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(20.0),

                           child: Image.asset("assets/spec.png",
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
                    width: 100,),
                ),
                FlatButton(
                  onPressed:_mack,
                  child: Image.asset("assets/man2.png",
                    height: 100,
                    width: 100,),
                ),
                FlatButton(
                  onPressed: _mack,
                  child:Image.asset("assets/man3.png",
                    height: 103,
                    width: 103,),
                ),

              ],
            ),
            )
          );
        }
    );
  }
  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Please connect to the internet';
    }
  }
  _mack() async {
    const url = 'https://github.com/mayupandey';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Please connect to the internet';
    }
  }

  }
