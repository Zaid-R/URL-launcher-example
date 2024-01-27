import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'pages/home_page.dart';

import 'state_manager.dart';

void main() {
  runApp(ChangeNotifierProvider<StateManager>(
    create: (_) => StateManager(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
          backgroundColor: themeColor,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        )),
        home: const HomePage());
  }
}
