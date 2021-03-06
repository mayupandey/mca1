import 'package:flutter/material.dart';

import 'asse.dart';
import 'main.dart';
import 'dart:io';
import 'dart:async';
import 'cn.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';



class dm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Marketing',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0)
      ),
      home:cge(title:'Digital Marketing'),
    );
  }
}
class cge extends StatefulWidget{
  cge({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _cgeState createState() => _cgeState();
}
class _cgeState extends State<cge> {
  String pathPDF = "";
  String pathPDF2 = "";
  String pathPDF3= "";
  @override
  void initState() {
    super.initState();
    fromAsset('assets/pdf/dmunit1.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    }
    );
    fromAsset2('assets/pdf/dmunit2.pdf').then((f) {
      setState(() {
        pathPDF2 = f.path;
        print(pathPDF2);
      });
    }
    );
    fromAsset3('assets/pdf/googlealgo.pdf').then((f) {
      setState(() {
        pathPDF3 = f.path;
        print(pathPDF3);
      });
    }
    );

    // createFileOfPdfUrl().then((f) {

  }

  Future<File> fromAsset(String asset) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/dmunit1.pdf");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
  Future<File> fromAsset2(String asset) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/dmunit2.pdf");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
  Future<File> fromAsset3(String asset) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/googlealgo.pdf");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
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
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            IconButton(
              icon: Icon(Icons.bubble_chart, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => asse()));
              },
            ),


          ],
        ),
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),

      title: new Center(
          child: Text(widget.title, textAlign: TextAlign.center,)),

    );
    final n=Container(
      child:Column(
        children:<Widget>[
          Slidable(

            delegate: new SlidableDrawerDelegate(),
            actionExtentRatio: 0.25,

            child: new Container(
              color: Colors.white,
              child: new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: new Text('1'),
                  foregroundColor: Colors.white,),
                title: new Text('Intro of Digital Marketing'),
                subtitle: new Text('Swipe to read'),
              ),
            ),

            secondaryActions: <Widget>[
              new IconSlideAction(
                caption: 'Read',
                color: Colors.black45,
                icon: Icons.book,
                onTap:(){  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PDFScreen(path:pathPDF,)));
                },

              ),


            ],

          ),
          Column(
            children: <Widget>[
              Slidable(

                delegate: new SlidableDrawerDelegate(),
                actionExtentRatio: 0.25,

                child: new Container(
                  color: Colors.white,
                  child: new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.indigoAccent,
                      child: new Text('2'),
                      foregroundColor: Colors.white,),
                    title: new Text('Content Creation'),
                    subtitle: new Text('Swipe to read'),
                  ),
                ),

                secondaryActions: <Widget>[
                  new IconSlideAction(
                    caption: 'Read',
                    color: Colors.black45,
                    icon: Icons.book,
                    onTap:(){  Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PDFScreen(path:pathPDF2,)));
                    },

                  ),

                ],

              ),
            ],
          ),
          Column(
            children: <Widget>[
              Slidable(

                delegate: new SlidableDrawerDelegate(),
                actionExtentRatio: 0.25,

                child: new Container(
                  color: Colors.white,
                  child: new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.indigoAccent,
                      child: new Text('3'),
                      foregroundColor: Colors.white,),
                    title: new Text('Ad word'),
                    subtitle: new Text('Swipe to see'),
                  ),
                ),

                secondaryActions: <Widget>[
                  new IconSlideAction(
                    caption: 'Read',
                    color: Colors.black45,
                    icon: Icons.book,
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PDFScreen(path:pathPDF3,)));

                    },

                  ),


                ],

              ),
            ],
          ),
          Column(
            children: <Widget>[
              Slidable(

                delegate: new SlidableDrawerDelegate(),
                actionExtentRatio: 0.25,

                child: new Container(
                  color: Colors.white,
                  child: new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.indigoAccent,
                      child: new Text('4'),
                      foregroundColor: Colors.white,),
                    title: new Text('Basic Hell'),
                    subtitle: new Text('SlidableDrawerDelegate'),
                  ),
                ),

                secondaryActions: <Widget>[
                  new IconSlideAction(
                    caption: 'Read',
                    color: Colors.black45,
                    icon: Icons.book,

                  ),
                  new IconSlideAction(
                    caption: 'Listen',
                    color: Colors.red,
                    icon: Icons.speaker,

                  ),

                ],

              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      bottomNavigationBar: makeBottom,
      body: n,

    );
  }
}
class PDFScreen extends StatefulWidget {
  final String path;

  PDFScreen({Key key, this.path}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  final Completer<PDFViewController> _controller =
  Completer<PDFViewController>();
  int pages = 0;
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Computer Network"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: true,
            pageFling: true,
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onPageChanged: (int page, int total) {
              print('page change: $page/$total');
            },
          ),
          !isReady
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Container()
        ],
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              label: Text("Go to ${pages ~/ 2}"),
              onPressed: () async {
                await snapshot.data.setPage(pages ~/ 2);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
