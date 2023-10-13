import 'package:contact_app/blocks/blocks.dart';
import 'package:contact_app/components/components.dart';
import 'package:contact_app/components/src/contact_card.dart';
import 'package:contact_app/repositories/repositories.dart';
import 'package:contact_app/styles/global_styles.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class MyContactsView extends StatefulWidget {
  const MyContactsView({super.key});

  @override
  State<MyContactsView> createState() => _MyContactsViewState();
}

class _MyContactsViewState extends State<MyContactsView> {
  UserRepository userRepository = UserRepository();
  ContactRepository contactRepository = ContactRepository();

  bool isLoading = false;

  void removeContact({required String id}) {
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return RemoveContactModal(
          actionRemove: () async {
            await contactRepository.deleteContact(id).then((_) {
              setState(() {});
              Navigator.pop(context);
            });
          },
        );
      },
    );
  }

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });

    await contactRepository.getContacts();

    UserContactsModel.contacts.sort(
      (a, b) => a.name.toString().compareTo(
            b.name.toString(),
          ),
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : UserContactsModel.contacts.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não há contatos salvos!',
                      style: primaryTextStyle(
                        size: 22,
                        weight: FontWeight.bold,
                      ),
                    ),
                    separator(height: 16),
                    Text(
                      'Salve novos endereços para que eles apareçam aqui',
                      textAlign: TextAlign.center,
                      style: primaryTextStyle(size: 16),
                    )
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: UserContactsModel.contacts.length,
                itemBuilder: (_, index) => ContactCard(
                  contact: UserContactsModel.contacts[index],
                  removeContact: removeContact,
                ),
              );
  }
}
