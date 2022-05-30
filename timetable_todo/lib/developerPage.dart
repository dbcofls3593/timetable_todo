import 'package:flutter/material.dart';



class developerPage extends StatefulWidget{
  const developerPage({Key? key}) : super(key: key);

  State<StatefulWidget> createState(){
    return _developerPage();
  }
}

class _developerPage extends State<developerPage>{



  Widget build(BuildContext context){
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final height =size.height;

    return Scaffold(
      /*appBar: AppBar(title: Text('개발자 김유정 고2',style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xffF5F4F2),
      ),*/
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: width* 1,
                  height: height* 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xffECECEC),
                  ),
                  child: Row(
                      children:<Widget>[
                        Container(
                            width:135,
                            child: Image.asset('image/다은 미모티콘.png')
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('김 다 은 Kim Da Eun' ,style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(1),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,fontSize: 23.0)),
                              Text('\n컴퓨터공학부 20191101',style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,color: Color(0xff5C5C5C),fontSize: 13.0)),
                              Text('Email : 20191101@vision.hoseo.edu' ,style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,color: Color(0xff5C5C5C),fontSize: 13.0)),
                            ],
                          ),
                        )
                      ]
                  )
              ),
              Container(
                  width: width* 1,
                  height: height* 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xffECECEC),
                  ),
                  child: Row(
                      children:<Widget>[
                        Container(
                            width:135,
                            child: Image.asset('image/채린 미모티콘.png')
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('유 채 린 Yu Chae Rin' ,style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(1),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,fontSize: 23.0)),
                              Text('\n컴퓨터공학부 20191191',style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,color: Color(0xff5C5C5C),fontSize: 13.0)),
                              Text('Email : 20191191@vision.hoseo.edu' ,style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,color: Color(0xff5C5C5C),fontSize: 13.0)),
                            ],
                          ),
                        )
                      ]
                  )
              ),
              Container(
                  width: width* 1,
                  height: height* 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xffECECEC),
                  ),
                  child: Row(
                      children:<Widget>[
                        Container(
                            width:135,
                            child: Image.asset('image/민성 미모티콘.png')
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('정 민 성 Jung Min Sung' ,style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(1),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,fontSize: 22.5)),
                              Text('\n컴퓨터공학부 20191251',style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,color: Color(0xff5C5C5C),fontSize: 13.0)),
                              Text('Email : 20191251@vision.hoseo.edu' ,style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,color: Color(0xff5C5C5C),fontSize: 13.0)),
                            ],
                          ),
                        )
                      ]
                  )
              ),
              Container(
                  width: width* 1,
                  height: height* 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xffECECEC),
                  ),
                  child: Row(
                      children:<Widget>[
                        Container(
                            width:135,
                            child: Image.asset('image/유경 미모티콘.png')
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('고 유 경 Go Yu Gyeong' ,style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(1),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,fontSize: 22.5)),
                              Text('\n컴퓨터공학부 20191088',style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,color: Color(0xff5C5C5C),fontSize: 13.0)),
                              Text('Email : 20191088@vision.hoseo.edu' ,style: TextStyle(
                                  shadows:[
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  fontFamily:'Quantico',fontWeight:FontWeight.bold,color: Color(0xff5C5C5C),fontSize: 13.0)),
                            ],
                          ),
                        )
                      ]
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}