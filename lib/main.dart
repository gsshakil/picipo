import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picipo/services/locator.dart';
import 'package:picipo/views/layout_template/layout_template.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // const firebaseConfig = {
  //   apiKey: "AIzaSyDyXC_jB_71TJutCVdLf28B-nuXneJDBQg",
  //   authDomain: "picipo-24ea6.firebaseapp.com",
  //   projectId: "picipo-24ea6",
  //   storageBucket: "picipo-24ea6.appspot.com",
  //   messagingSenderId: "105780646429",
  //   appId: "1:105780646429:web:809fa06aba134e37dbacf4"
  // };

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDyXC_jB_71TJutCVdLf28B-nuXneJDBQg",
    appId: "1:105780646429:web:809fa06aba134e37dbacf4",
    messagingSenderId: "105780646429",
    projectId: "picipo-24ea6",
  ));

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskType = EasyLoadingMaskType.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picipo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LayoutTemplate(),
      builder: EasyLoading.init(),
    );
  }
}
