import 'package:flutter/material.dart';
import 'package:testapp/CustomWidget/app_text.dart';
import 'package:testapp/Screens/CommonScreens/base_app_scafold.dart';
import 'package:testapp/Screens/Home/selected_outfit.dart';

class Product {
  final String name;
  final String imageUrl;
  final String description;

  Product({required this.name, required this.imageUrl,required this.description});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Product> products = [
    Product(name: 'Product 1', imageUrl: 'assets/product1.png',description:'Girocollo in lana merino'),
    Product(name: 'Product 2', imageUrl: 'assets/product2.png',description:'Girocollo in lana merino'),
    Product(name: 'Product 3', imageUrl: 'assets/product3.png',description:'Girocollo in lana merino'),
    Product(name: 'Product 4', imageUrl: 'assets/product4.png',description:'Girocollo in lana merino'),
    Product(name: 'Product 5', imageUrl: 'assets/product2.png',description:'Girocollo in lana merino'),
    Product(name: 'Product 6', imageUrl: 'assets/product3.png',description:'Girocollo in lana merino'),
  ];

  Set<int> selectedProductIndices = Set<int>();
  Set<String> selectedProducts = Set<String>();

  void toggleSelection(int index) {
    setState(() {
      if (isSelected(index)) {
        selectedProductIndices.remove(index);
      } else {
        selectedProductIndices.add(index);
      }

      if (selectedProductIndices.length >= 3) {
        selectedProducts = Set<String>();
        selectedProductIndices.forEach((index) {
          selectedProducts.add(products[index].name);
        });
      }
    });
  }

  bool isSelected(int index) {
    return selectedProductIndices.contains(index);
  }

  @override
  Widget build(BuildContext context) {
    return BaseAppScaffold(
      child: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final isSelected = selectedProductIndices.contains(index);

          return Container(
            // height: 600,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => toggleSelection(index),
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          height: 120,
                          child: Image.asset(
                            product.imageUrl,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (isSelected)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 24,
                          ),
                        ),
                    ],
                  ),
                ),
                AppText(product.name),
                AppText(product.description),
              ],
            ),
          );
        },
      ),
      // floatingActionButton: selectedProducts.isNotEmpty
      //     ? FloatingActionButton.extended(
      //   onPressed: () {
      //     // Navigate to the next screen with the selected buttons
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => SelectedDataScreen(
      //           selectedButtons: selectedProducts.toList(),
      //         ),
      //       ),
      //     );
      //   },
      //   label: Text('Next'),
      //   icon: Icon(Icons.arrow_forward),
      // )
      //     : null,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


