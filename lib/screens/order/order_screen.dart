import 'package:final_project/admin/models/product.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/providers/auth_provider.dart';

import 'package:final_project/screens/layout_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../ap_router/app_router.dart';
import '../../data/post_model.dart';

class OrderScreen extends StatelessWidget {
  Product product;
  OrderScreen(this.product);
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderAdmin>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(244, 244, 244, 244),
          appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 88.r,
            title: const Text('Order'),
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
          ),
          body: ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return provider.carts == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: provider.carts!.length,
                      itemBuilder: (context, index) {
                        return bulidList(provider.carts![index]);
                      },
                    );
            },
          ),
          bottomSheet: Container(
            color: const Color.fromARGB(244, 244, 244, 244),
            child: Container(
              width: 375.w,
              height: 70.r,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 263.w,
                      height: 48.h,
                      child: ElevatedButton(
                          onPressed: () {
                            AppRouter.navigateAndReplace(LayoutHome());
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                          ),
                          child: const Text(
                            'Continue Shopping',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bulidList(Product product) {
    return Consumer<ProviderAdmin>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 375.w,
              height: 117.r,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Image.network(
                      product.imageUrl!,
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                          width: 170.w,
                          height: 57.h,
                          child: Text(
                            product.name!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          )),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.r),
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              provider.addNumCart(product);
                            },
                            icon: const Icon(Icons.add_circle_outline_sharp)),
                        Text('${product.number}'),
                        IconButton(
                            onPressed: () {
                              provider.minsNumCart(product);
                            },
                            icon:
                                const Icon(Icons.remove_circle_outline_sharp)),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        AppUser appUser =
                            Provider.of<AuthProvider>(context, listen: false)
                                .loggedAppUser!;
                        provider.getAllCartProduct(appUser);
                        provider.delelteCartProduct(appUser, product);
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 30.sp,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
