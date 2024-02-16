import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:p_money_management/db/category/category_db.dart';
import 'package:p_money_management/model/category/category_model.dart';
import 'package:p_money_management/screens/add_transaction/transaction_screen.dart';
import 'package:p_money_management/screens/home/home.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();

  if(!Hive.isAdapterRegistered(categoryTypeAdapter().typeId)){
    Hive.registerAdapter(categoryTypeAdapter());
  }


  if(!Hive.isAdapterRegistered(categoryModelAdapter().typeId)){
    Hive.registerAdapter(categoryModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const screenhome(),
      routes: {
        screentransaction.routname:(ctx)=>const screentransaction()
      },
    );
  }
}
