import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shopping_flutter/Providers/category_provider.dart';
import 'package:online_shopping_flutter/Providers/product_detail_provider.dart';
import 'package:online_shopping_flutter/Providers/product_list_provider.dart';
import 'package:online_shopping_flutter/screens/home_screen.dart';
import 'package:online_shopping_flutter/screens/product_detail_screen.dart';
import 'package:online_shopping_flutter/services/firebase_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(systemNavigationBarColor: Colors.grey.shade900));
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          CategoryProvider categoryProvider = CategoryProvider();
          ProductListProvider productListProvider = ProductListProvider();
          FirebaseHelper firebaseHelper =
              FirebaseHelper(categoryProvider, productListProvider);

          firebaseHelper.getCategoryItems('mtb');
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => categoryProvider),
              ChangeNotifierProvider(create: (context) => productListProvider),
              ChangeNotifierProvider(
                create: (context) => ProductDetailProvider(),
              ),
            ],
            child: MaterialApp(
              initialRoute: HomeScreen.ROUTE_NAME,
              routes: {
                HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
                ProductDetailScreen.ROUTE_NAME: (context) =>
                    ProductDetailScreen(),
              },
              theme: ThemeData.dark(),
              title: 'E commerce Template',
              home: HomeScreen(),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
