import 'package:ecommerce/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  void Function(int index) onTap;
  int selectedIndex;

  CustomBottomNavigationBar({required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
      child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  foregroundColor:
                      selectedIndex == 0 ? MyTheme.primaryBlue : Colors.white,
                  backgroundColor:
                      selectedIndex == 0 ? Colors.white : Colors.transparent,
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/home.png",
                    ),
                    size: 20,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  foregroundColor:
                  selectedIndex == 1? MyTheme.primaryBlue : Colors.white,
                  backgroundColor:
                  selectedIndex == 1 ? Colors.white : Colors.transparent,
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/shoppingCart.png",
                    ),
                    size: 20,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(

              icon: CircleAvatar(
                foregroundColor:
                selectedIndex == 2 ? MyTheme.primaryBlue : Colors.white,
                backgroundColor:
                selectedIndex == 2 ? Colors.white : Colors.transparent,
                child: ImageIcon(
                  AssetImage(
                    "assets/images/heart.png",
                  ),
                  size: 50,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  foregroundColor: selectedIndex==3?MyTheme.primaryBlue:Colors.white,
                  backgroundColor: selectedIndex==3?Colors.white:Colors.transparent,
                  child: ImageIcon(
                    AssetImage(
                      "assets/images/person.png",
                    ),
                    size: 40,
                  ),
                ),
                label: ""),
          ]),
    );
  }
}
