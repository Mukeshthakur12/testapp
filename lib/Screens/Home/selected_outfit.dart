
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/CustomWidget/app_padding.dart';
import 'package:testapp/CustomWidget/app_text.dart';
import 'package:testapp/Utils/app_color.dart';

import '../CommonScreens/app_bact_scalfold.dart';
import '../CommonScreens/products.dart';
import '../outfit.dart';
import 'home_screen.dart';

class SelectedDataScreen extends StatelessWidget {
  final List<String> selectedButtons;
  final List<int> selectedProductIndices;
  final List<Product> products;

  SelectedDataScreen({
    required this.selectedButtons,
    required this.selectedProductIndices,
    required this.products,
  });
bool isline=true;
  @override
  Widget build(BuildContext context) {
    var th = Theme.of(context).textTheme;

    return AppBackScalfold(
      isIcon: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding.test(child: AppText("Your Outfit to test",style: th.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,fontSize: 28
          ),)),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: selectedProductIndices.length,
              itemBuilder: (context, index) {
                final productIndex = selectedProductIndices[index];
                final product = products[productIndex];
                if(index==selectedProductIndices.length-1){
                  isline=false;
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppPadding.x2(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText("Outfit"+(index+1).toString(),style: th.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),textColor: appColorBlack,),
                          IconButton(icon: Icon(CupertinoIcons.arrow_right,size: 20,),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => outfit(),
                              ),
                            );
                          },
                          )
                        ],
                      ),
                    ),
                    AppPadding.test(
                      child: Container(
                        height:280,
                        child: ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, indx) {
                              return Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 191,
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
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
                                  AppText(product.name,style: th.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),),
                                  AppText(product.description,style: th.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w400
                                  ),),
                                ],
                              );
                            }
                        ),
                      ),
                    ),
                    isline?Divider(
                      height: 5,
                      thickness: 2,
                      color: Colors.black,
                    ):SizedBox.shrink(),
                    SizedBox(height: 20,),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
