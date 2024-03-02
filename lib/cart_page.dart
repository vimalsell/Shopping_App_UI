import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:shop_app_flutter/product_details_page.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
          itemBuilder: (context, index){
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              ),
              title: Text(cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,),
              subtitle: Text('Size:${cartItem['sizes']}'),
              trailing: IconButton(
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('delete',style: Theme.of(context).textTheme.titleMedium,),
                    content: Text('Are you sure you want remove the product',style: TextStyle(fontWeight: FontWeight.bold),),
                    actions: [TextButton(onPressed: (){
                      Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                      Navigator.of(context).pop();
                    }, child: Text('Yes',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                      child: Text('No',
                          style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)))
                    ],
                  );
                });
              },
                icon: Icon(Icons.delete,color: Colors.red,),
              ),
            );
          },
      )
      );
  }
}
