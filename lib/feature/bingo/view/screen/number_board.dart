import 'package:bingo/feature/bingo/view/screen/shuffle_board.dart';
import 'package:flutter/material.dart';

import '../widget/number_box.dart';

class NumberBoard extends StatefulWidget {
  NumberBoard({
    super.key,
  });

  @override
  State<NumberBoard> createState() => _NumberBoardState();
}

class _NumberBoardState extends State<NumberBoard> {
  List selectedNumber = [];

  void addNumberToArray(int num) {
    setState(
      () {
        if (selectedNumber.contains(num)) {
          selectedNumber.remove(num);
        }
        else{
          selectedNumber.add(num);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: GridView.count(
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                crossAxisCount: 20,
                children: [
                  ...List.generate(
                    400,
                    (index) => NumberBox(
                      index: index + 1,
                      isSelected: selectedNumber.contains(index + 1),
                      onSelected: (val) {
                        addNumberToArray(val);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.black,
                ],
              ),
            ),
            padding: const EdgeInsets.only(bottom: 10.0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ShuffleBoard(),
                      ),
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
