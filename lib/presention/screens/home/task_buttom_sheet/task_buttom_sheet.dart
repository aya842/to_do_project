
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_project_session_11/core/utils/app_styel.dart';
import 'package:to_do_project_session_11/core/utils/date_utils.dart';
import 'package:to_do_project_session_11/databaseManger/module/todo_dm.dart';
import 'package:to_do_project_session_11/databaseManger/module/user_data_model.dart';

class TaskBottomSheet extends StatefulWidget {
  TaskBottomSheet({super.key});
  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();

  static  Future  show( BuildContext context ) {
    return  showModalBottomSheet(context: context,
      isScrollControlled: true,
      builder:(context)=>
        Padding(padding: MediaQuery.of(context).viewInsets,
    child: TaskBottomSheet(),),);
  }
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
 DateTime selectedDate=DateTime.now();
 TextEditingController titleController= TextEditingController();
 TextEditingController descraptionController= TextEditingController();
 GlobalKey<FormState>formkey= GlobalKey();


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 360.h,
      padding: REdgeInsets.all(12),
      child: Form(//to check validation
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('AddNewTask',textAlign: TextAlign.center,style: AppLightStyles.bottomSheetTitle,),
            SizedBox(height: 8,),
            TextFormField(
              validator: (input){
                if (input==null || input.trim().isEmpty){
                  return 'please enter title ';
                }
                return null;
              },
              controller: titleController,
              decoration: InputDecoration(
                hintText: ' Enter  Your Task Title',
                hintStyle: AppLightStyles.hintStyle,
              ),
            ),
            SizedBox(height: 12.h),
            TextFormField(
              validator: (input){
                if (input==null || input.trim().isEmpty){
                  return 'please enter description ';
                }
                if (input.length<6 ){
                  return 'description should be at least 6 characters long';

                }
                return null;


              },
              controller: descraptionController,
              decoration: InputDecoration(
                hintText: ' Enter  Your Task Description',
                hintStyle: AppLightStyles.hintStyle,
              ),
            ),
            SizedBox(height: 12.h),
            Text('Select date' ,style: AppLightStyles.dateLabel),
            SizedBox(height: 8.h),
            InkWell(
              onTap: (){
                showTaskDatePicker();

              }
                ,
                //toDateFormatted(selectedDate)
                child: Text(selectedDate.toFormattedDate,textAlign: TextAlign.center, style: AppLightStyles.dateStyle,)),
            Spacer(),

            ElevatedButton(onPressed: (){
              addTaskToFireStore();



            }, child: Text('Add Task'))
          ],
        ),
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
  addTaskToFireStore(){
    if (formkey.currentState?.validate() ==false) return ;
     var db=FirebaseFirestore.instance;
   CollectionReference collectionReference=db.collection(UserDM.collectionName)
    .doc(UserDM.currentuser!.id).collection(TODoDM.collectionName);
   DocumentReference documentReference=collectionReference.doc();

   TODoDM toDo=
   TODoDM(id: documentReference.id,
       title: titleController.text,
       description: descraptionController.text,
       datetime: selectedDate
       //     .copyWith(
       //   second: 0,
       //   millisecond: 0,
       //   microsecond: 0,
       //   minute: 0,
       //   hour: 0,
       // )

       ,isDone: false);
   documentReference.set( toDo.toFireStore()).
   then( (_){
     if (context.mounted){
        Navigator.pop(context);
     }


   }, ).
   onError(
       (error,stackTrack){},
   ).
   timeout(
      const Duration(seconds: 3),onTimeout: (){
     //   if (context.mounted){
     //     Navigator.pop(context);
     //   }

   },
   );

  }
}
