import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/admin/views/add_new_products.dart';
import 'package:final_project/ap_router/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../screens/catalogue_screen.dart';

class AddNewCategorys extends StatelessWidget {
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 88,
          title: const Text('Add Category '),
          centerTitle: true,
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
          leading: IconButton(
              onPressed: () {
                //AppRouter.navigateAndReplace(CatalogueScrren());
              },
              icon: Icon(Icons.arrow_back))),
      body: Consumer<ProviderAdmin>(builder: (context, porvider, child) {
        return ScreenUtilInit(
          builder: (BuildContext context, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: globalKey,
                child: Column(
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          porvider.pickCategoryImage();
                        },
                        child: Container(
                          width: 150.h,
                          height: 150.w,
                          //  porvider.pickedImage==null ? '' :
                          //    FileImage(
                          //     porvider.pickedImage!,
                          child: porvider.pickedImage == null
                              ? Container(
                                  width: 150.h,
                                  height: 150.w,
                                  color: Colors.grey,
                                  child: Icon(Icons.camera),
                                )
                              : Image.file(porvider.pickedImage!),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      width: 370.w,
                      height: 60.h,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            //border: InputBorder.none,
                            labelText: 'Add Category',
                            hintStyle: TextStyle(color: Colors.grey)),
                        controller: porvider.catContorllerName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'not voind';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          bool isvoid = globalKey.currentState!.validate();
                          if (isvoid) {
                            porvider.createnNewCategory();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        ),
                        child: const Text(
                          'Create New Category',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
