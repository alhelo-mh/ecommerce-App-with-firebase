import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/screens/catalogue_screen.dart';
import 'package:final_project/screens/moduls/catalogue_screen/infoCatalogues/info_catalogue.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../data/post_model.dart';

class CatalogueHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderAdmin>(builder: (context, provider, x) {
      return provider.categories == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Text(
                    'Catalogue',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      AppRouter.navigateAndReplace(CatalogueScrren());
                    },
                    child: const Text(
                      'See All >',
                      style: TextStyle(
                          color: Color.fromARGB(101, 0, 0, 0),
                          fontSize: 12,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),

                Container(
                  height: 88.h,
                  child: ListView.separated(
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          builderCataloue(provider.categories![index]),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: provider.categories!.length),
                )
                //builderCataloue(),
              ],
            );
    });
  }

  Widget builderCataloue(Category postmodel) {
    return postmodel.image == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return InkWell(
                onTap: () {
                  Provider.of<ProviderAdmin>(context, listen: false)
                      .getAllProduct(postmodel.id!);
                  //   AppRouter.navigateToScreen(InfoCatalogues(postmodel.id!));
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 88.r,
                      height: 88.r,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              '${postmodel.image}',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Container(
                      width: 88.r,
                      height: 88.r,
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
                    Text(
                      '${postmodel.name}',
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              );
            },
          );
  }
}
