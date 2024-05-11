import 'dart:convert';
import 'dart:io';

import 'package:data_table_2/data_table_2.dart';
import 'package:floating_dialog/floating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:chickies_ui/chickies_ui.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/data/model/logistic_entry.dart';
import 'package:test_app/screen/measurement_screen.dart';
import 'package:test_app/screen/test_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        colorScheme: ColorScheme.fromSeed(seedColor: ChickiesColor.blue),
        // fontFamily: GoogleFonts.beVietnamPro().fontFamily,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TestNavigationRail(),
    );
  }
}

class TestNavigationRail extends StatefulWidget {
  const TestNavigationRail({super.key});

  @override
  State<TestNavigationRail> createState() => _TestNavigationRailState();
}

class _TestNavigationRailState extends State<TestNavigationRail> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _index,
            onDestinationSelected: (int index) {
              setState(() {
                _index = index;
              });
            },
            destinations: [
              const NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("hOme"),
              ),
              NavigationRailDestination(icon: Icon(Icons.table_chart_sharp), label: MyDataTable()),
              const NavigationRailDestination(
                  icon: Icon(Icons.oil_barrel),
                  label: MyHomePage(
                    title: "123",
                  )),
            ],
          ),
          const VerticalDivider(
            width: 1,
            thickness: 1,
          ),
          if (_index == 0)
            Expanded(
              child: MeasurementScreen(),
            )
          else if (_index == 1)
            Expanded(
              child: MyDataTable(),
            )
          else
            Expanded(
              child: MyHomePage(
                title: "123",
              ),
            ),
        ],
      ),
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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
