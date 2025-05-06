import 'package:flutter/material.dart';
import 'package:furniture_app/model/furniture_item.dart';
import 'package:furniture_app/provider/cart_provider.dart';
import 'package:furniture_app/widgets/my_button.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';

class DetailPage extends StatefulWidget {
  final FurnitureItem product;
  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(widget.product);
    final isInCart = cartProvider.isInCart(widget.product);
    final quantity = cartProvider.getQuantity(widget.product);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  ),
                  child: Image.asset(
                    widget.product.image,
                    width: double.infinity,
                    height: size.height * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 24,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.15,
                left: 0,
                child: Image.asset('assets/images/Color.png'),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                cartProvider.decreaseQuantity(widget.product);
                                setState(() {});
                              },
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cartProvider.increaseQuantity(widget.product);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(24),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber.shade600),
                      Gap(5),
                      Text(
                        widget.product.rating.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        ' (${widget.product.review})',
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                  const Gap(24),
                  const Text(
                    'This furniture piece is made from high-quality material and designed for modern homes. Stylish, durable, and affordable.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          favoriteProvider.toggleFavorite(widget.product);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                      Gap(20),
                      Expanded(
                        child: MyButton(
                          text: isInCart ? 'Added' : 'Add to Cart',
                          onTap: () {
                            if (!isInCart) {
                              cartProvider.addToCart(widget.product);
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
