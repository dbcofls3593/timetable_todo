import 'package:flutter/material.dart';
import 'package:timetable_todo/Dialog/lectureCreateDialog.dart';
import 'package:timetable_todo/timetablePage.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';
import 'package:timetable_todo/timetableSource/myLecture.dart';

AlertDialog lectureDialog(BuildContext context){
  final List<Detail> lectures = <Detail>[];
  return AlertDialog(
    insetPadding: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
    title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.amber
                ),
                height: 29,
                width: 7,
              ),
              Padding(
                padding: EdgeInsets.only(left: 7),
                child: Text('과목명', style: TextStyle(fontWeight : FontWeight.bold, fontSize: 20)),
                //child: Text('${lectures(subjects)}', style: TextStyle(fontWeight : FontWeight.bold, fontSize: 20)),
              ),
            ],
          ),

          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.create, color: Colors.black45, size: 24),
                  onPressed: (){
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => CreateDialog()
                    );
                  }),

              IconButton(
                  icon: Icon(Icons.delete, color: Colors.black45, size: 24),
                  onPressed: ()=> showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
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
                    )
                  )),
            ],
          ),
        ]
    ),
    content:
    Container(
      width: 700,
      //height: 800,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text('안용학', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45,fontSize: 13), ),
                  ],
                ),
                Row(
                  children: [
                    Text('수 9:30 - 12:30', style: TextStyle(color: Colors.black45,fontSize: 13)),
                  ],
                ),
                Row(
                  children: [
                    Text('아) 2공 509', style: TextStyle(color: Colors.black45,fontSize: 13)),
                  ],
                ),
              ],
            ),
            SizedBox(
                height: 10
            ),
            Container(
              height: 300,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TO-DO', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                      IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: (){}),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.circle_outlined,size: 17),
                              onPressed: (){}
                          ),
                          Container(width: 11),
                          Text("UI/UX Programming Project", style: TextStyle(fontSize: 13))
                        ],
                      ),
                      Divider(
                        height: 30,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle_outlined,size: 17,),
                          Container(width: 11,),
                          Text("SW PPT", style: TextStyle(fontSize: 13))
                        ],
                      ),
                      Divider(
                        height: 30,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle_outlined,size: 17,),
                          Container(width: 11,),
                          Text("SW PPT", style: TextStyle(fontSize: 13))
                        ],
                      ),
                      Divider(
                        height: 30,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
