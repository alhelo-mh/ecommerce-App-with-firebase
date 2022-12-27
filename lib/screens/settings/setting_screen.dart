
import 'package:final_project/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';



class SettingScreenProfile extends StatelessWidget {
  const SettingScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, porvider, x) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            toolbarHeight: 70.h,
            title: Text('UpDate Profile',
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold)),
            flexibleSpace: Container(
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
            ),
          ),
          backgroundColor: const Color.fromARGB(244, 244, 244, 244),
          body: porvider.loggedAppUser == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ScreenUtilInit(
                  builder: (BuildContext context, Widget? child) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Center(
                            child: InkWell(
                              onTap: () {
                                porvider.updataImage();
                              },
                              child: Container(
                                width: 150.h,
                                height: 150.w,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      porvider.loggedAppUser!.imageUrl == null
                                          ? const NetworkImage(
                                              'https://cdn-icons-png.flaticon.com/512/196/196745.png',
                                            )
                                          : NetworkImage(
                                              porvider.loggedAppUser!.imageUrl!,
                                            ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          buildContainer(
                            'Your farst Name : ',
                            '${porvider.loggedAppUser!.fname!} ',
                            porvider.profileControllerfName,
                          ),
                          buildContainer(
                            'Your last Name : ',
                            ' ${porvider.loggedAppUser!.lname!}',
                            porvider.profileControllerlName,
                          ),
                          buildContainer(
                              'Your Email : ',
                              porvider.loggedAppUser!.email!,
                              porvider.profileControllerEmail),
                          buildContainer(
                              'Your PhoneNumber : ',
                              porvider.loggedAppUser!.phoneNumber!,
                              porvider.profileControllerphone),
                          buildContainer(
                              'Your location : ',
                              porvider.loggedAppUser!.location == null
                                  ? 'Not add location'
                                  : porvider.loggedAppUser!.location!,
                              porvider.profileControllerlocation),
                        ],
                      ),
                    );
                  },
                ),
          bottomSheet: Container(
            color: const Color.fromARGB(244, 244, 244, 244),
            child: Container(
              width: 375.w,
              height: 70.r,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 263.w,
                      height: 48.h,
                      child: ElevatedButton(
                          onPressed: () {
                            porvider.UpdateUserInfo();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                          ),
                          child: const Text(
                            'Update Profile',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}

Widget buildContainer(
    String lable, String x, TextEditingController controller) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: 370.w,
      height: 60.h,
      child: Row(
        children: [
          Text(
            lable,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey)),
                controller: controller,
                style: TextStyle(
                  fontSize: 14.sp,
                )),
          ),
        ],
      ));
}
