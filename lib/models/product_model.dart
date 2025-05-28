class ProductModel
{
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;
  const ProductModel({
    required this.rating,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image
  });
  factory ProductModel.fromJson(jsonData)
  {
    return ProductModel(
        id: jsonData['id'] as int,
        title: jsonData['title'] as String ,
        price: jsonData['price'].toDouble() ,
        description: jsonData['description'] as String,
        image: jsonData['image'] as String,
        rating: RatingModel.formJson(jsonData['rating']),
    );
  }
}
class RatingModel
{
  final double rate;
  final int count;

 const  RatingModel({
    required this.rate,
    required this.count,
  });
  factory RatingModel.formJson(jsonData)
  {
    return RatingModel(
        rate: jsonData['rate'].toDouble(),
        count: jsonData['count'] as int,
    );
  }

}