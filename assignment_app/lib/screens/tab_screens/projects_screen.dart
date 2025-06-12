import 'package:assignment_app/custom_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 12.0.sp).copyWith(top: 12.sp),
      child: Column(
        children: [
          _SearchTextField(),
          SizedBox(height: 12.h),
          Expanded(
            child: ListView.builder(
              itemCount: projectImages.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 14.0.sp),
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
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(color: CustomColors.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(color: CustomColors.greyColor),
        ),
        hintText: "Search a project",
        hintStyle: TextStyle(color: CustomColors.textGreyColor),
        suffixIconConstraints: BoxConstraints(),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10.0.sp),
          child: Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: CustomColors.deepOrangeColor,
            ),
            child: Icon(Icons.search, color: Colors.white, size: 14.sp),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.sp),
      ),
      style: TextStyle(fontSize: 14.sp),
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
      borderRadius: BorderRadius.circular(10.sp),
      child: Container(
        height: 110.h,
        width: double.infinity.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          children: [
            SizedBox(
              width: 110.w,
              height: 110.h,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: CustomColors.greyColor),
                    right: BorderSide(color: CustomColors.greyColor),
                    bottom: BorderSide(color: CustomColors.greyColor),
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.sp),
                    bottomRight: Radius.circular(10.sp),
                  ),
                ),
                padding: EdgeInsets.all(14.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.sp,
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
                                fontSize: 10.sp,
                                color: CustomColors.textColor,
                              ),
                            ),
                            Text(
                              bottomText,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: CustomColors.textGreyColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 50.w,
                          height: 26.h,
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
                              fontSize: 14.sp,
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
