import 'package:flutter/material.dart';
import 'package:furniture_app/constant/app_color.dart';
import 'package:gap/gap.dart';

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
  };

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  Image.asset('assets/icons/cart.png'),
                ],
              ),
            ),
            const Gap(20),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      padding: const EdgeInsets.only(right: 12.0),
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
                                      : Colors.grey.shade300,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              child: Image.asset(categoryImage),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categoryName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
