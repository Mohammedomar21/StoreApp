import 'dart:math';

import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/update_product.dart';
import '../widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hint: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hint: 'description',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hint: 'price',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hint: 'image',
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update',
                  ontap: () async {
                    isLoading = true;
                    setState(() {});
                    try{
                   await updateProduct(product);
                    print('success');
                    }
                    catch(e){
                      log(e.hashCode);
                    }
                    isLoading=false;
                    setState(() {

                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  Future<void> updateProduct(ProductModel product) async
  {
   await UpdateProductService().updateProduct(
     id: product.id,
        title: productName==null? product.title:productName!,
        price: price==null?product.price.toString():price!,
        desc: desc==null?product.description:desc!,
        image: image==null?product.image:image!,
        category: product.description);
  }
}
