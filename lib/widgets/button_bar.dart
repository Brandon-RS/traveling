import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests/providers/btn_active.dart';
import 'package:tests/providers/last_page.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 7),
      width: size.width * .85,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CustomButton(
            index: 0,
            icon: Icons.home,
          ),
          CustomButton(
            index: 1,
            icon: Icons.compass_calibration,
          ),
          CustomButton(
            index: 2,
            icon: Icons.add_to_photos_sharp,
          ),
          CustomButton(
            index: 3,
            icon: Icons.heart_broken,
          ),
          CustomButton(
            index: 4,
            icon: Icons.person,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.index,
    required this.icon,
    this.onTap,
  });

  final int index;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var page = Provider.of<BtnHelper>(context);

    return GestureDetector(
      onTap: () {
        page.currentPage = index;
        Preferences.lastPage = index;
        onTap;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: page.currentPage == index ? Colors.black : Colors.white,
        ),
        width: 48.0,
        height: 48.0,
        child: Icon(
          icon,
          color: page.currentPage != index ? Colors.black : Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
