import 'package:final_project/admin/models/product.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/data/post_model.dart';
import 'package:final_project/providers/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../featured_screen/infoFeaured/info_feaured.dart';

class FeaturedHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderAdmin>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return provider.products == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Products',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          // ignore: prefer_const_constructors
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 17,
                                  crossAxisCount: 2,
                                  mainAxisExtent: 330,
                                  mainAxisSpacing: 2,
                                  childAspectRatio: 5),
                          itemBuilder: (context, index) => Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InfoFeauredScreen(
                                            provider.products![index]),
                                      ));
                                },
                                child: Container(
                                  height: 200.r,
                                  child: Stack(
                                    alignment: AlignmentDirectional.topStart,
                                    children: [
                                      Image.network(
                                        provider.products![index].imageUrl ??
                                            '',
                                        fit: BoxFit.cover,
                                        width: 163.w,
                                        height: 163.h,
                                      ),
                                      Container(), // Required some widget in between to float AppBar

                                      Positioned(
                                          top: 145.h,
                                          left: 135,
                                          child: IconButton(
                                              onPressed: () async {
                                                AppUser appUser =
                                                    Provider.of<AuthProvider>(
                                                            context,
                                                            listen: false)
                                                        .loggedAppUser!;
                                                Product product =
                                                    provider.products![index];
                                                await provider.updateModel(
                                                    product, appUser);
                                                // .addFavoriteProduct(
                                                //     product, appUser);
                                              },
                                              icon: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  provider.products![index]
                                                          .isLike
                                                      ? Icons.favorite
                                                      : Icons
                                                          .favorite_border_outlined,
                                                  size: 20,
                                                  color: provider
                                                          .products![index]
                                                          .isLike
                                                      ? const Color.fromRGBO(
                                                          231, 185, 68, 100)
                                                      : const Color.fromARGB(
                                                          255, 132, 95, 161),
                                                ),
                                              ))),
                                      if (provider.products![index].discount !=
                                          0)
                                        Container(
                                          width: 47.w,
                                          height: 20.h,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20))),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
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
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
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
                                    provider.products![index].name ?? '',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${provider.products![index].price ?? ''}',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
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
                          itemCount: provider.products!.length,
                        )
                      ],
                    );
            },
          ),
        );
      },
    );
  }
}
