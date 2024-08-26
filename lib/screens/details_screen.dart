import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Product Image
            Image.network(product.thumbnail),
            const SizedBox(height: 20),

            // Product Title
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Product Price
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Product Rating
            Text(
              'Rating: ${product.rating}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            // Product Description
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Product Reviews (in grey boxes)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reviews',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ..._buildReviewBoxes(),
              ],
            ),
            const SizedBox(height: 20),

            // "Add to Cart" Button
            ElevatedButton(
              onPressed: () {
                // Handle add to cart action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dynamically build review boxes from the product reviews
  List<Widget> _buildReviewBoxes() {
    if (product.reviews.isEmpty) {
      return [
        const Text("No reviews available for this product."),
      ];
    }

    return product.reviews.map((review) {
      if (review is String) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(review),
        );
      } else {
        return const Text("Invalid review format");
      }
    }).toList();
  }
}
