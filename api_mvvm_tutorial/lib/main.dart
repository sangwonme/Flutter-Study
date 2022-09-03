import 'dart:convert';

import 'package:api_mvvm_tutorial/model/store.dart';
import 'package:api_mvvm_tutorial/repository/store_repository.dart';
import 'package:api_mvvm_tutorial/ui/view/main_page.dart';
import 'package:api_mvvm_tutorial/viewmodel/store_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: StoreModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}