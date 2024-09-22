import 'package:flutter/material.dart';

class SelectionBox extends StatelessWidget {
  SelectionBox({super.key, this.isSelected = false, required this.index});

  bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isSelected
                  ? [Colors.red, Colors.amber]
                  : [Colors.green, Colors.amber]),
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            index.toString(),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
