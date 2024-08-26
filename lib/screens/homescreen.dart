import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_products_cubit.dart';
import '../models/product.dart';
import 'details_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}

class _HomeState extends State<Homepage> {
  int index = 0;
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  // List to store favorited products
  List<Product> favoriteProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          autofocus: true,
          onChanged: (query) {},
        )
            : const Text('HomePage', style: TextStyle(color: Color.fromARGB(255, 249, 153, 10))),
        actions: <Widget>[
          _isSearching
              ? IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                _isSearching = false;
                _searchController.clear();
              });
            },
          )
              : IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
          ),
        ],
      ),
      body: _buildPageContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() {
          index = i;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildPageContent() {
    if (index == 0) {
      // Home page with products
      return BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
          if (state is GetProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductsSuccess) {
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,  // Two products per row
                childAspectRatio: 0.6,  // Adjust aspect ratio to control height
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: state.productList.length,
              itemBuilder: (context, index) {
                final product = state.productList[index];
                return ProductCard(
                  product: product,
                  isFavorited: favoriteProducts.contains(product),
                  onFavoritePressed: (isFavorited) {
                    setState(() {
                      if (isFavorited) {
                        favoriteProducts.remove(product);
                      } else {
                        favoriteProducts.add(product);
                      }
                    });
                  },
                  onBuyNowPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(product: product),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is GetProductsFailure) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return Container();
        },
      );
    } else if (index == 1) {
      // Favorite page content
      if (favoriteProducts.isEmpty) {
        return const Center(child: Text('No favorite products yet.'));
      } else {
        return GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = favoriteProducts[index];
            return ProductCard(
              product: product,
              isFavorited: true,
              onFavoritePressed: (isFavorited) {
                setState(() {
                  favoriteProducts.remove(product);
                });
              },
              onBuyNowPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: product),
                  ),
                );
              },
            );
          },
        );
      }
    } else if (index == 2) {
      // Account page content
      return const Center(child: Text('Account Page'));
    }
    return Container();
  }
}

class ProductCard extends StatefulWidget {
  final Product product;
  final bool isFavorited;
  final ValueChanged<bool> onFavoritePressed;
  final VoidCallback onBuyNowPressed;

  const ProductCard({
    Key? key,
    required this.product,
    required this.isFavorited,
    required this.onFavoritePressed,
    required this.onBuyNowPressed,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Column(
              children: [
                // Oval container for the product image
                ClipOval(
                  child: Container(
                    color: Colors.orangeAccent,
                    child: Image.network(
                      widget.product.thumbnail,
                      height: 105,
                      width: 105,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Expanded title to avoid overflow
                Expanded(
                  child: Text(
                    widget.product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                // Row for price and rating with a star
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.star, color: Colors.orange, size: 20),
                    const SizedBox(width: 5),
                    Text(
                      '${widget.product.rating.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Buy Now Button
                ElevatedButton(
                  onPressed: widget.onBuyNowPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Buy Now!',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            // Favorite button in the top-left corner of the image
            Positioned(
              top: -12,
              right: -8,
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: widget.isFavorited ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  widget.onFavoritePressed(widget.isFavorited);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
