import 'package:final_project/admin/models/product.dart';
import 'package:final_project/admin/provider/provider_admin.dart';
import 'package:final_project/ap_router/app_router.dart';

import 'package:final_project/providers/auth_provider.dart';

import 'package:final_project/screens/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatelessWidget {
  Product product;
  CheckOutScreen(this.product);
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(244, 244, 244, 244),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          toolbarHeight: 70.h,
          title: Text('Check Out',
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold)),
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
        body: ScreenUtilInit(
          builder: (context, child) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          size: 30,
                          color: Color.fromARGB(255, 132, 95, 161),
                        ),
                        Text(
                          'Shipping Address',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: 343.w,
                    height: 92.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${provider.loggedAppUser!.fname!} ${provider.loggedAppUser!.lname!}',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 20,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(provider.loggedAppUser!.location ?? '',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300)),
                          Text(provider.loggedAppUser!.location ?? '',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.directions_bus_outlined,
                          size: 30,
                          color: Color.fromARGB(255, 132, 95, 161),
                        ),
                        Text(
                          'Delivery Method',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 103.w,
                        height: 92.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://selectcobb.com/wp-content/uploads/2020/10/DHL.png',
                                width: 71.w,
                                height: 16.h,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              const Text('\$15'),
                              const Text('1-2 days',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 103.w,
                        height: 92.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://www.fedex.com/content/dam/fedex-com/logos/FedEx-Logo.png',
                                width: 71.w,
                                height: 16.h,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              const Text('\$18'),
                              const Text('1-2 days',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 103.w,
                        height: 92.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://www.sunrisehitek.com/files/subscribers/2cb5479e-fea2-46c6-bb3f-58c999ab32f6/webfiles/USPS_EDDM_Chicago.png',
                                width: 71.w,
                                height: 16.h,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              const Text('\$20'),
                              const Text('1-2 days',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        bottomSheet: Container(
          color: const Color.fromARGB(244, 244, 244, 244),
          child: Container(
            width: 375.w,
            height: 202.r,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'items',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        Provider.of<ProviderAdmin>(context, listen: false)
                            .sumTotalPrice(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Delivery',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '\$15',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Total price',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        Provider.of<ProviderAdmin>(context, listen: false)
                            .sumTotalOrder(),
                        //+double.parse('15').toString(),
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 343.w,
                    height: 48.h,
                    child: ElevatedButton(
                        onPressed: () {
                          AppRouter.navigateAndReplace(OrderScreen(product));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        ),
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
