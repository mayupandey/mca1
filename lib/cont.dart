import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'asse.dart';
import 'main.dart';


class cont extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Us',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0)
      ),
  home:MyHome(title:'Contact Us'),
    );
  }


}
class MyHome extends StatefulWidget{
  MyHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomeState createState() => _MyHomeState();
  }
class _MyHomeState extends State<MyHome> {


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
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>MyApp()));
              },
            ),
            IconButton(
              icon: Icon(Icons.bubble_chart, color: Colors.white),
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => asse()));
              },
            ),

            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cont()));
              },
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
      title: new Center(
          child: Text(widget.title, textAlign: TextAlign.center,)),

    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      bottomNavigationBar: makeBottom,

    );
  }
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            color: Colors.white,
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
    const url = 'https://github.com/dvmjoshi';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Please connect to the internet';
    }
  }
}
