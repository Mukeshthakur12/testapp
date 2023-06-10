import 'package:flutter/material.dart';
import 'package:testapp/CustomWidget/app_text.dart';
import 'package:testapp/Screens/CommonScreens/app_bact_scalfold.dart';
import 'package:testapp/Screens/CommonScreens/base_app_scafold.dart';
import 'package:testapp/Screens/Home/selected_outfit.dart';

import '../../CustomWidget/app_padding.dart';
import '../../CustomWidget/buttonwidget.dart';

class Productoutfit {
  final String name;
  final String imageUrl;
  final String description;

  Productoutfit({required this.name, required this.imageUrl,required this.description});
}

class outfit extends StatefulWidget {
  @override
  _outfit createState() => _outfit();
}

class _outfit extends State<outfit> {
  List<Productoutfit> products = [
    Productoutfit(name: 'Product 1', imageUrl: 'assets/product1.png',description:'Girocollo in lana merino'),
    Productoutfit(name: 'Product 2', imageUrl: 'assets/product2.png',description:'Girocollo in lana merino'),
    Productoutfit(name: 'Product 3', imageUrl: 'assets/product3.png',description:'Girocollo in lana merino'),
    Productoutfit(name: 'Product 4', imageUrl: 'assets/product4.png',description:'Girocollo in lana merino'),
    Productoutfit(name: 'Product 5', imageUrl: 'assets/product2.png',description:'Girocollo in lana merino'),
    Productoutfit(name: 'Product 6', imageUrl: 'assets/product3.png',description:'Girocollo in lana merino'),
  ];


  @override
  Widget build(BuildContext context) {
    return AppBackScalfold(
      isIcon: false,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding.test(child: Text('Outfit 1', style: TextStyle(fontSize: 28, color: Colors.black))),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];

                return AppPadding.test(
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 220,
                                child: Image.asset(
                                  item.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text(item.name, style: TextStyle(fontSize: 14, color: Colors.grey)),
                                  SizedBox(height: 20),
                                  Text(item.description, style: TextStyle(fontSize: 14, color: Colors.grey)),
                                  SizedBox(height: 20),
                                  CustomButton(
                                    svgImagePath: 'assets/icons/clear.svg',
                                    label: 'Remove from the outfit',
                                    backgroundColor: Color(0xffffffff),
                                    borderColor: Colors.red,
                                    borderRadius: 8,
                                    onPressed: () {  },
                                    textStyle: TextStyle(fontSize: 16, color: Colors.black),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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


