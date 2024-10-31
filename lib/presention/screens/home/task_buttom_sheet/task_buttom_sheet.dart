
import 'package:flutter/material.dart';
import 'package:to_do_project_session_11/core/utils/app_styel.dart';
import 'package:to_do_project_session_11/core/utils/date_utils.dart';

class TaskBottomSheet extends StatefulWidget {
  TaskBottomSheet({super.key});
  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();

  static  Widget  show()=>TaskBottomSheet();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
 DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('AddNewTask',textAlign: TextAlign.center,style: AppLightStyles.bottomSheetTitle,),
          SizedBox(height: 8,),
          TextFormField(
            decoration: InputDecoration(
              hintText: ' Enter  Your Task Title',
              hintStyle: AppLightStyles.hintStyle,
            ),
          ),
          SizedBox(height: 12,),
          TextFormField(
            decoration: InputDecoration(
              hintText: ' Enter  Your Task Description',
              hintStyle: AppLightStyles.hintStyle,
            ),
          ),
          SizedBox(height: 12,),
          Text('Select date' ,style: AppLightStyles.dateLabel),
          SizedBox(height: 8,),
          InkWell(
            onTap: (){
              showTaskDatePicker();

            }
              ,
              //toDateFormatted(selectedDate)
              child: Text(selectedDate.toFormattedDate,textAlign: TextAlign.center, style: AppLightStyles.dateStyle,)),
          Spacer(),

          ElevatedButton(onPressed: (){}, child: Text('Add Task'))
        ],
      ),

    );
  }

  void showTaskDatePicker( )  async{
    selectedDate=await  showDatePicker(
      context: context,
      selectableDayPredicate: (date)=>date.day!=20,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    )?? selectedDate;
    setState(() {});
  }
}
