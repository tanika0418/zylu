import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../add_data.dart';

PreferredSize appbar(context) {
  // var statusBarHeight=MediaQuery.of()
  return PreferredSize(
      preferredSize: Size.fromHeight(50.h),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              height: 49.2.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.grey[800],
                    size: 22,
                  ),
                  Text('Employee Directory', style: TextStyle(fontSize: 20.sp)),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: ((context) => const Add()),
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(28)))),
                    child: Container(
                      height: 42.h,
                      width: 44.w,
                      color: Colors.white,
                      child: const Icon(
                        Icons.add_circle_rounded,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 0.8.h,
            child: Container(color: Colors.grey[400]),
          )
        ]),
      ));
}
