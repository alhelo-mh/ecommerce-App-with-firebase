import 'package:final_project/admin/models/category.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/ap_router/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../screens/catalogue_screen.dart';

class AddNewProduct extends StatelessWidget {
  String catId;
  AddNewProduct(this.catId);
  GlobalKey<FormState> addglobalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 88,
        title: const Text('add Product Admin'),
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
      ),
      body: Consumer<ProviderAdmin>(builder: (context, porvider, child) {
        return InkWell(
          onTap: () {},
          child: ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: addglobalKey,
                  child: SingleChildScrollView(
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
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'productName',
                          ),
                          controller: porvider.productNameContoller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'not voind';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'description',
                          ),
                          controller: porvider.productdesContoller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'not voind';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'pric',
                          ),
                          controller: porvider.productpricContoller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'not voind';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: porvider.productdiscountContoller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'not voind';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'discount',
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              bool isvoid =
                                  addglobalKey.currentState!.validate();
                              if (isvoid) {
                                porvider.addNewProduct(catId);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                            ),
                            child: const Text(
                              'AddProduct',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
