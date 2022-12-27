import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/screens/moduls/catalogue_screen/infoCatalogues/info_catalogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ap_router/app_router.dart';
import '../../../data/post_model.dart';

class BadyCatalogue extends StatelessWidget {
  Category category;
  BadyCatalogue(this.category);
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderAdmin>(builder: (context, provider, x) {
      return InkWell(
        onTap: () {
          Provider.of<ProviderAdmin>(context, listen: false)
              .getAllProduct(category.id!);
          AppRouter.navigateToScreen(InfoCatalogues(category.id!));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          width: 378,
          height: 98,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  category.name ?? '',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Container(
                width: 98,
                height: 98,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: category.image == null
                    ? Text('data')
                    : Image.network(
                        category.image!,
                        fit: BoxFit.cover,
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
