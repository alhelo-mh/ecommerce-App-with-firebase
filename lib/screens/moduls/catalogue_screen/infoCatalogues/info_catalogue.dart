import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/provider/provider_admin.dart';

import 'package:final_project/screens/moduls/catalogue_screen/infoCatalogues/appbarscreen.dart';

import 'package:final_project/screens/nevagtor_sccreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home_screen/featured_home.dart';

class InfoCatalogues extends StatelessWidget {
  String catId;
  InfoCatalogues(this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 244, 244, 244),
      appBar: AppBarCatalogues(),
      body: Consumer<ProviderAdmin>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(children: [
              // TabBar(tabs: [
              //   Tab(
              //     child: Text(
              //       'All',
              //       style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              //   Tab(
              //     child: Text(
              //       'All',
              //       style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              //   Tab(
              //     child: Text(
              //       'All',
              //       style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              //     ),
              //   )
              // ]),
              // ListView.separated(
              //   scrollDirection: Axis.horizontal,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: provider.categories!.length,
              //   itemBuilder: (context, index) {
              //     return badycont(provider.categories![index]);
              //   },
              //   separatorBuilder: (BuildContext context, int index) {
              //     return SizedBox(
              //       width: 10,
              //     );
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            provider.products!.length.toString() + ' items',
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
                            'Type Products',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),

                          PopupMenuButton<int>(
                            itemBuilder: (context) => [
                              // PopupMenuItem 1
                              PopupMenuItem(
                                  value: 1,
                                  // row with 2 children
                                  child: Text(
                                    provider.categories![0].name!,
                                    style: TextStyle(color: Colors.white),
                                  )),

                              // PopupMenuItem 2
                              PopupMenuItem(
                                  value: 2,
                                  // row with two children
                                  child: Text(
                                    provider.categories![1].name!,
                                    style: TextStyle(color: Colors.white),
                                  )),
                              PopupMenuItem(
                                  value: 3,
                                  // row with two children
                                  child: Text(
                                    provider.categories![2].name!,
                                    style: TextStyle(color: Colors.white),
                                  )),
                              PopupMenuItem(
                                  value: 4,
                                  // row with two children
                                  child: Text(
                                    provider.categories![3].name!,
                                    style: TextStyle(color: Colors.white),
                                  )),
                              PopupMenuItem(
                                  value: 5,
                                  // row with two children
                                  child: Text(
                                    provider.categories![4].name!,
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                            offset: Offset(0, 100),
                            color: Color.fromARGB(75, 117, 117, 117),
                            elevation: 2,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                            ),
                            // on selected we show the dialog box
                          ),

                          // Text(
                          //   provider.categories![1].name!,
                          //   style: TextStyle(
                          //       fontSize: 12, fontWeight: FontWeight.bold),
                          // ),
                          // const Icon(
                          //   Icons.keyboard_arrow_down,
                          //   size: 20,
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FeaturedHome()
                    ]),
              ),
            ]),
          );
        },
      ),
      bottomNavigationBar: const NivgBotScreen(),
    );
  }

  Widget badycont(Category category) {
    return Container(
        width: 75,
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Center(
            child: Text(
          category.name!,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        )));
  }
}
