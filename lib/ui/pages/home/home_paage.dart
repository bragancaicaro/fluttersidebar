import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(child: Text(title, style: TextStyle(fontSize: 22, color:Theme.of(context).primaryColor),),),
    );
  }
}