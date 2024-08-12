import 'package:bingo/feature/bingo/view/screen/shuffle_board.dart';
import 'package:flutter/material.dart';

import '../widget/cartela_number.dart';

class CartelaBoard extends StatelessWidget {
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
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 10,
                children: [
                  ...List.generate(
                      100, (index) => CartelaNumber(index: index + 1))
                ],
              ),
            ),
          ),
          Padding(
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
                    child: const Text('Play')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
