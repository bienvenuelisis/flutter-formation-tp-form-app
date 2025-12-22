import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      initialRoute: "/",
      routes: {
        "/": (context) => RoutePage(actualPage: "Page 0", index: 0),
        "/page1": (context) => RoutePage(actualPage: "Page 1", index: 1),
        "/page2": (context) => RoutePage(actualPage: "Page 2", index: 2),
      },
    );
  }
}

class RoutePage extends StatelessWidget {
  const RoutePage({required this.actualPage, required this.index, super.key});

  final String actualPage;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Page"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Text(actualPage),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/page${index + 1}");
            },
            child: Text("Page suivante"),
          ),
        ],
      ),
    );
  }
}
