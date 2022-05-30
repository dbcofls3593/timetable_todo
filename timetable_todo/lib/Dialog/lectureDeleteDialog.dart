import 'package:flutter/material.dart';

AlertDialog DeleteDialog(BuildContext context){
  return AlertDialog(
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
            Navigator.of(context).pop();
          },
          child: Text('취소', style: TextStyle(color: Colors.black, fontWeight : FontWeight.bold))
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('확인', style: TextStyle(color: Colors.indigo, fontWeight : FontWeight.bold))
      ),
    ],
  );
}
