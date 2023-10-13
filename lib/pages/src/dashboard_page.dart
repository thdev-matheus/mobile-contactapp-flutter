import 'package:contact_app/models/models.dart';
import 'package:contact_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/styles/global_styles.dart';

import 'package:contact_app/components/components.dart';
import 'package:contact_app/blocks/blocks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int page = 0;
  final _pageController = PageController(initialPage: 0);

  void navigateToPage(int pageIndex) {
    _pageController.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {
      page = pageIndex;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(UserModel.username!),
          backgroundColor: primary,
        ),
        drawer: DashDrawer(
          children: [
            ItemDashDrawer(
              icon: FontAwesomeIcons.userPlus,
              title: 'Adicionar Contato',
              selected: page == 0,
              onAction: () {
                Navigator.pop(context);
                navigateToPage(0);
              },
            ),
            ItemDashDrawer(
              icon: FontAwesomeIcons.addressBook,
              title: 'Meus Contatos',
              selected: page == 1,
              onAction: () {
                Navigator.pop(context);
                navigateToPage(1);
              },
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (pageNumber) {
            setState(() {
              page = pageNumber;
            });
          },
          children: [
            AddContactView(animateToPage: () => navigateToPage(1)),
            const MyContactsView(),
          ],
        ),
      ),
    );
  }
}
