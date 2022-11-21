import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model.dart';
import 'main.dart';
import 'widgets/input_fields.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController rolecontroller = TextEditingController();
  //TextEditingController yearcontroller = TextEditingController();

  Iterable monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  Iterable yearList = [
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022
  ];
  String month = 'Month';
  int year = 2022;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // controller: ScrollController(
      //   initialScrollOffset: 100,
      // ),
      //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      // child: Container(
      padding: EdgeInsets.only(
          left: 16.w,
          right: 12.w,
          top: 6.h,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      // height: 280.h,
      child: Container(
        height: 300.h,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InputFields(
              title: 'Name',
              hint: 'Name of employee',
              controller: titlecontroller,
            ),
            InputFields(
              title: 'Role',
              hint: 'Role of employee',
              controller: rolecontroller,
            ),
            Row(
              children: [
                Expanded(
                  child: InputFields(
                      title: 'Joining',
                      hint: 'Year: $year',
                      widget: DropdownButton(
                        elevation: 4,
                        underline: Container(),
                        onChanged: (int? optedvalue) {
                          setState(() {
                            year = optedvalue!;
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: yearList.map((e) {
                          return DropdownMenuItem<int>(
                            value: e,
                            child: Text(e.toString()),
                          );
                        }).toList(),
                      )),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: InputFields(
                      title: '',
                      hint: month,
                      widget: DropdownButton(
                          elevation: 4,
                          underline: Container(),
                          onChanged: (String? optedvalue) {
                            setState(() {
                              month = optedvalue!;
                            });
                          },
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items:
                              monthList.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList())),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      dataValidation();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                    ),
                    child: Container(
                      width: 130.w,
                      height: 35.h,
                      child: Center(
                        child: Text('Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            )),
                      ),
                    ))
              ],
            ),
            // SizedBox(height: 2.h)
          ]),
        ),
      ),
    );
  }

  dataValidation() {
    if (titlecontroller.text.isNotEmpty && rolecontroller.text.isNotEmpty) {
      //print('Required fields there');
      tasktofirestore();
      successSnackbar(context);
    } else {
      //print('error');
      errorSnackbar(context);
    }
  }

  addDoc({details}) {
    FirebaseFirestore.instance
        .collection('employees')
        .add(details)
        .then((snapshot) {
      Navigator.pop(context);
      //print('Added Data with ID: ${snapshot.id}');
    });
    //return Text('Success');
  }

  tasktofirestore() {
    addDoc(
        details: formData(
                name: titlecontroller.text,
                role: rolecontroller.text,
                joining: year,
                month: month)
            .tojson());
  }
}
