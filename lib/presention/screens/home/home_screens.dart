import 'package:flutter/material.dart';

import 'package:to_do_project_session_11/core/utils/colors_manager.dart';
import 'package:to_do_project_session_11/presention/screens/home/tabs/setting_tap/setting_tap.dart';
import 'package:to_do_project_session_11/presention/screens/home/tabs/tasks_tap/taskes_tap.dart';
import 'package:to_do_project_session_11/presention/screens/home/task_buttom_sheet/task_buttom_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int currentIndex=0;
List<Widget>tabs=[
  TasksTap(),
  SettingsTap(),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar
         (

        title: Text('ToDo List'),
      ),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(),
      body: tabs[currentIndex],
    );
  }

  Widget buildBottomNavBar() => BottomAppBar(
   // notchMargin: 30,

    child: BottomNavigationBar(

 currentIndex: currentIndex,
         onTap: OnTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',

        ),

      ],
    ),
  );
  Widget buildFab()=>FloatingActionButton(
     onPressed: (){
       showTaskButtomSheet();
     },
    child:Icon (Icons.add,color: ColorsManager.white, ),);
 
 
 
  void OnTapped( int index){
    currentIndex=index  ;
    setState(() {});
  }

  void showTaskButtomSheet() {
    showModalBottomSheet(context: context,
        builder:(context)=>TaskBottomSheet.show());
  }
}
