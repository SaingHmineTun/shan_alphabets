import 'package:flutter/material.dart';
import 'package:shan_alphabets/screens/alphabet_screen.dart';
import 'package:shan_alphabets/services/alphabet_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> alphabets = [
    ['ၵ', 'ၶ', 'င'],
    ['ၸ', 'သ', 'ၺ'],
    ['တ', 'ထ', 'ၼ'],
    ['ပ', 'ၽ', 'ၾ'],
    ['မ', 'ယ', 'ရ'],
    ['လ', 'ဝ', 'ႁ'],
    ['', 'ဢ', ''],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("တူဝ်မႄႈလိၵ်ႈတႆး 19 တူဝ်")),
        body: Column(
          children: List.generate(alphabets.length, (index) {
            var row = alphabets[index];
            return Expanded(
              child: Row(
                children: List.generate(row.length, (index) {
                  var col = row[index];
                  if (col.isEmpty) {
                    return Expanded(child: Container());
                  }
                  return Expanded(child: _singleAlphabet(row[index]));
                }),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _singleAlphabet(String alphabet) {
    return GestureDetector(
      onTap: () {
        int _currentIndex = AlphabetService.getIndexOfAlphabetUsingPrefixValue(
          alphabet,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => AlphabetScreen(currentIndex: _currentIndex),
          ),
        );
      },
      child: Card(
        child: Center(child: Text(alphabet, style: TextStyle(fontSize: 30))),
      ),
    );
  }
}
