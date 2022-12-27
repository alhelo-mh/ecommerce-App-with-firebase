import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/admin/views/display_all_products.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/screens/moduls/catalogue_screen/infoCatalogues/info_catalogue.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import 'layout_home.dart';
import 'moduls/catalogue_screen/app_bar_catalogue.dart';
import 'moduls/catalogue_screen/bady_catalogue.dart';
import 'nevagtor_sccreen.dart';

class CatalogueScrren extends StatefulWidget {
  // Category category;
  // CatalogueScrren(this.category);

  @override
  State<CatalogueScrren> createState() => _CatalogueScrrenState();
}

class _CatalogueScrrenState extends State<CatalogueScrren> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Provider.of<ProviderAdmin>(context).categories == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: const Color.fromARGB(244, 244, 244, 244),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(175),
              child: Stack(
                children: [
                  Container(
                    // Background
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
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    // Background
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              AppRouter.navigateAndReplace(LayoutHome());
                            },
                            icon: const Icon(
                              Icons.arrow_back_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 95,
                          ),
                          const Text(
                            'Catalogue',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(), // Required some widget in between to float AppBar

                  Positioned(
                    // To take AppBar Size only
                    top: 145.0,
                    left: 20.0,
                    right: 20.0,
                    child: AppBar(
                      backgroundColor: Colors.white,
                      leading: const Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      primary: false,
                      title: TextField(
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "What are you looking for?",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey))),
                    ),
                  )
                ],
              ),
            ),
            body: Consumer<ProviderAdmin>(builder: (context, provider, x) {
              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('categories')
                    .snapshots(),
                builder: (context, snapshots) {
                  return provider.categories == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ScreenUtilInit(
                          builder: (BuildContext context, Widget? child) {
                            return ListView.builder(
                                itemCount: snapshots.data!.docs.length,
                                itemBuilder: (context, index) {
                                  var data = snapshots.data!.docs[index].data()
                                      as Map<String, dynamic>;

                                  if (name.isEmpty) {
                                    return InkWell(
                                      onTap: () {
                                        Category category =
                                            provider.categories![index];
                                        Provider.of<ProviderAdmin>(context,
                                                listen: false)
                                            .getAllProduct(category.id!);
                                        AppRouter.navigateToScreen(
                                            InfoCatalogues(category.id!));
                                      },
                                      child: ListTile(
                                        title: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          width: 378.w,
                                          height: 98.r,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(
                                                  provider
                                                      .categories![index].name!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                width: 98.w,
                                                height: 98.h,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Image.network(
                                                  provider.categories![index]
                                                      .image!,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  if (provider.categories![index].name!
                                      .toString()
                                      .toLowerCase()
                                      .startsWith(name.toLowerCase())) {
                                    return ListTile(
                                      title: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        width: 378.w,
                                        height: 98.r,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                provider
                                                    .categories![index].name!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              width: 98.w,
                                              height: 98.r,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Image.network(
                                                provider
                                                    .categories![index].image!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  return Container();
                                });
                          },
                        );
                },
              );
            }),
            bottomNavigationBar: const NivgBotScreen(),
          );
  }
}
