import 'package:contact_app/styles/global_styles.dart';
import 'package:flutter/material.dart';

class ItemDashDrawer extends StatelessWidget {
  const ItemDashDrawer({
    super.key,
    required this.icon,
    required this.title,
    required this.onAction,
    required this.selected,
  });

  final IconData icon;
  final String title;
  final void Function() onAction;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      iconColor: primary,
      textColor: primary,
      enabled: !selected,
      titleTextStyle: primaryTextStyle(
        weight: FontWeight.bold,
        size: 18,
      ),
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
      onTap: onAction,
    );
  }
}
