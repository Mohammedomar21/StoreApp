class ProductModel
{
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;
  ProductModel({
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
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: RatingModel.formJson(jsonData['rating']),
    );
  }
}
class RatingModel
{
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });
  factory RatingModel.formJson(jsonData)
  {
    return RatingModel(
        rate: jsonData['rate'],
        count: jsonData['count'],
    );
  }

}