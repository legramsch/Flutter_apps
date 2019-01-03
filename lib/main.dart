import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindless Test',
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestion = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
  return Scaffold (
    appBar: AppBar(
      title: Text('Prueba name generator'),
    ),
    body: _buildSuggestions(),
  );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestion.length) {
            _suggestion.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestion[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text (
          pair.asPascalCase,
          style: _biggerFont,
        )
    );
}

class RandomWords extends StatefulWidget {


  }

}