import 'package:flutter/material.dart';

import '../screen/number_board.dart';

class NumberBox extends StatefulWidget {
  NumberBox({
    super.key,
    required this.index,
    this.isSelected = false,
    required this.onSelected,
  });
  final int index;
  bool disableSelection = false;
  bool isSelected = false;

  Function(int num) onSelected;

  @override
  State<NumberBox> createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  var numBoard = NumberBoard();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
        widget.onSelected(widget.index);
      },
      child: widget.isSelected ? selectedBox() : notSelectedBox(),
    );
  }

  Widget selectedBox() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.red, Colors.amber],
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      child: Center(
        child: Text(
          widget.index.toString(),
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget notSelectedBox() {
    return Card(
      elevation: 15,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.isSelected
                  ? [Colors.red, Colors.amber]
                  : [Colors.green, Colors.amber]),
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            widget.index.toString(),
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
