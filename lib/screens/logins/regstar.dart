import 'package:final_project/ap_router/app_router.dart';
import 'package:final_project/providers/auth_provider.dart';

import 'package:final_project/screens/logins/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegstarScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return SingleChildScrollView(
          child: ScreenUtilInit(
            builder: (context, child) {
              return Form(
                key: formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 375.w,
                        height: 197.r,
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
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(200))),
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 80),
                            child: const Text(
                              'welcome TO MyShop \n Rigstar New',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Rigstar ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 86, 2, 164),
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'User firstName must be empty';
                            }
                            return null;
                          },
                          controller: provider.regsterfnameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your firstName',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User last Name must be empty';
                            }
                            return null;
                          },
                          controller: provider.regsterlnameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your last Name',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User phone must be empty';
                            }
                            return null;
                          },
                          controller: provider.regsterphoneController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your phone number',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User Email must be empty';
                            }
                            return null;
                          },
                          controller: provider.regsterEmailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your Email',
                          ),
                        ),
                      ),
                      // CustomText(provider.regsterEmailController, 'Email'),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User PassWord must be empty';
                            }
                            return null;
                          },
                          controller: provider.regsterPassWordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your PassWord',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User location must be empty';
                            }
                            return null;
                          },
                          controller: provider.profileControllerlocation,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your location',
                          ),
                        ),
                      ),

                      //  CustomText(provider.regsterPassWordController, 'PassWord'),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            bool isvalid = formkey.currentState!.validate();
                            if (isvalid) {
                              provider.register();
                            }
                          },
                          child: Container(
                            height: 68.r,
                            width: 300.w,
                            decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                                child: Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Do you have account?'),
                          TextButton(
                            child: const Text(
                              'Login Now',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 86, 2, 164),
                              ),
                            ),
                            onPressed: () {
                              //signup screen
                              AppRouter.navigateAndReplace(LoginScreen());
                            },
                          )
                        ],
                      )
                    ]),
              );
            },
          ),
        );
      }),
    );
  }
}
