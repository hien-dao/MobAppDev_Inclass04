import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Stateful Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  //initial counter value
  int _counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                border: Border.all(color: Colors.blue, width: 5),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                //displays the current number
                '$_counter',
                style: _counter > 50
                  ? TextStyle(fontSize: 50, color: Colors.green)
                  : _counter == 0
                    ? TextStyle(fontSize: 50, color: Colors.red)
                    : TextStyle(fontSize: 50, color: Colors.black),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.black,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter++; // Increment counter by 1
                  });
                },
                child: const Text('+'),
              ),

              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(_counter>0) {
                      _counter--;
                    } // Decrement counter by 1
                  });
                },
                child: const Text('-'),
              ),

              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter = 0; // Reset counter to 0
                  });
                },
                child: const Text('Reset'),
              ),
            ],  
          ),
        ],
      ),
    );
  }
}