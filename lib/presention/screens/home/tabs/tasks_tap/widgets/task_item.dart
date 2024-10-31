

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_project_session_11/core/utils/app_styel.dart';
import 'package:to_do_project_session_11/core/utils/colors_manager.dart';
import 'package:to_do_project_session_11/core/utils/date_utils.dart';
import 'package:to_do_project_session_11/presention/screens/home/task_buttom_sheet/task_buttom_sheet.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.onPrimary,
      ),

      child: Slidable(

      child: Slidable(
        // end ActionPane is as the start Action but is in the end
        startActionPane: ActionPane(motion: DrawerMotion(),
             children:[

               SlidableAction(
                 onPressed: (context){},
                 backgroundColor: Colors.red,
                 foregroundColor: Colors.white,
                 icon: Icons.delete,
                 label: 'Delete',
                 autoClose: true,
                 borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(15),
                   topLeft: Radius.circular(15)
                 ),
               ),
               SlidableAction(
                 onPressed: (context){},
                 backgroundColor: Colors.blue,
                 foregroundColor: Colors.white,
                 icon: Icons.edit,
                 label: 'Edit',
                 autoClose: true,

               ),
            ] ),
        child: Container(
            // margin:EdgeInsets.all(10),
             padding:EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.onPrimary,
          ),

          child:Row(
            children:[
              Container(
                height: 62,
                width:4,
                decoration: BoxDecoration(
                  color:Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(width: 7,),
              Column(
                mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(' TaskTitle',style: AppLightStyles.taskTitle),
                      SizedBox(height:4),
                      Text('TaskDescription',style: AppLightStyles.taskDesc),
                      SizedBox(height:6),
                      Text(DateTime.now().toFormattedDate,style: AppLightStyles.taskDate,)
                    ],),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                decoration: BoxDecoration(
                 color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20)

                ),
                child: Icon(Icons.check,color:ColorsManager.white,size: 30,),
              )




            ]
          )
        ),
      ),
    ));
  }
}
