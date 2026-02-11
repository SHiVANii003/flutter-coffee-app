import 'package:flutter/material.dart';

class FloatingIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const FloatingIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(icon, size: 20, color: Colors.black),
        onPressed: onTap,
      ),
    );
  }
}
