import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFields extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const InputFields(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 12.h),
      Text(
        title,
        style: TextStyle(fontSize: 18.sp, color: Colors.black),
      ),
      SizedBox(height: 5.h),
      Container(
          padding: const EdgeInsets.only(left: 7, right: 4),
          //margin: EdgeInsets.only(top: 8.h),
          height: 42.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: TextFormField(
            //autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                suffixIcon: widget),
            controller: controller,
          )),
    ]);
  }
}
