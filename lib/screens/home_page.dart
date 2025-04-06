import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_services.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
static String id='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
         IconButton(onPressed: (){}, icon: const Icon(Icons.add_shopping_cart_outlined,color: Colors.black,)) ,
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('New Trend', style: TextStyle(color: Colors.black),),
        
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future:GetAllProduct().getAllProducts() ,
          builder: (context,snapshot){
           if (snapshot.hasData) {
             List<ProductModel> products=snapshot.data!;
             return GridView.builder(
               itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 80,

                  ), itemBuilder: (context,index){
                return  CustomCard(product:products[index] ,);
              }
              );
           }

           else{
             List<ProductModel> products=snapshot.data!;
             return GridView.builder(
                 clipBehavior: Clip.none,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 1.5,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 80,

                 ), itemBuilder: (context,index){
               return  CustomCard(product: products[index],);
             }
             );
             // return const Center(child: CircularProgressIndicator());
           }
          },
        )
      ),
    );
  }
}
