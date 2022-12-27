import 'package:flutter/material.dart';

class NivgBotScreen extends StatefulWidget {
  
  const NivgBotScreen({super.key});

  @override
  State<NivgBotScreen> createState() => _NivgBotScreenState();
}

class _NivgBotScreenState extends State<NivgBotScreen> {
  int index = 0;
  String content = 'Home Page';
 

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (i) {
        index = i;
        
        if (i == 0) {
          Navigator.pushNamed(context, 'Home');
        } else if (i == 1) {
          Navigator.pushNamed(context, 'Catalogue');
        } else if (i == 2) {
          Navigator.pushNamed(context, 'Favorite');
        } else {
          Navigator.pushNamed(context, 'Profile');
        }
        setState(() {});
      },
      elevation: 0.0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color.fromRGBO(155, 155, 155, 100),
              size: 26,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              color: Color.fromRGBO(155, 155, 155, 100),
              size: 26,
            ),
            label: 'Catalogue'),
        BottomNavigationBarItem(
            icon: Icon(
              
              Icons.favorite_border,
              color: Color.fromRGBO(155, 155, 155, 100),
              size: 26,
            ),
            label: 'Favorite'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.supervisor_account_outlined,
              color: Color.fromRGBO(155, 155, 155, 100),
              size: 26,
            ),
            label: 'Profile'),

      ],
    );
  }
}
