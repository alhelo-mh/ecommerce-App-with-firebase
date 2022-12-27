import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/models/product.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/admin/views/display_all_products.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoruWidget extends StatelessWidget {
  Category category;
  CategoruWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ProviderAdmin>(context, listen: false)
            .getAllProduct(category.id!);
        AppRouter.navigateToScreen(AllProducts(category.id!));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2)),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: double.infinity,
                    height: 170,
                    child: Image.network(
                      category.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      right: 15,
                      top: 10,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  Provider.of<ProviderAdmin>(context,
                                          listen: false)
                                      .delelteCategory(category);
                                },
                                icon: const Icon(Icons.delete)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
                          )
                        ],
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [Text(category.name!)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
