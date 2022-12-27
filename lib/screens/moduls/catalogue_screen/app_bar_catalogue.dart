import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/screens/layout_home.dart';
import 'package:flutter/material.dart';

class AppBarCatalogue extends StatelessWidget with PreferredSizeWidget {
  final controller = PageController(viewportFraction: 0.5, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            title: const TextField(
                decoration: InputDecoration(
                    hintText: "What are you looking for?",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey))),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(175);
}
