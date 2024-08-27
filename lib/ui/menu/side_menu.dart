import 'package:flutter/material.dart';
import 'package:fluttersidebar/ui/menu/info_card.dart';
import 'package:fluttersidebar/ui/menu/menu_model.dart';


class SideMenu extends StatefulWidget {
  final Function(Widget) onMenuSelected;

  const SideMenu({super.key, required this.onMenuSelected});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Menu? activeMenu;
  @override


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 24),
              child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text:'fluttersidebar',
                          style: const TextStyle(color:Colors.white, fontSize: 16, fontWeight:FontWeight.w200),),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(5, -10), // Posiciona o número elevado
                              child: Text(
                                '0.1',
                                 // Escala o tamanho do número elevado
                                style: const TextStyle(color: Colors.white,fontSize: 10, fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                      ]),
                    ),
            ),
            InfoCard(name: 'Icaro B.', user: 'github.com/bragancaicaro',),
            
            const Padding(padding: EdgeInsets.only(left: 24), child: Divider(height: 1, color: Colors.white24,)),

            ...menus1.map((menu) => _buildMenuItem(menu)),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24, bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Menu'.toUpperCase(),
                  style: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w100),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Divider(height: 1, color: Colors.white24),
            ),
            ...menus2.map((menu) => _buildMenuItem(menu)),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24, bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Settings'.toUpperCase(),
                  style: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w100),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Divider(height: 1, color: Colors.white24),
            ),
            ...menus3.map((menu) => _buildMenuItem(menu)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(Menu menu) {
    bool isActive = activeMenu == menu;

    return Stack(
      children: [
        if (isActive)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            height: 56,
            width: 260,
            child: Container(
              margin: const EdgeInsets.only(bottom: 1),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ListTile(
          onTap: () {
            setState(() {
              activeMenu = menu;
            });
            widget.onMenuSelected(menu.page);
          },
          leading: SizedBox(
            width: 34,
            height: 34,
            child: menu.iconMenu,
          ),
          title: Text(
            menu.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}