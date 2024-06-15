// ignore_for_file: file_names
import 'package:flutter/material.dart';
import './pages/home_page.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoedasBase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.indigo,
          )),
      home: const HomePage(),
    );
  }
}
