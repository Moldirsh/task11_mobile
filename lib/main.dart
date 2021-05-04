import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab11"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContRandomColorWidget(),
          ],
        ),
      ),
    );
  }
}

class ContRandomColorWidget extends StatefulWidget {
  @override
  _ContRandomColorWidgetState createState() => _ContRandomColorWidgetState();
}

class _ContRandomColorWidgetState extends State<ContRandomColorWidget> {
  Color color = Colors.green;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            color: Colors.black.withOpacity(0.1),
            width: 200,
            height: 200,
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInBack,
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: color,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          RaisedButton(
            shape: StadiumBorder(),
            color: Colors.blue,
            onPressed: () {
              final random = Random();

              final red = random.nextInt(255);
              final green = random.nextInt(255);
              final blue = random.nextInt(255);
              final color = Color.fromRGBO(red, green, blue, 1);

              setState(() {
                this.color = color;
              });
            },
          ),
        ],
      );
}
