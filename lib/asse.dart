import 'package:flutter/material.dart';

import 'main.dart';
import 'package:url_launcher/url_launcher.dart';


class asse extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        //  primaryColor: Color.fromRGBO(58, 66, 86, 1.0)
      ),
home:ass(title:'Quiz Time'),
    );
  }
}
class ass extends StatefulWidget{
  ass({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _assState createState() => _assState();
}
class _assState extends State<ass>with SingleTickerProviderStateMixin {

  _assState();



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
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>MyApp()));
              },
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

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.device_unknown),
          tooltip: "About Us",
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
      body:Center(
      child:Card(
        elevation: 1.0,
        margin: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
              bottomLeft:Radius.circular(8.0),
               bottomRight:Radius.circular(8.0)
            )
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset('assets/tenor.gif',
            fit:BoxFit.cover),
      ),

      )
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

