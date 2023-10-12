import 'dart:io';

import 'package:contact_app/models/models.dart';
import 'package:contact_app/repositories/repositories.dart';
import 'package:flutter/material.dart';

import 'package:contact_app/styles/global_styles.dart';
import 'package:contact_app/components/components.dart';
import 'package:contact_app/utils/utils.dart';

class DashDrawer extends StatefulWidget {
  const DashDrawer({super.key, required this.children});

  final List<ItemDashDrawer> children;

  @override
  State<DashDrawer> createState() => _DashDrawerState();
}

class _DashDrawerState extends State<DashDrawer> {
  UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: primary,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: secondary,
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.file(
                  File(
                    UserModel.imagePath!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            accountName: Text(
              UserModel.username!,
              style: primaryTextStyle(
                color: white,
                weight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              UserModel.objectId!,
              style: primaryTextStyle(
                color: white,
                size: 12,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ...widget.children,
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 25, right: 16, left: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 43,
                          child: TXTButton(
                            text: 'Sair',
                            textSize: 18,
                            action: () async {
                              await userRepository.logout().then((_) {
                                Navigator.pop(context);
                                navigator(context: context, to: '/login');
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
