import 'dart:io';

import 'package:contact_app/styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/models/models.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({
    super.key,
    required this.contact,
    required this.removeContact,
  });

  final ContactModel contact;
  final void Function({required String id}) removeContact;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  double offsetX = 0.0;
  bool imageExists = false;

  Future<bool> verifyImage() async =>
      await File(widget.contact.imagePath).exists();

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
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          offsetX += details.delta.dx;
        });
      },
      onHorizontalDragEnd: (_) {
        if (offsetX <= -275) {
          widget.removeContact(id: widget.contact.objectId);
        }
        setState(() {
          offsetX = 0;
        });
      },
      child: Transform.translate(
        offset: Offset(offsetX, 0),
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      maxRadius: 70,
                      minRadius: 55,
                      backgroundColor: secondary,
                      child: imageExists
                          ? ClipOval(
                              clipBehavior: Clip.antiAlias,
                              child: Image.file(
                                File(
                                  widget.contact.imagePath,
                                ),
                                fit: BoxFit.cover,
                              ),
                            )
                          : Text(
                              widget.contact.name[0],
                              style: primaryTextStyle(
                                color: white,
                                size: 35,
                              ),
                            ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          widget.contact.name,
                          // maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle(
                            size: 22,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        widget.contact.number,
                        style: primaryTextStyle(
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
