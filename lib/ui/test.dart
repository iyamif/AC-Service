import 'package:flutter/material.dart';

class tesTing extends StatefulWidget {
  const tesTing({super.key});

  @override
  State<tesTing> createState() => _tesTingState();
}

class _tesTingState extends State<tesTing> {
  List<bool> isSelected = [false, false, false, false];
  // List<String> texts = ["Text 1", "Text 2", "Text 3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ToggleButtons(
            children: [
              Text("Show Text 1"),
              Text("Show Text 2"),
              Text("Show Text 3"),
              Text("Show Text 4"),
            ],
            isSelected: isSelected,
            onPressed: (int index) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
          ),
        ),
      ),
    );
  }
}
