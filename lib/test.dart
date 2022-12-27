import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Image.network(
            'https://i.pinimg.com/originals/bb/34/28/bb3428ce57de5595886142d500a2faf4.jpg',
            fit: BoxFit.cover,
            width: 163,
            height: 136,
          ),
          Container(), // Required some widget in between to float AppBar

          Positioned(
              top: 110,
              left: 120,
              child: IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.green[200],
                    child: const Icon(
                      Icons.favorite_outline,
                      size: 15,
                      color: Colors.white,
                    ),
                  ))),
        ],
      ),
      // body: Container(
      //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Text('data'),
      //         GridView.builder(
      //           shrinkWrap: true,
      //           physics: NeverScrollableScrollPhysics(),
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisExtent: 280,
      //               crossAxisSpacing: 2,
      //               mainAxisSpacing: 2),
      //           itemCount: 10,
      //           itemBuilder: (context, index) => Column(children: [
      //             Container(
      //               height: 200,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey,
      //                 borderRadius: BorderRadius.circular(15),
      //               ),
      //             ),
      //             Text('data'),
      //             Text('data'),
      //             Text('data'),
      //           ]),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
