import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

import 'widgets/appbar.dart';
import 'widgets/list_tile.dart';

//Map b = {};
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      //systemNavigationBarColor: Colors.blue,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //var scaffoldKey;
    return ScreenUtilInit(
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var querySnapshot = FirebaseFirestore.instance;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 235, 235),
        appBar: appbar(context),
        body: Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: listTile(),
        ));
  }
}

errorSnackbar(context) {
  var error = SnackBar(
    //margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    //dismissDirection: DismissDirection.horizontal,
    behavior: SnackBarBehavior.floating,
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(width: 8.w),
        Text('Required fields are empty!',
            style: TextStyle(color: Colors.white, fontSize: 14.sp)),
      ],
    ),
    backgroundColor: Colors.red[700],
  );
  return ScaffoldMessenger.of(context).showSnackBar(error);
}

successSnackbar(context) {
  var success = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.check_box_rounded,
          color: Colors.white,
        ),
        SizedBox(width: 8.w),
        Text('Successfully added',
            style: TextStyle(color: Colors.white, fontSize: 16.sp)),
      ],
    ),
    backgroundColor: Colors.green[800],
  );
  ScaffoldMessenger.of(context).showSnackBar(success);
}
