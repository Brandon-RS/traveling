import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests/providers/btn_active.dart';
import 'package:tests/screens/detail_screen.dart';
import 'package:tests/screens/main_screen.dart';
import 'package:tests/widgets/button_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var page = Provider.of<BtnHelper>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFeff0e9),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: currentScreen(page.currentPage),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget currentScreen(int page) {
    List screens = [
      const MainScreen(),
      const DetailScreen(),
      const MainScreen(),
      const DetailScreen(),
      const MainScreen(),
    ];

    return screens[page];
  }
}
