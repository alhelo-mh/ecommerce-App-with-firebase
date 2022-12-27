import 'package:final_project/admin/models/product.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/providers/auth_provider.dart';

import 'package:final_project/screens/cart/cart_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../data/post_model.dart';

class InfoFeauredScreen extends StatelessWidget {
  Product product;
  InfoFeauredScreen(this.product);
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderAdmin>(
      builder: (context, provider, child) {
        return ScreenUtilInit(
          builder: (BuildContext context, Widget? child) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(244, 244, 244, 244),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              product.imageUrl!,
                              fit: BoxFit.cover,
                              width: 375.r,
                              height: 375.r,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              child: Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 2,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 18,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '8 reviews',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[600]),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'In Stock',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green[400],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              child: Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 5.r,
                    ),
                    Container(
                      width: 375.r,
                      height: 175.r,
                      color: Colors.white,
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product details',
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                product.description!,
                                style: TextStyle(fontSize: 14.sp),
                                maxLines: 5,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 5.r,
                    ),
                    Container(
                      width: 375.r,
                      height: 235.r,
                      color: Colors.white,
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Reviews',
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: const [
                                      Text(
                                        'See All',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'Olha Chabanova',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Spacer(),
                                  Text(
                                    'June 5,2021',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'I’m old (rolling through my 50’s). But, this is my daughter in law’s favorite color right now.❤️ So I wear it whenever we hang out! She’s my fashion consultant who keeps me on trend🤣',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                '835 people found this helpful',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Comment',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 1, 35, 62),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: const [
                                      Text(
                                        'Helpful',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.help,
                                        size: 18,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: InkWell(
                      onTap: () {
                        //1
                        AppUser appUser =
                            Provider.of<AuthProvider>(context, listen: false)
                                .loggedAppUser!;
                        provider.getAllCartProduct(appUser);
                        provider.addCartProduct(product, appUser);
                        provider.updateModelSopping(product);
                      },
                      child: Container(
                          width: 215.w,
                          height: 48.r,
                          decoration: BoxDecoration(
                              color: Colors.amber[600],
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        AppUser appUser =
                            Provider.of<AuthProvider>(context, listen: false)
                                .loggedAppUser!;
                        AppRouter.navigateAndReplace(CartScreen(product));
                        provider.updateModelSopping(product);
                        provider.getAllCartProduct(appUser);
                      },
                      icon: Icon(
                        product.isSopping
                            ? Icons.shopping_cart_outlined
                            : Icons.shopping_cart_rounded,
                        size: 30,
                        color: product.isSopping
                            ? const Color.fromRGBO(231, 185, 68, 100)
                            : Color.fromARGB(255, 132, 95, 161),
                      ),
                    ),
                    label: 'cart'),
              ]),
            );
          },
        );
      },
    );
  }
}
