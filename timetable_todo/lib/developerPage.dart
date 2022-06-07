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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10), //title에 해당하는 내용을 갖고 있음.
                Text('개발자 김유정 고2',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.3,
        ),
      ),
      body: Container( //개발자의 모든 정보를 담고 있는 Container
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container( //개발자의 정보를 담은 Container
                  width: width* 1,
                  height: height* 0.17,
                  decoration: BoxDecoration(
                    color: Color(0xffECECEC),
                  ),
                  child: Row(
                      children:<Widget>[
                        Container( //대표 이미지를 담은 Container
                            width:135,
                            child: Image.asset('image/다은 미모티콘.png')
                        ),
                        Container( //이름, 학번, e-mail 관련 정보를 담은 Container
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
              Container( //개발자의 모든 정보를 담고 있는 Container
                  width: width* 1,
                  height: height* 0.17,
                  decoration: BoxDecoration(
                    color: Color(0xffECECEC),
                  ),
                  child: Row(
                      children:<Widget>[
                        Container( //대표 이미지를 담은 Container
                            width:135,
                            child: Image.asset('image/채린 미모티콘.png')
                        ),
                        Container( //이름, 학번, e-mail 관련 정보를 담은 Container
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
              Container( //개발자의 모든 정보를 담고 있는 Container
                  width: width* 1,
                  height: height* 0.17,
                  decoration: BoxDecoration(
                    color: Color(0xffECECEC),
                  ),
                  child: Row(
                      children:<Widget>[
                        Container( //대표 이미지를 담은 Container
                            width:135,
                            child: Image.asset('image/민성 미모티콘.png')
                        ),
                        Container( //이름, 학번, e-mail 관련 정보를 담은 Container
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
              Container(//개발자의 모든 정보를 담고 있는 Container
                  width: width* 1,
                  height: height* 0.17,
                  decoration: BoxDecoration(
                    color: Color(0xffECECEC),
                  ),
                  child: Row(
                      children:<Widget>[
                        Container( //대표 이미지를 담은 Container
                            width:135,
                            child: Image.asset('image/유경 미모티콘.png')
                        ),
                        Container( //이름, 학번, e-mail 관련 정보를 담은 Container
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