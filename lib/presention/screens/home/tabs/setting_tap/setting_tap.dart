import 'package:flutter/material.dart';
import 'package:to_do_project_session_11/core/utils/colors_manager.dart';
import 'package:to_do_project_session_11/presention/screens/home/tabs/setting_tap/setting_tap.dart';

class SettingsTap extends StatefulWidget {
   SettingsTap({super.key});

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
   String selectedTheme='Light';
   String selectedLang='English';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme',style: TextStyle(fontWeight:FontWeight.w700,fontSize: 18), ),
         SizedBox(height: 8,),
          Container(
            height: 48,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorsManager.white,
             // borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorsManager.blue,width: 2),

            ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedTheme,style: TextStyle(color: ColorsManager.blue,fontSize: 17),),
                    DropdownButton<String>(
                      underline: Container(color: Colors.transparent,),
                      items: <String>['Light','Dark'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newTheme) {
                        selectedTheme=newTheme!;
                        setState(() {});

                      },
                    )
                  ],

    )
          ),
          SizedBox(height: 8,),
          Text('Languages',style: TextStyle(fontWeight:FontWeight.w700,fontSize: 18), ),
          SizedBox(height:10),
          Container(
              height: 48,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                // borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorsManager.blue,width: 2),

              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedLang,style: TextStyle(color: ColorsManager.blue,fontSize: 17),),
                  DropdownButton<String>(
                    underline: Container(color: Colors.transparent,),
                    items: <String>['Arabic','English'].map((String value) {

                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newLanguages) {
                      selectedLang=newLanguages!;
                      setState(() {});

                    },
                  )
                ],

              )
          ),
        ],
      ),
    );
  }
}


class Item{
  Item({required this.text});
  String text;

}
// DropdownMenu<Item>(
// inputDecorationTheme: InputDecorationTheme(
// border: OutlineInputBorder(
// borderSide: BorderSide(color:ColorsManager.blue,width: 2),
//
// ),
// enabledBorder:  OutlineInputBorder(
// borderSide: BorderSide(color:ColorsManager.blue,width: 2),
//
// ),
// focusedBorder:  OutlineInputBorder(
// borderSide: BorderSide(color:ColorsManager.blue,width: 2),
//
// ),
// fillColor: ColorsManager.white,
// filled: true,
// hintStyle: TextStyle(color: ColorsManager.blue)
//
// ),
// initialSelection: Item(text: 'light'),
// controller: textController,
// width: double.infinity,
// hintText:selectedItem.text,
// requestFocusOnTap: true,
// enableFilter: true,
//
// onSelected: (Item? menu) {
// selectedItem = menu??Item(text: 'light');
// },
// dropdownMenuEntries:
// item.map<DropdownMenuEntry<Item>>((Item item) {
// return DropdownMenuEntry<Item>(
// value: item,
// label: item.text,
// leadingIcon: Icon(Icons.add));
// }).toList(),
// ),