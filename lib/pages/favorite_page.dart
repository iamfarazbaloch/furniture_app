import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favorite_provider.dart';
import '../provider/cart_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favorites = favoriteProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/search.png'),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Favorite Items',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/cart.png'),
            onPressed: () {
              // Navigate to Cart Page
            },
          ),
        ],
      ),
      body:
          favorites.isEmpty
              ? const Center(
                child: Text(
                  'No favorites yet',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
              : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final item = favorites[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            item.image,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$${item.price.toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  cartProvider.addToCart(item);
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  favoriteProvider.toggleFavorite(item);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
