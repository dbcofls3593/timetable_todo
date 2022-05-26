import 'package:flutter/material.dart';

class DeleteDialog extends StatefulWidget {
  @override
  _DeleteDialogState createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text("수업 삭제"),
                onPressed: (){
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
                          title: Text('수업 삭제', style: TextStyle(fontWeight : FontWeight.bold)),
                          content: Container(
                            width: 700,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text( "수업을 삭제하시겠습니까?"),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  setState(() {});
                                  Navigator.of(context).pop();
                                },
                                child: Text('취소', style: TextStyle(color: Colors.black, fontWeight : FontWeight.bold))
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {});
                                  Navigator.of(context).pop();
                                },
                                child: Text('확인', style: TextStyle(color: Colors.indigo, fontWeight : FontWeight.bold))
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