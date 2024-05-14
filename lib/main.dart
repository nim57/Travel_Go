
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_project2024/packegs/Controllers/mainscreen_provider.dart';
import 'package:travel_project2024/packegs/Controllers/product_provider.dart';
import 'package:travel_project2024/packegs/Views/ui/main_screen.dart';
import 'package:travel_project2024/packegs/Views/ui/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create:(context)=> MainScreenNoTifier()),
        ChangeNotifierProvider(create: (context) => ProductNotifier()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

