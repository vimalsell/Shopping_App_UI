import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object>product;
  const ProductDetailsPage({
    super.key,
    required this.product
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectSize=0;
  void onTap(){
    if(selectSize!=0){
     Provider.of<CartProvider>(context,listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes':selectSize
      },);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Product added to your cart')));
    } else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Please select your size')));
    }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Center(child: Text('Details',style: Theme.of(context).appBarTheme.titleTextStyle,)),
      ),
      body: Column(
        children: [
          Center(child: Text(widget.product['title'] as String,style:Theme.of(context).textTheme.titleLarge,)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl']as String,height: 250,),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245,247,249,1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
                children: [
                  Text('\$${widget.product['price']}',style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection:Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                        itemBuilder: (context,Index){
                        final size=(widget.product['sizes'] as List<int>)[Index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectSize=size;
                              });
                            },
                              child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: selectSize==size?Theme.of(context).colorScheme.primary:null,
                              )
                          ),
                        );
                        }),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(onPressed:onTap,
                     child: Text('Add To Cart',
                      style: TextStyle(color: Colors.black,fontSize: 18),),
                      style:ElevatedButton.styleFrom(
                          backgroundColor:Theme.of(context).colorScheme.primary,
                          minimumSize: Size(double.infinity,50),
                    ),
                    ),
                  )
                ],
            ),
          )
        ],
      ),
    );
  }
}
