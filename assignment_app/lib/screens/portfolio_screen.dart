import 'package:assignment_app/custom_colors.dart';
import 'package:assignment_app/providers/tab_provider.dart';
import 'package:assignment_app/screens/tab_screens/achievement_screen.dart';
import 'package:assignment_app/screens/tab_screens/projects_screen.dart';
import 'package:assignment_app/screens/tab_screens/saved_screen.dart';
import 'package:assignment_app/screens/tab_screens/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final List<String> tabs = ["Project", "Saved", "Shared", "Achievment"];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder:
          (context, tabProvider, child) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  tabs.length,
                  (index) => Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        tabProvider.changeTab(index);
                      },
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2.sp,
                              color:
                                  tabProvider.tabNumber == index
                                      ? CustomColors.deepOrangeColor
                                      : CustomColors.greyColor,
                            ),
                          ),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            fontSize: 14.sp,
                            color:
                                tabProvider.tabNumber == index
                                    ? CustomColors.deepOrangeColor
                                    : CustomColors.textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: tabProvider.tabNumber,
                  children: [
                    ProjectsScreen(),
                    SavedScreen(),
                    SharedScreen(),
                    AchievementScreen(),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}

