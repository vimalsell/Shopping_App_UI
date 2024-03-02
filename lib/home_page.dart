import 'package:flutter/material.dart';
import 'package:shop_app_flutter/product_list.dart';
import 'cart_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All','Adidas','Nike','Bata'];
  late String selectFilter;
  int currentPage =0;
  List<Widget> pages =[
    productList(),
    CartPage()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentPage,
        onTap: (value){
          setState(() {
            currentPage=value;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: '')
      ],),
    );
  }
}
