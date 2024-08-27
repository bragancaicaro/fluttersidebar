import 'package:flutter/material.dart';
import 'package:fluttersidebar/ui/menu/menu_btn.dart';
import 'package:fluttersidebar/ui/menu/side_menu.dart';
import 'package:fluttersidebar/ui/pages/home/home_paage.dart';


class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;
  
  bool isSideMenuClosed = true;
  Widget activePage = const HomePage(title:"EntryPoint");

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200)
    )..addListener(() {
      setState(() {});
    });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)
    );
    
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeActivePage(Widget page) {
  setState(() {
    activePage = page;
    if (isSideMenuClosed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isSideMenuClosed = !isSideMenuClosed;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastLinearToSlowEaseIn,
            width: 275,
            left: isSideMenuClosed ? -275 : 0,
            height: MediaQuery.of(context).size.height,
            child: SideMenu(onMenuSelected: _changeActivePage),
          ),
          Transform.translate(
            offset: Offset(animation.value * 275, 0),
            child: Transform.scale(
              scale: scaleAnimation.value,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                child: activePage,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isSideMenuClosed ? 0 : 250,
            top: 16,
            child: MenuBtn(
              iconMenuBtn: isSideMenuClosed ? Icon(Icons.menu, color: Theme.of(context).primaryColor,) : Icon(Icons.close, color: Theme.of(context).primaryColor,),
              press: () {
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }

                setState(() {
                  isSideMenuClosed = !isSideMenuClosed;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}