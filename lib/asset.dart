import 'package:flutter/material.dart';
import 'dm.dart';
import 'ws.dart';
import 'anim.dart';
class AssetGiffyDialog extends StatelessWidget {
  final Image image;
  final Text title;
  final Text description;
  final bool onlyOkButton;
  final Text buttonOkText;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Color buttonCancelColor;
  final double buttonRadius;
  final double cornerRadius;
  final VoidCallback onOkButtonPressed;

  AssetGiffyDialog({
    Key key,
    @required this.image,
    @required this.title,
    @required this.onOkButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.buttonOkColor,
    this.buttonCancelColor,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
  })  : assert(image != null),
        assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: (MediaQuery.of(context).size.height / 2) * 0.6,
                  child: Card(
                    elevation: 0.0,
                    margin: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(cornerRadius),
                            topLeft: Radius.circular(cornerRadius))),
                    clipBehavior: Clip.antiAlias,
                    child: image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: title,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Column(
                    children:<Widget>[
                      RaisedButton(
                        color: buttonCancelColor ?? Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(buttonRadius)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => dm()));
                          },
                        child: buttonCancelText ??
                            Text(
                              'Digital Marketing',
                              style: TextStyle(color: Colors.white),
                            ),
                      ),
                      RaisedButton(
                        color: buttonCancelColor ?? Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(buttonRadius)),
                        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ws()));},
                        child: buttonCancelText ??
                            Text(
                              'Web Devlopment',
                              style: TextStyle(color: Colors.black),
                            ),


                      ),
                  RaisedButton(
                    color: buttonCancelColor ?? Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(buttonRadius)),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => anim()));},
                    child: buttonCancelText ??
                        Text(
                          '  Animation   ',
                          style: TextStyle(color: Colors.white),),
                  ),
                    ],
                ),

            ),

          ],
        ),
    ],
    ),
      ),
    );
  }
}
