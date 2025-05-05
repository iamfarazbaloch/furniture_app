import 'package:flutter/material.dart';
import 'package:furniture_app/constant/app_color.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../provider/furniture_provider.dart';
import 'cart_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, String> _categories = {
    'Popular': 'assets/icons/star.png',
    'Chair': 'assets/icons/chair.png',
    'Table': 'assets/icons/table.png',
    'Armchair': 'assets/icons/sofa1.png',
    'Bed': 'assets/icons/bed.png',
    'Lamp': 'assets/icons/lamp.png',
  };

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<FurnitureProvider>(context).items;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icons/search.png'),
                  Column(
                    children: [
                      Text(
                        'Make home',
                        style: TextStyle(
                          color: smallText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'BEAUTIFUL',
                        style: TextStyle(
                          color: bigText,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                    child: Image.asset('assets/icons/cart.png'),
                  ),
                ],
              ),
            ),
            const Gap(24),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final categoryName = _categories.keys.elementAt(index);
                  final categoryImage = _categories.values.elementAt(index);
                  final isSelected = index == _selectedIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color:
                                  isSelected
                                      ? Colors.black
                                      : Colors.grey.shade200,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                isSelected
                                    ? Colors.white
                                    : Colors.grey.shade500,
                                BlendMode.srcIn,
                              ),
                              child: Image.asset(categoryImage),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categoryName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: isSelected ? Colors.black : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.53,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                DetailPage(product: item),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 220,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.shopping_bag,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
