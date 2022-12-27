import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/models/product.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/admin/views/add_new_products.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  String catId;
  AllProducts(this.catId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 88,
        title: const Text('product Admin'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 52, 40, 62),
                  Color.fromARGB(255, 132, 95, 161),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.navigateToScreen(AddNewProduct(catId));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<ProviderAdmin>(
        builder: (context, provider, child) {
          return Container(
              child: ListView.builder(
            itemCount: provider.products!.length,
            itemBuilder: (context, index) {
              return Padding(
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
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            width: double.infinity,
                            height: 170,
                            child: Image.network(
                              provider.products![index].imageUrl ?? '',
                              fit: BoxFit.fill,
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
                                          Product product =
                                              provider.products![index];
                                          provider.delelteProduct(product);
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
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit)),
                                  )
                                ],
                              ))
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              provider.products![index].name ?? '',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
