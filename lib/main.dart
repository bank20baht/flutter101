import 'package:flutter/material.dart';

main() {
  runApp(const QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Hello ",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote'),
      ),
      body: ListView(
        children: const [
          QuoteCard("11111", "bank", "https://cdn.pixabay.com/photo/2022/02/22/06/21/cat-7028109_960_720.png"),
          QuoteCard("22222", "bob", "https://cdn.pixabay.com/photo/2017/11/11/17/40/cat-2939726_960_720.jpg"),
          QuoteCard("3333", "boy", "https://cdn.pixabay.com/photo/2019/05/21/07/11/cat-4218424_960_720.jpg"),
        ],
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final String _text;
  final String _author;
  final String _imgURL;
  const QuoteCard(this._text, this._author, this._imgURL, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('$_imgURL')
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '"$_text"',
              style: const TextStyle(
                fontSize: 20,
                
              ),),
          ),
            
          Container(
            alignment: const Alignment(1, 0),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$_author',
              style: const TextStyle(
                fontStyle: FontStyle.italic
              ),
              ),
          ),
        ],
      ),
    );
  }
}
