import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

// MICHAEL ANGELO CHANDRA - 2540131481
// Last Modified 04/07/2023 10:35

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WordState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class WordState extends ChangeNotifier {
  var word = WordPair.random();

  void getWord() {
    word = WordPair.random();
    notifyListeners(); 
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var wordState = context.watch<WordState>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Random Wordpairs")
        ),
      ),
      body: Center(
        child: Consumer<WordState>(
          builder: (context, generate, child) {
            return Text(
              generate.word.toString(),
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              )
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          wordState.getWord();
        },
        tooltip: 'Next word',
        child: const Icon(Icons.more),
      ),
    );
  }
}
