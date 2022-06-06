import 'package:flutter/material.dart';
import 'package:timetable_todo/timetablePage.dart';
import 'package:timetable_todo/todoItem.dart';
import 'package:timetable_todo/todoPage.dart';
import 'package:timetable_todo/developerPage.dart';
import 'package:timetable_todo/Dialog/todoDeleteDialog.dart';
import 'package:timetable_todo/Dialog/lectureCreateDialog.dart';
import 'package:timetable_todo/Dialog/lectureDeleteDialog.dart';
import 'package:timetable_todo/Dialog/lectureDialog.dart';
import './timetableSource/Detail.dart';

List<Detail> lectures = <Detail>[Detail(Colors.yellow,'','','',0,1,'',[Todo(name: 'name', checked: false),Todo(name: 'name1', checked: false)])];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TTD',
      theme: ThemeData(
        //final ThemeData base = ThemeData.light();
        //return base.copyWith(
        primaryColor: Colors.green,
        //scaffoldBackgroundColor: Colors.red,
        cardColor: Colors.redAccent,
        //),
      ),
      home: MyHomePage(title: ""),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController? controller;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget> [timetablePage(),TodoList(),developerPage()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        ),
        indicatorColor: Colors.redAccent,
        indicatorWeight: 30,
        tabs: <Tab>[
          Tab(icon: Icon(Icons.dashboard,color: Color(0xff323232),),),
          Tab(icon: Icon(Icons.check_circle_outline,color: Color(0xff323232)),),
          Tab(icon: Icon(Icons.people_alt,color: Color(0xff323232)),),
        ], controller: controller,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }
  void dispose(){
    controller!.dispose();
    super.dispose();
  }
}
