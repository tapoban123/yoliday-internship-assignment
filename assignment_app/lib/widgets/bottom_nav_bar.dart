import 'package:assignment_app/custom_colors.dart';
import 'package:assignment_app/providers/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Map<String, String>> icons = [
    {"name": "Home", "image": "assets/images/Home svg.svg"},
    {"name": "Portfolio", "image": "assets/images/Portfolia svg.svg"},
    {"name": "Input", "image": "assets/images/Input svg.svg"},
    {"name": "Profile", "image": "assets/images/Profile svg.svg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.r,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20).r,
          topRight: Radius.circular(20).r,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 3)],
      ),
      child: Consumer<BottomNavProvider>(
        builder:
            (context, bottomNavProvider, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                icons.length,
                (index) => GestureDetector(
                  onTap: () {
                    bottomNavProvider.changeOption(index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24.r,
                        height: 2.r,
                        color:
                            bottomNavProvider.selectedOption == index
                                ? CustomColors.deepOrangeColor
                                : Theme.of(context).scaffoldBackgroundColor,
                      ),
                      5.verticalSpace,
                      SvgPicture.asset(
                        icons[index]["image"]!,
                        colorFilter: ColorFilter.mode(
                          bottomNavProvider.selectedOption == index
                              ? CustomColors.deepOrangeColor
                              : CustomColors.greyColor,
                          BlendMode.srcIn,
                        ),
                        height:
                            bottomNavProvider.selectedOption == index ? 24.r : 20.r,
                      ),
                      Text(
                        icons[index]["name"]!,
                        style: TextStyle(
                          color:
                              bottomNavProvider.selectedOption == index
                                  ? CustomColors.deepOrangeColor
                                  : CustomColors.textGreyColor,
                          fontSize:
                              bottomNavProvider.selectedOption == index
                                  ? 12.r
                                  : 12.r,
                        ),
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
