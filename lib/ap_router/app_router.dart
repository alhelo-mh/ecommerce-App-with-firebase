import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navkey = GlobalKey();
  static showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      content:  Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7), child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: navkey.currentContext!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static hideLoadingDialoug() {
    navkey.currentState!.pop();
  }

  static showCustomDiaoug(String content) {
    showDialog(
      context: navkey.currentContext!,
      builder: (context) {
        return AlertDialog(
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  navkey.currentState!.pop();
                },
                child: const Text('Ok'))
          ],
        );
      },
    );
  }

  static navigateToScreen(Widget widget) {
    navkey.currentState!.push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }

  static navigateAndReplace(Widget widget) {
    navkey.currentState!.pushReplacement(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }
}
