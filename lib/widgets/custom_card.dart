import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key,required this.product});
 final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(

          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: const Offset(10, 10),

                )
              ]
          ),
          child:  Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(product.title.substring(0,20),style: const TextStyle(color: Colors.grey ,fontSize: 16),),
                  const SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r'$' '${product.price.toString()}'),
                      const Icon(Icons.favorite,color: Colors.red,),
                    ],)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 32,
          top: -60,
          // child:Image.asset('assets/images/1.jpg',height: 100,),
          child:  Image.network(product.image,height: 100,width: 100,),
        )

      ],
    );
  }
}
