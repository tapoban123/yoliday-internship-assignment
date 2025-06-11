import 'package:assignment_app/custom_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final List<String> projectImages = [
    "assets/images/Rectangle 19.png",
    "assets/images/Rectangle 19 (1).png",
    "assets/images/Rectangle 19 (2).png",
    "assets/images/Rectangle 19 (3).png",
    "assets/images/Rectangle 19 (4).png",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(top: 12),
      child: Column(
        children: [
          _SearchTextField(),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: projectImages.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: _ProjectTile(
                      title: "Kemampuan Merangkum Tulisan",
                      image: projectImages[index],
                      subtitle: "BAHASA SUNDA",
                      bottomText: "Oleh Al-Baiqi Samaan",
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: CustomColors.greyColor),
        ),
        hintText: "Search a project",
        hintStyle: TextStyle(color: CustomColors.textGreyColor),
        suffixIconConstraints: BoxConstraints(),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.deepOrangeColor,
            ),
            child: Icon(Icons.search, color: Colors.white, size: 14),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
      ),
      style: TextStyle(fontSize: 14),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}

class _ProjectTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String bottomText;

  const _ProjectTile({
    required this.title,
    required this.image,
    required this.subtitle,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Image.asset(image),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: CustomColors.greyColor),
                    right: BorderSide(color: CustomColors.greyColor),
                    bottom: BorderSide(color: CustomColors.greyColor),
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 10,
                                color: CustomColors.textColor,
                              ),
                            ),
                            Text(
                              bottomText,
                              style: TextStyle(
                                fontSize: 10,
                                color: CustomColors.textGreyColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              transform: GradientRotation(math.pi / 4),
                              colors: [
                                CustomColors.orangeColor,
                                CustomColors.yellowColor,
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "A",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
