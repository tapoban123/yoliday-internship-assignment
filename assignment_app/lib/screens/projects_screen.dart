import 'package:assignment_app/custom_colors.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(top: 12),
      child: Column(
        children: [
          TextField(
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
          ),
        ],
      ),
    );
  }
}
