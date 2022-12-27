import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/providers/auth_provider.dart';
import 'package:final_project/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppBarHome extends StatelessWidget with PreferredSizeWidget {
  final controller = PageController(viewportFraction: 0.5, keepPage: true);
  TextEditingController controllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return ScreenUtilInit(
          builder: (BuildContext context, Widget? child) {
            return Container(
              // Background

              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
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
              height: 110.h,
              width: MediaQuery.of(context).size.width,
              // Background
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/home.png',
                      height: 30.h,
                      width: 30.w,
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(
                      'MY',
                      style: TextStyle(color: Colors.amber, fontSize: 18.sp),
                    ),
                    Text(
                      'Shop',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          AppRouter.navigateToScreen(SearchScreen());
                        },
                        icon: Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                          size: 30,
                        ))
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
