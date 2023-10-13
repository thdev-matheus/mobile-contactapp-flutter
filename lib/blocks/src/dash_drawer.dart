import 'dart:io';

import 'package:contact_app/models/models.dart';
import 'package:contact_app/repositories/repositories.dart';
import 'package:flutter/material.dart';

import 'package:contact_app/styles/global_styles.dart';
import 'package:contact_app/components/components.dart';
import 'package:contact_app/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class DashDrawer extends StatefulWidget {
  const DashDrawer({super.key, required this.children});

  final List<ItemDashDrawer> children;

  @override
  State<DashDrawer> createState() => _DashDrawerState();
}

class _DashDrawerState extends State<DashDrawer> {
  UserRepository userRepository = UserRepository();
  bool imageExists = false;

  void onMessageAction(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );

  Future<void> changeImage(ImageSource source) async {
    Navigator.pop(context);

    CroppedFile? file = await pickImage(source);

    if (file != null) {
      await userRepository.changeAvatar(imagePath: file.path);
      await loadData();
      setState(() {});
    }
  }

  Future<bool> verifyImage() async => await File(UserModel.imagePath!).exists();

  Future<void> loadData() async {
    imageExists = await verifyImage();
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: primary,
            ),
            currentAccountPicture: InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => Wrap(
                        children: [
                          ListTile(
                            onTap: () => changeImage(ImageSource.gallery),
                            leading: const FaIcon(
                              FontAwesomeIcons.image,
                              size: 25,
                              color: black,
                            ),
                            title: Text(
                              'Galeria',
                              style: primaryTextStyle(
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                          separator(height: 16),
                          ListTile(
                            onTap: () => changeImage(ImageSource.camera),
                            leading: const FaIcon(
                              FontAwesomeIcons.cameraRetro,
                              size: 25,
                              color: black,
                            ),
                            title: Text(
                              'Camera',
                              style: primaryTextStyle(
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )),
              child: CircleAvatar(
                backgroundColor: secondary,
                child: imageExists
                    ? ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.file(
                          File(
                            UserModel.imagePath!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Text(
                        UserModel.username![0],
                        style: primaryTextStyle(
                          color: white,
                          size: 30,
                        ),
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
