import 'package:flutter/material.dart';

class CartelaNumber extends StatefulWidget {
  CartelaNumber({super.key, required this.index});
  final int index;

  @override
  State<CartelaNumber> createState() => _CartelaNumberState();
}

class _CartelaNumberState extends State<CartelaNumber> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: isSelected
          ? Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red, Colors.amber]),
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: Center(
                  child: Text(
                widget.index.toString(),
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )),
            )
          : Card(
              elevation: 15,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.green, Colors.amber]),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    widget.index.toString(),
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
    );
  }
}
