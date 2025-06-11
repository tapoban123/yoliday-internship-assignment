import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
      body: TabBar(
        controller: _tabController,
        tabs: [Text("Project"), Text("Saved")],
      ),
    );
  }
}
