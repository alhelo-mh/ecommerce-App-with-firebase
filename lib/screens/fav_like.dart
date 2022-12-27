import 'package:final_project/admin/models/product.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/data/post_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../ap_router/app_router.dart';
import '../providers/auth_provider.dart';
import 'layout_home.dart';

import 'nevagtor_sccreen.dart';

class LikedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 244, 244, 244),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AppRouter.navigateAndReplace(LayoutHome());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Favorite',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 88,
        backgroundColor: const Color.fromARGB(255, 52, 40, 62),
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
      body: Consumer<ProviderAdmin>(
        builder: (context, provider, child) {
          AppUser appUser = Provider.of<AuthProvider>(context).loggedAppUser!;
          provider.getAllFavoriteProduct(appUser);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: provider.favorite == null
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${provider.favorite!.length.toString()} items',
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            const Text(
                              'Sort by:',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            const Text(
                              'Favorite',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            const Icon(
                              Icons.favorite,
                              size: 20,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // ignore: prefer_const_constructors
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 17,
                                  crossAxisCount: 2,
                                  mainAxisExtent: 320,
                                  mainAxisSpacing: 2,
                                  childAspectRatio: 5),
                          itemBuilder: (context, index) {
                            return Featured(provider.favorite![index]);
                          },
                          itemCount: provider.favorite!.length,
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
      bottomNavigationBar: const NivgBotScreen(),
    );
  }

  Widget Featured(Product product) {
    return Consumer<ProviderAdmin>(builder: (context, provider, x) {
      return ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => InfoFeauredScreen(product),
                    //     ));
                  },
                  child: Container(
                    height: 200.r,
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Image.network(
                          product.imageUrl ?? '',
                          fit: BoxFit.cover,
                          width: 163.w,
                          height: 163.h,
                        ),
                        Container(), // Required some widget in between to float AppBar

                        Positioned(
                            top: 145.h,
                            left: 135,
                            child: IconButton(
                                onPressed: () {
                                  AppUser appUser = Provider.of<AuthProvider>(
                                          context,
                                          listen: false)
                                      .loggedAppUser!;
                                  Provider.of<ProviderAdmin>(context,
                                          listen: false)
                                      .delelteFavoriteProduct(product, appUser);
                                },
                                icon: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    product.isLike
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    size: 20,
                                    color: product.isLike
                                        ? const Color.fromRGBO(
                                            231, 185, 68, 100)
                                        : const Color.fromARGB(
                                            255, 132, 95, 161),
                                  ),
                                ))),
                        if (product.discount != 0)
                          Container(
                            width: 47.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Center(
                              child: Text(
                                ' -50%',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: 2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      product.name ?? '',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${product.price ?? ''}',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    });
  }
}
