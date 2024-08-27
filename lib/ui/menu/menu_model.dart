

import 'package:flutter/material.dart';
import 'package:fluttersidebar/ui/pages/home/home_paage.dart';
class Menu{

  final String title;
  final Icon iconMenu;
  final Widget page;
  final VoidCallback onTap;
  bool isActive;

  Menu({required this.page, required this.title, required this.onTap, required this.iconMenu, required this.isActive});
  
}



  List menus1 = [
    Menu(title:'Home', onTap: () {}, page: HomePage(title:"Home"), iconMenu: const Icon(Icons.home_outlined, color: Colors.white24,), isActive: true),
    Menu(title: 'Menu 2', onTap: () {}, page: HomePage(title:"Home 2"), iconMenu: const Icon(Icons.edit_outlined, color: Colors.white24), isActive: false),
    Menu(title: 'Menu 3', onTap: () {}, page: HomePage(title:'Home 3'), iconMenu: const Icon(Icons.assignment_outlined, color: Colors.white24), isActive: false),
    Menu(title: 'Menu 4', onTap: () {}, page: HomePage(title:'Home 4'), iconMenu: const Icon(Icons.history_outlined, color: Colors.white24), isActive: false),
    Menu(title: 'Menu 5', onTap: () {}, page: HomePage(title:'Home 4'), iconMenu: const Icon(Icons.history_outlined, color: Colors.white24), isActive: false),
  ];

  List menus2 = [
      Menu(title:'Menu 2/1', onTap: () {}, page: HomePage(title:'Menu 2/1'), iconMenu: const Icon(Icons.storage_outlined, color: Colors.white24), isActive: false),
      Menu(title:'Menu 2/2' , onTap: () {}, page:  HomePage(title:'Menu 2/2'), iconMenu: const Icon(Icons.summarize_outlined, color: Colors.white24), isActive: false),
      Menu(title: 'Menu 2/3', onTap: () {}, page:  HomePage(title:'Menu 2/3'), iconMenu: const Icon(Icons.store_outlined, color: Colors.white24), isActive: false),
      Menu(title:'Menu 2/4' , onTap: () {}, page:  HomePage(title:'Menu 2/4'), iconMenu: const Icon(Icons.attach_money_outlined, color: Colors.white24), isActive: false),
    ];

   List menus3 = [
      Menu(title:'Settings', onTap: () {}, page:  HomePage(title:'Settings'), iconMenu: const Icon(Icons.settings_outlined, color: Colors.white24), isActive: false),
      Menu(title:'Help', onTap: () {}, page:  HomePage(title:'Help'), iconMenu: const Icon(Icons.help_outline, color: Colors.white24), isActive: false)
    ];