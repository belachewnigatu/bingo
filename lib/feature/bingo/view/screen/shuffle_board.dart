import 'package:flutter/material.dart';

class ShuffleBoard extends StatelessWidget {
  const ShuffleBoard({super.key});

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
          )
        ],
      ),
    );
  }
}
