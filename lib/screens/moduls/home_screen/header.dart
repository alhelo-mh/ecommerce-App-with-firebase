import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/ap_router/app_router.dart';

import 'package:final_project/screens/moduls/catalogue_screen/infoCatalogues/info_catalogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HeaderScreen extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.5, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderAdmin>(builder: (context, provider, x) {
      return provider.products == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ScreenUtilInit(
              builder: (BuildContext context, Widget? child) {
                return InkWell(
                  onTap: () {
                    AppRouter.navigateToScreen(
                        InfoCatalogues(provider.products![1].catId!));
                  },
                  child: CarouselSlider(
                      items: provider.products!
                          .map(
                            (e) => Stack(
                              children: [
                                Container(
                                    width: double.infinity,
                                    height: 88.h,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(e.imageUrl!
                                              //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4h_D3oIi-ZOTAUTISFNLODaxi8tDVOQQvlw&usqp=CAU',
                                              ),
                                          fit: BoxFit.fitWidth,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                Container(
                                  width: double.infinity,
                                  height: 88.h,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color.fromRGBO(52, 40, 62, 100),
                                            Color.fromRGBO(132, 95, 161, 100),
                                          ],
                                          begin: FractionalOffset(0.0, 0.0),
                                          end: FractionalOffset(1.0, 0.0),
                                          stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.name!,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontFamily: 'SF Pro Display',
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'See More >',
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 12,
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: 88.r,
                        initialPage: 2,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      )),
                );
              },
            );
    });
  }
}
