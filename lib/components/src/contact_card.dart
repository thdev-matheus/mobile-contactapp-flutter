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
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: secondary,
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.file(
                          File(
                            widget.contact.imagePath,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CEP: ${widget.contact.name}',
                        style: primaryTextStyle(
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.contact.number,
                        style: primaryTextStyle(
                          size: 16,
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
