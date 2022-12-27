import 'package:final_project/providers/auth_provider.dart';
import 'package:final_project/screens/layout_home.dart';
import 'package:final_project/screens/logins/regstar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return SingleChildScrollView(
          child: ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
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
                              'welcome TO MyShop \n login New',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Sign In ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 86, 2, 164),
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email must be empty';
                            }
                            return null;
                          },
                          controller: provider.loginEmailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password must be empty';
                            }
                            return null;
                          },
                          obscureText: true,
                          controller: provider.loginPassWordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Color.fromARGB(255, 86, 2, 164),
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            bool isvalid = formkey.currentState!.validate();
                            if (isvalid) {
                              provider.login();
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
                              'Login',
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
                          const Text('Does not have account?'),
                          TextButton(
                            child: const Text(
                              'Regstar',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 86, 2, 164),
                              ),
                            ),
                            onPressed: () {
                              //signup screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegstarScreen(),
                                  ));
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
