import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/painting/text_style.dart';

class MyAlertDialog extends StatefulWidget {
  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text("수업 추가")
                ,onPressed: (){
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    AlertDialog(
                      insetPadding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
                      //titlePadding: EdgeInsets.only(top: 40),
                      title: Text('\n수업 추가', style: TextStyle(fontWeight : FontWeight.bold)),
                      content:
                      Container(
                        width: 500,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(decoration: InputDecoration(labelText: '수업명'), style: TextStyle(fontWeight : FontWeight.bold), keyboardType: TextInputType.text),
                                TextField(decoration: InputDecoration(labelText: '교수명'), style: TextStyle(fontWeight : FontWeight.bold), keyboardType: TextInputType.text),
                                TextField(decoration: InputDecoration(labelText: '시간'), style: TextStyle(fontWeight : FontWeight.bold), keyboardType: TextInputType.text),
                                TextField(decoration: InputDecoration(labelText: '장소'), style: TextStyle(fontWeight : FontWeight.bold), keyboardType: TextInputType.text),
                                TextField(decoration: InputDecoration(labelText: '색상'), style: TextStyle(fontWeight : FontWeight.bold), keyboardType: TextInputType.text)
                              ],
                            )
                        ),
                      ),

                      actions: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: Text('확인', style: TextStyle(color: Colors.indigo, fontWeight : FontWeight.bold)),
                        ),
                      ],
                    ),
              );
            })
          ],
        ),
      ),
    );
  }
}