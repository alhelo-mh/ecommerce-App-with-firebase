import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/models/product.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/admin/views/add_new_category.dart';
import 'package:final_project/admin/views/display_all_categories.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/data/post_model.dart';

import 'package:final_project/providers/auth_provider.dart';
import 'package:final_project/screens/fav_like.dart';
import 'package:final_project/screens/nevagtor_sccreen.dart';
import 'package:final_project/screens/order/order_screen.dart';

import 'package:final_project/screens/profile/setting_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/cart_screen.dart';

import '../settings/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 244, 244, 244),
      body: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return value.loggedAppUser == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 166,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(220)),
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
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(value
                                                .loggedAppUser!.imageUrl ==
                                            null
                                        ? 'https://cdn-icons-png.flaticon.com/512/196/196745.png'
                                        : value.loggedAppUser!.imageUrl!),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${value.loggedAppUser!.fname!}  ${value.loggedAppUser!.lname!}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        value.loggedAppUser!.phoneNumber!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        value.loggedAppUser!.email!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        height: 76,
                        width: 375,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  AppRouter.navigateAndReplace(
                                      SettingProfile());
                                },
                                icon: const Icon(
                                  Icons.account_circle_outlined,
                                  size: 36,
                                  color: Color.fromARGB(255, 132, 95, 161),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Your Profile',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //  AppRouter.navigateAndReplace(CartScreen());

                          //1
                          AppUser appUser =
                              Provider.of<AuthProvider>(context, listen: false)
                                  .loggedAppUser!;

                          Product product =
                              Provider.of<ProviderAdmin>(context, listen: false)
                                  .products![0];
                          Provider.of<ProviderAdmin>(context, listen: false)
                              .getAllCartProduct(appUser);
                          AppRouter.navigateAndReplace(CartScreen(product));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          height: 76,
                          width: 375,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.line_weight_sharp,
                                  color: Color.fromARGB(255, 132, 95, 161),
                                  size: 36,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'cart',
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AppRouter.navigateAndReplace(OrderScreen(
                              Provider.of<ProviderAdmin>(context, listen: false)
                                  .products![1]));
                          // Category category =
                          //     Category(image: 'ssss', name: 'NNN');
                          // FirestoreHelper.firestoreHelper
                          //     .createNewCategory(category);
                          //  AppRouter.navigateAndReplace(OrderScreen());
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          height: 76,
                          width: 375,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Color.fromARGB(255, 132, 95, 161),
                                  size: 36,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Order',
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AppRouter.navigateAndReplace(LikedScreen());
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          height: 76,
                          width: 375,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite_border,
                                  size: 36,
                                  color: Color.fromARGB(255, 132, 95, 161),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Favorite',
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AppRouter.navigateAndReplace(
                              const SettingScreenProfile());
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          height: 76,
                          width: 375,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.settings,
                                  color: Color.fromARGB(255, 132, 95, 161),
                                  size: 36,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  ' Settings',
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        height: 76,
                        width: 375,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .signOut();
                                },
                                icon: const Icon(
                                  Icons.logout_outlined,
                                  size: 36,
                                  color: Color.fromARGB(255, 132, 95, 161),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Log Out',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                        ),
                      ),
                      //mohmed
                      if (Provider.of<AuthProvider>(context)
                              .loggedAppUser!
                              .isAdmin !=
                          false)
                        InkWell(
                          onTap: () {
                            AppRouter.navigateAndReplace(
                                const DisplayAllCategories());
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            height: 76,
                            width: 375,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.admin_panel_settings,
                                    color: Color.fromARGB(255, 132, 95, 161),
                                    size: 36,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    ' As Admin',
                                    style: TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
        },
      ),
      bottomNavigationBar: const NivgBotScreen(),
    );
  }
}
