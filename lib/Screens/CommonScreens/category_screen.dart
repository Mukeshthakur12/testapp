import 'package:flutter/material.dart';
import 'package:testapp/CustomWidget/app_text.dart';
import 'package:testapp/Utils/app_color.dart';

class Category {
  final String name;

  Category({required this.name});
}

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedCategoryIndex = 0;

  final List<Category> categories = [
    Category(name: 'ALL CATEGORIES'),
    Category(name: 'COATS'),
    Category(name: 'SWEATERS'),
    Category(name: 'TROUSERS'),
    Category(name: 'SHIRT'),
    Category(name: 'T-SHIRT'),
    Category(name: 'SHORTS'),
    Category(name: 'SHOES'),
  ];

  @override
  Widget build(BuildContext context) {
    var th = Theme.of(context).textTheme;

    return Container(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = index == selectedCategoryIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? appYellowBlack : Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
              child: AppText(
                category.name,
                style: th.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  ),textColor: isSelected ? appYellowBlack : appColorBlack,
              ),
            ),
          );
        },
      ),
    );
  }
}
