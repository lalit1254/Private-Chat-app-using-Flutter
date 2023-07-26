import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
 
class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> Categories = ['Messages', 'Online', 'Groups', 'Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.blueGrey,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Categories.length,
          itemBuilder: (BuildContext context, int index) {
            //here we wrapped child text with padding and added padding with gesturedetector widget 
            //we did this after using index field below because it only darkens first text it wont do what we need
            return GestureDetector(
              onTap: (() {
               setState(() {
                  selectedIndex = index;
               });
              }),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20
                ),
                child: Text(Categories[index],
                    style: TextStyle(
                      //we used index here to set color to dark white when selected and others to light white

                      color: index == selectedIndex
                          ? Colors.white
                          : Colors.white60,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    )
                    ),
              ),
            );
          }),
    );
  }
}
