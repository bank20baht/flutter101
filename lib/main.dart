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
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://cdn.pixabay.com/photo/2022/02/22/06/21/cat-7028109_960_720.png")
                      )
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'นายเองก็เป็นได้นะ Hero หน่ะ',
                    style: TextStyle(
                      fontSize: 20,
                      
                    ),),
                ),
                  
                Container(
                  alignment: const Alignment(1, 0),
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'all might',
                    style: TextStyle(
                      fontStyle: FontStyle.italic
                    ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
