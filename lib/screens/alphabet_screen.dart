import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shan_alphabets/services/alphabet_service.dart';

class AlphabetScreen extends StatefulWidget {
  final int currentIndex;

  const AlphabetScreen({super.key, required this.currentIndex});

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final AudioPlayer _player = AudioPlayer();
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Alphabet currentAlphabet = AlphabetService.getAllAlphabets()[_currentIndex];

    goNext() {
      setState(() {
        if (_currentIndex == AlphabetService.getCount() - 1) {
          _currentIndex = 0;
        } else {
          _currentIndex++;
        }
      });
    }

    goPrev() {
      setState(() {
        if (_currentIndex == 0) {
          _currentIndex = AlphabetService.getCount() - 1;
        } else {
          _currentIndex--;
        }
      });
    }

    Future<void> playAudio() async {
      await _player.play(AssetSource('audios/${currentAlphabet.id}.mp3'));
    }

    return Scaffold(
      appBar: AppBar(title: Text("တူဝ်မႄႈလိၵ်ႈတႆး (19) တူဝ်")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          spacing: 20,
          children: [
            Text(
              'တူဝ်မႄႈလိၵ်ႈတႆး - ${currentAlphabet.saying[0]}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            // Image(
            //   image: AssetImage("assets/images/${currentAlphabet.id}.png"),
            //
            //   width: 150,
            //   height: 150,
            // ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, anim) {
                return FadeTransition(opacity: anim, child: child);
              },
              child: Container(
                key: ValueKey<String>(currentAlphabet.id),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/${currentAlphabet.id}.png",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Text(currentAlphabet.saying, style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _myButton("Prev", goPrev),
                _myButton("Speak", playAudio),
                _myButton("Next", goNext),
              ],
            ),
          ],
        ),
      ),
    );
  }

  MaterialButton _myButton(String name, Function onClicked) {
    return MaterialButton(
      color: Colors.amber,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () => onClicked(),
      child: Text(name),
    );
  }
}
