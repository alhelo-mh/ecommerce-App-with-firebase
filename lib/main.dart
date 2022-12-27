import 'package:final_project/admin/provider/provider_admin.dart';

import 'package:final_project/providers/auth_provider.dart';

import 'package:final_project/screens/fav_like.dart';
import 'package:final_project/screens/logins/my_shop_walcam.dart';
import 'package:final_project/screens/profile/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ap_router/app_router.dart';
import 'data/post_model.dart';
import 'firebase_options.dart';
import 'screens/layout_home.dart';
import 'screens/catalogue_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLike = false;
 

  changeTheme() {
    isLike = !isLike;
    isLike ? Colors.accents : Colors.black;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       
        ChangeNotifierProvider<AuthProvider>(
          create: (context) {
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider<ProviderAdmin>(
          create: (context) {
            return ProviderAdmin();
          },
        )
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.navkey,
        debugShowCheckedModeBanner: false,
        routes: {
          'Home': (context) => LayoutHome(),
          'Catalogue': (context) => CatalogueScrren(),
          'Favorite': (context) => LikedScreen(),
          'Profile': (context) => ProfileScreen(),
        },
        home: MuShopStart(),
      ),
    );
  }
}
