import 'package:flutter/material.dart';
import 'package:timetable_todo/timetablePage.dart';
import 'package:timetable_todo/todoPage.dart';
import 'package:timetable_todo/developerPage.dart';
import './timetableSource/Detail.dart';

List<Detail> lectures = <Detail>[Detail(Colors.yellow,'','','',0,0,'',[])];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView( // TabBar를 각각 Page 경로를 선언해줌.
        physics: NeverScrollableScrollPhysics(),
        children: <Widget> [timetablePage(),TodoList(),developerPage()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar( // TabBar 모양 설정
        indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        ),
        indicatorWeight: 30,
        tabs: <Tab>[ //TabBar의 icon 설정
          Tab(icon: Icon(Icons.dashboard,color: Color(0xff323232),),),
          Tab(icon: Icon(Icons.check_circle_outline,color: Color(0xff323232)),),
          Tab(icon: Icon(Icons.people_alt,color: Color(0xff323232)),),
        ], controller: controller,
      ),
    );
  }
  @override
  void initState() { //3개의 Tab으로 초기화
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }
  void dispose(){
    controller!.dispose();
    super.dispose();
  }
}
