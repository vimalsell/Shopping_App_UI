import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/home_page.dart';
import 'package:shop_app_flutter/product_details_page.dart';

import 'cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=> CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(254, 206, 1, 1),
            primary: Color.fromRGBO(254, 206, 1, 1),),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
              prefixIconColor:Color.fromRGBO(199, 119, 119, 1) ),
          appBarTheme: AppBarTheme(
            titleTextStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
          ),
          useMaterial3: true,
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          )
        ),
        home:  HomePage()
      ),
    );
  }
}
