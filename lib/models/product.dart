class Product {
  final String title;
  final String category;
  final String description;
  final String thumbnail;
  final double price;
  final double rating;
  final List<String> reviews;

  Product({
    required this.title,
    required this.category,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.rating,
    required this.reviews,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    var reviewList = (json["reviews"] as List<dynamic>?)?.map((review) {
      if (review is String) {
        return review;
      }
      return "Invalid review format"; // Handle unexpected format
    }).toList() ?? [];


    return Product(
      title: json["title"] ?? "No Title Available",
      category: json["category"] ?? "No Category Available",
      description: json["description"] ?? "No Description Available",
      thumbnail: json["thumbnail"] ?? "https://demofree.sirv.com/nope-not-here.jpg?w=150",
      price: json["price"]?.toDouble() ?? 0.0,
      rating: json["rating"]?.toDouble() ?? 0.0,
      reviews: reviewList,
    );
  }
}
