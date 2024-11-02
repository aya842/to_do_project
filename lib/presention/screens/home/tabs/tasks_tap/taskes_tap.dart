
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_project_session_11/core/utils/colors_manager.dart';
import 'package:to_do_project_session_11/presention/screens/home/tabs/tasks_tap/widgets/task_item.dart';

class TasksTap extends StatelessWidget {
  const TasksTap({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          buildCalanderTimeLine(),
          const SizedBox(height: 8),

          TaskItem(),
        ],
      ),
    );
  }
  buildCalanderTimeLine()=>EasyDateTimeLine(
    initialDate: DateTime.now(),
    onDateChange: (selectedDate) {
      // it important to bring tasks from database to user
      //`selectedDate` the new date selected.
    },
    headerProps: const EasyHeaderProps(
      showSelectedDate: false,
      showMonthPicker: false,
      showHeader: true,
      monthPickerType: MonthPickerType.dropDown, // to formateed the month
      dateFormatter: DateFormatter.fullDateDMY(),
    ),
    dayProps:  EasyDayProps(

      dayStructure: DayStructure.dayStrDayNum,
      activeDayStyle: DayStyle(
        dayNumStyle: TextStyle(color: ColorsManager.blue,fontSize: 15,fontWeight: FontWeight.w700),
        dayStrStyle: TextStyle(color: ColorsManager.blue,fontSize: 15,fontWeight: FontWeight.w700),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color(0xff3371FF),
          //     Color(0xff8426D6),
          //   ],
          // ),
          color: Colors.white
        ),
      ),
      inactiveDayStyle: DayStyle(
        dayNumStyle: TextStyle(color: ColorsManager.black,fontSize: 15,fontWeight: FontWeight.w700),
        dayStrStyle: TextStyle(color: ColorsManager.black,fontSize: 15,fontWeight: FontWeight.w700),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
             //gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Color(0xff3371FF),
            //     Color(0xff8426D6),
            //   ],
            // ),
            color: Colors.white
        ),
      ),
    )
  );
}
