import 'package:flutter/material.dart';

AlertDialog TodoDeleteDialog(BuildContext context){
  return AlertDialog(
    insetPadding: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
    title: Text('TO-DO 삭제', style: TextStyle(fontWeight : FontWeight.bold)),
    content: Container(
      width: 700,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text( "항목을 삭제하시겠습니까?"),
        ],
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('취소', style: TextStyle(color: Colors.black, fontWeight : FontWeight.bold)),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('확인', style: TextStyle(color: Colors.indigo, fontWeight : FontWeight.bold)),
      ),
    ],
  );
}
