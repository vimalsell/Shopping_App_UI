import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details_page.dart';

class productList extends StatefulWidget {

  const productList({super.key});

  @override
  State<productList> createState() => _productListState();
}

class _productListState extends State<productList> {
  final List<String> filters = const ['All','Adidas','Nike','Bata'];
  late String selectFilter;
  int currentPage =0;
  @override
  void initState() {
    super.initState();
    selectFilter = filters[0];
  }
  Widget build(BuildContext context) {
    const border =OutlineInputBorder(borderSide: BorderSide(
      color: Color.fromRGBO(225, 225, 225, 1),),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );
    return  SafeArea(
        child:Column(
            children:[
              Row(
                children:[
                  Padding(
                    padding:const EdgeInsets.all(20.0),
                    child:Text('Shoes\nCollection',style:Theme.of(context).textTheme.titleLarge,),
                  ),
                  const Expanded(
                    child:TextField(
                        decoration:InputDecoration(
                            hintText:'Search',
                            prefixIcon:Icon(Icons.search),
                            border:border,
                            enabledBorder:border,
                            focusedBorder:border
                        )
                    ),
                  ),

                ],
              ),
              SizedBox(
                height:120,
                child:ListView.builder(
                    scrollDirection:Axis.horizontal,
                    itemCount:filters.length,
                    itemBuilder:(context,Index){
                      final filter=filters[Index];
                      return Padding(
                        padding:const EdgeInsets.symmetric(horizontal:8.0),
                        child:GestureDetector(
                          onTap:(){
                            setState((){
                              selectFilter=filter;
                            });
                          },
                          child:Chip(
                            padding:const EdgeInsets.symmetric(vertical:10,horizontal:15),
                            label:
                            Text(filter,
                              style:const TextStyle(fontWeight:FontWeight.bold),),
                            backgroundColor:
                            selectFilter==filter?Theme.of(context).colorScheme.primary:const Color.fromRGBO(245,247,249,1),
                            side:const BorderSide(color:Color.fromRGBO(245,247,249,1)),
                            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(25)),),
                        ),
                      );
                    }
                ),
              ),
              Expanded(
                child:ListView.builder(
                    itemCount:products.length,
                    itemBuilder:(context,Index){
                      final product=products[Index];
                      return GestureDetector(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(builder:(context){
                            return ProductDetailsPage(product:product);
                          }
                          )
                          );
                        },
                        child:productCard(
                          title:product['title']as String,
                          price:product['price']as double,
                          image:product['imageUrl']as String,
                          backgroundColor:Index.isEven
                              ?const Color.fromRGBO(216,240,253,1)
                              :const Color.fromRGBO(245,247,249,1),
                        ),
                      );
                    }),
              )
            ]
        )
    );
  }
}
