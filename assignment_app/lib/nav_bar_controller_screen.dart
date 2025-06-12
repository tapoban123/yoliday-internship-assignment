import 'package:assignment_app/providers/bottom_nav_provider.dart';
import 'package:assignment_app/screens/home_screen.dart';
import 'package:assignment_app/screens/input_screen.dart';
import 'package:assignment_app/screens/portfolio_screen.dart';
import 'package:assignment_app/screens/profile_screen.dart';
import 'package:assignment_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NavBarControllerScreen extends StatefulWidget {
  const NavBarControllerScreen({super.key});

  @override
  State<NavBarControllerScreen> createState() => _NavBarControllerScreenState();
}

class _NavBarControllerScreenState extends State<NavBarControllerScreen> {
  PreferredSizeWidget screenAppbar() {
    final int screen = Provider.of<BottomNavProvider>(context).selectedOption;
    if (screen == 0) {
      return AppBar(
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.r),
        ),
      );
    } else if (screen == 1) {
      return AppBar(
        title: Text(
          "Portfolio",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.r),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/bag.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/bell.svg"),
          ),
        ],
      );
    } else if (screen == 3) {
      return AppBar(
        title: Text(
          "Input",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.r),
        ),
      );
    } else {
      return AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.r),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppbar(),
      bottomNavigationBar: BottomNavBar(),
      body: Consumer<BottomNavProvider>(
        builder:
            (context, bottomNavProvider, child) => IndexedStack(
              index: bottomNavProvider.selectedOption,
              children: [
                HomeScreen(),
                PortfolioScreen(),
                InputScreen(),
                ProfileScreen(),
              ],
            ),
      ),
    );
  }
}
