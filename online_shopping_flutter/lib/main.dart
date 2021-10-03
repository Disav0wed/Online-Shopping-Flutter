import 'package:flutter/material.dart';
import 'package:online_shopping_flutter/Providers/category_provider.dart';
import 'package:online_shopping_flutter/Providers/item_provider.dart';
import 'package:online_shopping_flutter/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => ItemProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'E commerce Template',
        home: HomeScreen(),
      ),
    );
  }
}
