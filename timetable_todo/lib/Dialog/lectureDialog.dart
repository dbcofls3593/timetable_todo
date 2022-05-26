import 'package:flutter/material.dart';

class LectureDialog extends StatefulWidget {
  @override
  _LectureDialogState createState() => _LectureDialogState();
}

class _LectureDialogState extends State<LectureDialog> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text("조회"),
                onPressed: (){
                  showDialog<String>(
                  context: context,
                  builder: (BuildContext context) =>
                    AlertDialog(
                      insetPadding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
                      title: Row(
                        children:[
                          Icon(Icons.access_alarms_outlined, color: Colors.amber, size: 30),
                          Text(' UI/UX프로그래밍', style: TextStyle(fontWeight : FontWeight.bold, fontSize: 27)),
                          Icon(Icons.add, color: Colors.black45, size: 20),
                          Icon(Icons.access_alarms_outlined, color: Colors.black45, size: 20),
                        ]
                      ),
                      content:
                        Container(
                            width: 700,
                            alignment: Alignment.centerLeft,
                              child: Container(
                                child: Column(
                                  children: [
                                    Text('안용학', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
                                    Text('수 9:30 - 12:30', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
                                    Text('아) 2공 509', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
                                    Text(" "),
                                    Text('TO-DO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                                  ],
                                ),
                              ),

                        ),
                    ),
              );
            })
          ],
        ),
      ),
    );
  }
}