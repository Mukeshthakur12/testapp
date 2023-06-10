import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/CustomWidget/app_text.dart';
import 'package:testapp/CustomWidget/buttonwidget.dart';
import 'package:testapp/Screens/CommonScreens/base_app_scafold.dart';
import 'package:testapp/Screens/CommonScreens/category_screen.dart';
import 'package:testapp/Screens/Home/selected_outfit.dart';
import 'package:testapp/Utils/app_color.dart';

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
    Product(name: 'Product 7', imageUrl: 'assets/product1.png',description:'Girocollo in lana merino'),
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

      if (selectedProductIndices.length >= 1) {
        selectedProducts = Set<String>();
        selectedProductIndices.forEach((index) {
          selectedProducts.add(products[index].name);
        });
      }
      if (selectedProductIndices.length >= 1) {
        showModalBottomSheet(
          context: context,
          useSafeArea: true,
          builder: (BuildContext context) {
            return Container(
              // alignment: AlignmentDirectional.centerStart,
              // padding: EdgeInsets.zero,
              height: 80,
              // width: MediaQuery.of(context).size.width*0.98,
              child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(svgImagePath: 'assets/AppBar/plus.svg', label: "Outfit",
                          backgroundColor: Colors.white, borderColor: appYellowBlack,
                          borderRadius: 8,
                          textStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
                          onPressed: (){}),
                      CustomButton(svgImagePath: 'assets/AppBar/menu.svg', label: "Add to an outfit",
                          backgroundColor: Colors.white, borderColor: appYellowBlack,
                          borderRadius: 8,
                          textStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
                          onPressed: (){}),
                      CustomButton(svgImagePath: 'assets/AppBar/left.svg', label: "Add to an outfit",
                          backgroundColor: appYellowBlack, borderColor: appYellowBlack,
                          borderRadius: 8,
                          isleft: true,
                          textStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectedDataScreen(
                                selectedButtons: selectedProducts.toList(),
                                selectedProductIndices: selectedProductIndices.toList(),
                                products: products,
                              ),
                            ),
                          );
                        },),
                    ],
                  ),
            );
          },
        );
      }
    });
  }

  bool isSelected(int index) {
    return selectedProductIndices.contains(index);
  }
  bool isicon=false;
  @override
  Widget build(BuildContext context) {
    var th = Theme.of(context).textTheme;
    if(selectedProducts.isNotEmpty){
      isicon=true;
    }
    else {
      isicon = false;
    }
    return BaseAppScaffold(
      isIcon: isicon,
      child: Column(
        children: [
          CategoryScreen(),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                // crossAxisSpacing: 0,
                crossAxisCount: MediaQuery.of(context).size.width ~/ 191,
                childAspectRatio: 0.68,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final isSelected = selectedProductIndices.contains(index);

                return Container(
                  // color: Colors.red,
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
                              width: 191,
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected ? appYellowBlack : Colors.transparent,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(0),
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
                                bottom: 8,
                                right: 8,
                                child: SvgPicture.asset('assets/AppBar/tick.svg',
                                )
                              ),
                          ],
                        ),
                      ),
                      AppText(product.name,style: th.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),),
                      AppText(product.description,style: th.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400
                      ),),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


