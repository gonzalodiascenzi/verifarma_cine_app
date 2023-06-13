import 'package:flutter/material.dart';


class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon( Icons.home_max ),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.favorite_outline),
          label: 'Favoritos'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.person_3_outlined),
          label: 'Perfil'
        ),
      ]
    );
  }
}