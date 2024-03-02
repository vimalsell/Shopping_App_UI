import 'package:flutter/material.dart';


class productCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const productCard({
    super.key,
   required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor

  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: 5,),
            Text('\$$price',style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 5,),
            Center(child: Image.asset(image,height: 175,)),
          ],
        ),
    );
  }
}
