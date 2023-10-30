import 'package:flutter/material.dart';

/*
This class is for the options on the menu into the app, 
*/

class MenuItem {
  final String title;
  final String subTitle;
  // Link use for navigate by name
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
}

// Items for the app.
const appMenuItems = <MenuItem>[


  MenuItem(
    title: 'Riverpod Counter', 
    subTitle: 'Introduction a riverpod', 
    link: '/counter-river', 
    icon: Icons.add
  ),

  MenuItem(
    title: 'Buttons', 
    subTitle: 'Many buttons on Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Cards', 
    subTitle: 'A stylized container', 
    link: '/cards', 
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'Progress Indicators', 
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars and dialogues', 
    subTitle: 'On screen indicators', 
    link: '/snackbars', 
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated container', 
    subTitle: 'Stateful animated widget', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_rounded
  ),

  MenuItem(
    title: 'UI Controls + Tiles', 
    subTitle: 'A series of Flutter controls', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined
  ),

  MenuItem(
    title: 'Introduction to the application', 
    subTitle: 'Small introductory tutorial', 
    link: '/tutorial', 
    icon: Icons.accessible_rounded
  ),

  MenuItem(
    title: 'InfiniteScroll and Pull', 
    subTitle: 'Infinite lists and pull to refresh', 
    link: '/infinite', 
    icon: Icons.list_alt_rounded
  ),

  MenuItem(
    title: 'Change theme', 
    subTitle: 'Change app theme', 
    link: '/theme-changer', 
    icon: Icons.color_lens_outlined
  ),



];



