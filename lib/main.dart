import 'package:flutter/material.dart';

main() {
  runApp(const QuoteApp());
}

class Quote {
  late final String text;
  late final String author;
  Quote(this.text, this.author);
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Hello ",
      home: StatefulHomePage(),
    );
  }
}

class StatefulHomePage extends StatefulWidget {
  const StatefulHomePage({super.key});

  @override
  State<StatefulHomePage> createState() => _StatefulHomePageState();
}

class _StatefulHomePageState extends State<StatefulHomePage> {
  final _formkey = GlobalKey<FormState>();
  late String _inputQuote;
  late String _inputAuthor;
  late List<Quote> quotes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quote'),
        ),
        body: Column(
          children: [
            Form(
                key: _formkey,
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text('Quote')),
                  onSaved: (String? value) {
                    _inputQuote = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text('Author')),
                  onSaved: (String? value) {
                    _inputAuthor = value ?? '';
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _formkey.currentState?.save();
                    print(_inputQuote);
                    print(_inputAuthor);
                    setState(() {
                      quotes.insert(0, Quote(_inputQuote, _inputAuthor));
                    });
                    
                    _formkey.currentState?.reset();
                  },
                  child: Text('Submit'))
              ],
            )),
            Expanded(
              child: quotes.isEmpty
                  ? const Center(
                      child: Text('empty'),
                    )
                  : ListView.builder(
                      itemCount: quotes.length,
                      itemBuilder: ((context, index) {
                        return QuoteCard(
                            quotes[index].text, quotes[index].author);
                      }),
                    ),
            ),
          ],
        ));
  }
}

class QuoteCard extends StatelessWidget {
  final String _text;
  final String _author;

  const QuoteCard(
    this._text,
    this._author, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '"$_text"',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            alignment: const Alignment(1, 0),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$_author',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
