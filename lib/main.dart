import 'package:flutter/material.dart';
import 'package:flutter_sql/model/sqldata.dart';
import 'package:flutter_sql/views/createNote.dart';
import 'package:flutter_sql/views/home.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => Home(),),
        GetPage(name: "/CreateNote", page: () => CreateNote(),)
      ],
      
    );
  }
}
