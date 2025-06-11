import 'package:assignment_app/custom_colors.dart';
import 'package:assignment_app/screens/achievement_screen.dart';
import 'package:assignment_app/screens/projects_screen.dart';
import 'package:assignment_app/screens/saved_screen.dart';
import 'package:assignment_app/screens/shared_screen.dart';
import 'package:assignment_app/providers/tab_provider.dart';
import 'package:assignment_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = ["Project", "Saved", "Shared", "Achievement"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Portfolio", style: TextStyle(fontWeight: FontWeight.w500)),
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
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Consumer<TabProvider>(
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
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
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
      ),
    );
  }
}
