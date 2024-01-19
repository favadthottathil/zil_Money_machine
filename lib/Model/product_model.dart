class ProductModel {
  final dynamic id;
  final dynamic title;
  final dynamic price;

  final dynamic description;

  final dynamic category;

  final dynamic image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModel.formJson(Map<String, dynamic> product) {
    return ProductModel(
      id: product['id'],
      title: product['title'],
      price: product['price'],
      description: product['description'],
      category: product['category'],
      image: product['image'],
    );
  }
}
