import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_project_session_11/core/utils/app_styel.dart';
import 'package:to_do_project_session_11/core/utils/colors_manager.dart';
import 'package:to_do_project_session_11/core/utils/date_utils.dart';
import 'package:to_do_project_session_11/databaseManger/module/todo_dm.dart';
import 'package:to_do_project_session_11/databaseManger/module/user_data_model.dart';
import 'package:to_do_project_session_11/presention/screens/home/tabs/tasks_tap/widgets/task_item.dart';

class TasksTap extends StatefulWidget {

  TasksTap({super.key});

  @override
  State<TasksTap> createState() => TasksTapState();
}

class TasksTapState extends State<TasksTap> {
  DateTime CalanderSelectedDate = DateTime.now();
  List<TODoDM>todosList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTODosFromFireStore();
  }

  @override
  Widget build(BuildContext context) {

    return
      Column(
        children: [
          Stack(
            children: [
              Container(
                height: 100.h,
                color: ColorsManager.blue,
              ),
              buildCalanderTimeLine(),

            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskItem(
                  todo: todosList[index],
                  onDeletedTask: () {
                    getTODosFromFireStore();
                  },
                );
              },
              itemCount: todosList.length,
            ),
          )


        ],
      );

  }

    buildCalanderTimeLine() =>
        EasyInfiniteDateTimeLine(
            firstDate: DateTime.now().subtract(const Duration(days: 356)),
            focusDate: CalanderSelectedDate,
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateChange: (selectedDate) {},
            itemBuilder: (context, date, isSelected, onTap) {
              return InkWell(
                onTap: (){
                  CalanderSelectedDate=date;
                  getTODosFromFireStore();

                },
                child: Card(
                  color: ColorsManager.white,
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${date.day}',
                        style: isSelected
                            ? AppLightStyles.CalnderSelectedItem
                            : AppLightStyles.CalnderUnSelectedItem,
                      ),
                      Text(date.getDayName,
                          style: isSelected
                              ? AppLightStyles.CalnderSelectedItem
                              : AppLightStyles.CalnderUnSelectedItem)
                    ],
                  ),
                ),
              );
            });

  getTODosFromFireStore() async {
    var db=FirebaseFirestore.instance;
    CollectionReference  ToDocollection= db.collection(UserDM.collectionName)
        .doc(UserDM.currentuser!.id).collection(TODoDM.collectionName);
      QuerySnapshot collectionSnapShot = await ToDocollection .get();
      //     .where('dateTime',
      //   isEqualTo: CalanderSelectedDate.copyWith(
      //     second: 0,
      //     millisecond: 0,
      //     hour: 0,
      //     microsecond: 0,
      //     minute: 0,
      //
      //   )
      //
      // )
    List<QueryDocumentSnapshot>documentSnapShot=collectionSnapShot.docs;
    // get all todo
     todosList= documentSnapShot.map((docsSnapShot) {
        Map<String,dynamic> json=docsSnapShot.data() as Map<String,dynamic>;
        TODoDM todo=  TODoDM.fromFireStore(json);
        return todo;
      } ).toList();
     //fliter todo
     todosList = todosList. where((todo)=> todo.datetime.day == CalanderSelectedDate.day&&
      todo.datetime.month==CalanderSelectedDate.month&&
     todo.datetime.year==CalanderSelectedDate.year).toList();
     setState(() {
      // Update the state
      });

    }

  }



