import 'package:flutter/material.dart';

class MenuItemModel {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const MenuItemModel({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}
