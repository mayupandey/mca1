import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'dart:math';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'quiz.dart';

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
  Quiz quiz;
  List<Results> results;
  Color c;
  Random random = Random();
  _assState();

  Future<void> fetchQuestions() async {
    var res = await http.get("https://opentdb.com/api.php?amount=10&category=18");
    var decRes = jsonDecode(res.body);
    print(decRes);
    c = Colors.black;
    quiz = Quiz.fromJson(decRes);
    results = quiz.results;
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
      body:RefreshIndicator(
        onRefresh: fetchQuestions,
        child: FutureBuilder(
            future: fetchQuestions(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return errorData(snapshot);
                  return questionList();
              }
              return null;
            }),
      ),
    );
  }
  Padding errorData(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: ${snapshot.error}',
          ),
          SizedBox(
            height: 20.0,
          ),

          Card(

            child: Image.asset("assets/wifi.gif",
              fit: BoxFit.cover,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),

            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),



          RaisedButton(

            child: Text("Try Again"),
            onPressed: () {
              fetchQuestions();
              setState(() {});
            },
          )
        ],
      ),
    );
  }
  ListView questionList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        elevation: 0.0,
        child: ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  results[index].question,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FilterChip(
                        backgroundColor: Colors.grey[100],
                        label: Text(results[index].category),
                        onSelected: (b) {},
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FilterChip(
                        backgroundColor: Colors.grey[100],
                        label: Text(
                          results[index].difficulty,
                        ),
                        onSelected: (b) {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Text(results[index].type.startsWith("m") ? "M" : "B"),
          ),
          children: results[index].allAnswers.map((m) {
            return AnswerWidget(results, index, m);
          }).toList(),
        ),
      ),
    );
  }
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


class AnswerWidget extends StatefulWidget {
  final List<Results> results;
  final int index;
  final String m;

  AnswerWidget(this.results, this.index, this.m);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  Color c = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.m == widget.results[widget.index].correctAnswer) {
            c = Colors.green;
          } else {
            c = Colors.red;
          }
        });
      },
      title: Text(
        widget.m,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: c,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
