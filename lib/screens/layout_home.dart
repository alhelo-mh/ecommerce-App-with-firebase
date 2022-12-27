import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/screens/moduls/home_screen/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'moduls/home_screen/app_bar_home.dart';
import 'moduls/home_screen/catalogue_home.dart';
import 'moduls/home_screen/featured_home.dart';
import 'nevagtor_sccreen.dart';

class LayoutHome extends StatefulWidget {
  @override
  State<LayoutHome> createState() => _LayoutHomeState();
}

class _LayoutHomeState extends State<LayoutHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 244, 244, 244),
      appBar: AppBarHome(),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderScreen(),
              const SizedBox(
                height: 25,
              ),
              CatalogueHome(),
              const SizedBox(
                height: 25,
              ),
              FeaturedHome(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NivgBotScreen(),
    );
  }
}
