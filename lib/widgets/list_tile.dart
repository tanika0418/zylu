import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget listTile() {
  var querySnapshot = FirebaseFirestore.instance;
  return StreamBuilder(
      stream: querySnapshot
          .collection('employees')
          .orderBy('name', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          var mydata = snapshot.data!.docs;
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              itemExtent: null,
              itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 85.h,
                  margin: EdgeInsets.only(top: 12.h, left: 14.w, right: 14.w),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 12.w,
                        top: 12.h,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/mann.png',
                            height: 50.h,
                            width: 55.w,
                            fit: BoxFit.fill,
                          ),
                          // backgroundColor: Colors.black,
                        ),
                      ),
                      Positioned(
                        left: 80.w,
                        top: 8.h,
                        child: Container(
                          width: 200.w,
                          child: Column(
                            children: [
                              Text(
                                mydata[index]['name'],
                                maxLines: 1,
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                mydata[index]['role'],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[850],
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                '${'Joined : ' + mydata[index]['month']} ${mydata[index]['joining']}',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey[850]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (2022 - (mydata[index]['joining']) >= 5)
                        Positioned(
                          right: 12.w,
                          top: 10.h,
                          child:
                              //Container(child:Icon(Icons.check_circle_rounded,color: Colors.green[900],)
                              Image.asset(
                            'assets/images/seal badge.png',
                            height: 22.h,
                            width: 26.w,
                          ),
                        )
                    ],
                  )));
        }
      });
}
