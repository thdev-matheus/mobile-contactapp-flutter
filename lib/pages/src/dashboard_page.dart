import 'package:flutter/material.dart';
import 'package:contact_app/styles/global_styles.dart';

import 'package:contact_app/components/components.dart';
import 'package:contact_app/blocks/blocks.dart';

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
          title: const Text(/* UserModel.username! */ 'Theus'),
          backgroundColor: primary,
        ),
        drawer: DashDrawer(
          children: [
            ItemDashDrawer(
              icon: Icons.list_alt_rounded,
              title: 'Página 1',
              selected: page == 0,
              onAction: () {
                Navigator.pop(context);
                navigateToPage(0);
              },
            ),
            ItemDashDrawer(
              icon: Icons.map_outlined,
              title: 'Página 2',
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
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
