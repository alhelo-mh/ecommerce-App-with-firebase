import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/admin/views/add_new_category.dart';
import 'package:final_project/admin/views/category_widget.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/screens/catalogue_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayAllCategories extends StatelessWidget {
  const DisplayAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 88,
        title: const Text('Category Admin'),
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
                AppRouter.navigateToScreen(AddNewCategorys());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<ProviderAdmin>(
        builder: (context, provider, x) {
          return provider.categories == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: provider.categories!.length,
                  itemBuilder: (context, index) {
                    return CategoruWidget(provider.categories![index]);
                  },
                );
        },
      ),
    );
  }
}
