import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:bingo/feature/bingo/view/screen/number_board.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import '../widget/selection_box.dart';

class ShuffleBoard extends StatefulWidget {
  const ShuffleBoard({super.key});

  @override
  State<ShuffleBoard> createState() => _ShuffleBoardState();
}

class _ShuffleBoardState extends State<ShuffleBoard> {
  late ConfettiController _controllerCenterLeft;
  AudioPlayer audioPlayer = AudioPlayer();
  late double sliderVal = 3.0;
  var selectedArray = [];
  var numberList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75
  ];

  bool isDisposed = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.setReleaseMode(ReleaseMode.release);
    _controllerCenterLeft = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    _controllerCenterLeft.play();
  }

  @override
  void dispose() {
    isDisposed = true;
    audioPlayer.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: const Icon(Icons.arrow_back),
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: Card(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/letter-icons/b.png',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Image.asset(
                          'assets/images/letter-icons/i.png',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Image.asset(
                          'assets/images/letter-icons/n.png',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Image.asset(
                          'assets/images/letter-icons/g.png',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Image.asset(
                          'assets/images/letter-icons/o.png',
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                    Expanded(
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
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 170,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black12,
                  Colors.black12,
                ],
              ),
            ),
            padding: const EdgeInsets.only(bottom: 10.0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {});
                        randomWithSeedArray();
                      },
                      child: const Text('Auto Play'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(
                          () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NumberBoard(),
                            ));
                          },
                        );
                      },
                      child: const Text('Next Game'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(
                          () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ShuffleBoard(),
                            ));
                          },
                        );
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Text('Speed:'),
                          Slider(
                            value: sliderVal,
                            divisions: 5,
                            min: 1,
                            max: 7,
                            label: sliderVal.round().toString(),
                            onChanged: (val) {
                              setState(() {
                                sliderVal = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Check Number:'),
                          const SizedBox(
                            width: 100,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              winnerPage();
                            },
                            child: const Text('Check'),
                          ),
                        ],
                      ),
                    ),
                  ],
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

    while (numberList.isNotEmpty) {
      var val = rand.nextInt(numberList.length);

      var voiceNum = numberList[val];
      await Future.delayed(
        Duration(seconds: sliderVal.round()),
        () => setState(
          () {
            selectedArray.add(voiceNum);
            numberList.removeAt(val);
          },
        ),
      );

      await delayIteration(voiceNum);
    }
  }

  Future<void> delayIteration(val) async {
    setState(
      () {
        selectedArray.add(val);
        audioPlayer.play(
          AssetSource('sound/$val.mp3'),
        );
      },
    );
    await Future.delayed(
      const Duration(seconds: 1),
    );
  }

  winnerPage() {
    final alert = showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 300,
          width: 250,
          child: Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenterLeft,
              blastDirection: pi, // radial value - LEFT
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05, // apply drag to the confetti
              emissionFrequency: 0.05, // how often it should emit
              numberOfParticles: 40, // number of particles to emit
              gravity: 0.05, // gravity - or fall speed
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.red,
                Colors.yellow,
                Colors.purple,
                Colors.black,
                Colors.amber,
                Colors.lightBlue,
                Colors.orange
              ], // manually specify the colors to be used
              strokeWidth: 1,
              strokeColor: Colors.white,
            ),
          ),
        ),
      ),
    );

    return alert;
  }
}
