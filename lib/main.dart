import 'package:flutter/material.dart';
import 'package:fluttersidebar/ui/entry_point/entry_point.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'fluttersidebar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          primaryColor: const Color.fromRGBO(2, 48, 71, 1),
          fontFamily: 'Noto',
          colorScheme: const ColorScheme.light(
            primary: Color.fromRGBO(2, 48, 71, 1),
            secondary: Color.fromRGBO(251, 133, 0, 1),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
          ),
          useMaterial3: true,
        ),
        
        home: const EntryPoint(),
      );
}
}