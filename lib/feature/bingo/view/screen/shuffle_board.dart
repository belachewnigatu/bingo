import 'dart:math';

import 'package:flutter/material.dart';

import '../widget/number_box.dart';
import '../widget/selection_box.dart';

class ShuffleBoard extends StatefulWidget {
  const ShuffleBoard({super.key});

  @override
  State<ShuffleBoard> createState() => _ShuffleBoardState();
}

class _ShuffleBoardState extends State<ShuffleBoard> {
  var selectedArray = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: GridView.count(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 15,
                children: [
                  ...List.generate(
                    75,
                    (index) => SelectionBox(
                      index: index + 1,
                      isSelected: selectedArray.contains(index + 1),
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
                    randomWithSeedArray();
                  },
                  child: const Text('Auto Play'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  randomWithSeedArray() async {
    var rand = Random();

    while (selectedArray.length <= 75) {
      //generate random number
      var val = rand.nextInt(76) + 1;
      //check it if it is on the selected random array
      if (selectedArray.contains(val)) {
        print(val);
        continue;
      }

      await delayIteration(val);
    }
  }

  Future<void> delayIteration(val) async {
    return await Future.delayed(
      const Duration(seconds: 3),
      () => setState(() {
        selectedArray.add(val);
        print(selectedArray);
      }),
    );
  }
}
