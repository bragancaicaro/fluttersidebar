import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.user,
  });
  final String name, user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,),
      ),
      title: Text(
        user,
        style: const TextStyle(color: Colors.white,)
      ),
      subtitle: Text(
        name,
        style: const TextStyle(color: Colors.white,)
      ),
      
    );
  }
}