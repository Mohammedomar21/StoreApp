import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class CategoriseService {
  Future<List<ProductModel>> getCategoriseProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(
        url: 'https://fakestoreapi.com/products/category/$categoryName',
        token: '');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
