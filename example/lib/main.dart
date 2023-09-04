import 'package:flutter/material.dart';
import 'package:flutter_debugframesize/flutter_debugframesize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _toggleDebug() {
    FlutterDebugFrameSizeConstants.isEnabled.value = !FlutterDebugFrameSizeConstants.isEnabled.value;
  }

  void _incrementCounter() {
    setState(() {
      _counter = _counter <= 0 ? 1 : _counter;
      _counter *= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // add `.debugFrameSize()`
        title: Text(widget.title).debugFrameSize(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ).debugFrameSize(),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ).debugFrameSize(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const SizedBox(width: double.infinity, height: 20).debugFrameSize(),
            ),

            const SizedBox(width: 280, height: 20).debugFrameSize(),
            const SizedBox(width: 240, height: 20).debugFrameSize(),
            const SizedBox(width: 130, height: 20).debugFrameSize(),
            const SizedBox(width: 30, height: 60).debugFrameSize(),

            // customizable styles of `.debugFrameSize()` with `DebugFrameSizeBodyStyle`
            Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif')
                .debugFrameSize(
                  debugFrameSizeBodyStyle: const DebugFrameSizeBodyStyle(
                    color: Color(0xFF00cc00),
                    fontSize: 20,
                    thickness: 4,
                    dashPattern: [10, 10],
                  ),
                ),

          ],
        ),
      ),
      floatingActionButton: Align(alignment: Alignment.bottomRight, child: Column(
        children: <Widget>[
          const Spacer(),
          ValueListenableBuilder(valueListenable: FlutterDebugFrameSizeConstants.isEnabled, builder: (_, bool value, child) {
            return FloatingActionButton(
              onPressed: _toggleDebug,
              tooltip: 'Toggle Debug',
              child: Icon( value ? Icons.toggle_on : Icons.toggle_off),
            );
          }),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add).debugFrameSize(),
          ),
        ],
      ),
      ),
    );
  }
}
