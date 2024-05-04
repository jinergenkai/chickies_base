import 'dart:convert';
import 'dart:io';

import 'package:data_table_2/data_table_2.dart';
import 'package:floating_dialog/floating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:chickies_ui/chickies_ui.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:test_app/data/model/logistic_entry.dart';

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
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("hOme"),
              ),
              NavigationRailDestination(
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

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({super.key});

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    initExitHandler();
  }

  void initExitHandler() {
    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: const Text('Bạn có muốn lưu và thoát không?'), backgroundColor: Colors.white, actions: [
              ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Có')),
              ElevatedButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Không')),
            ]);
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measurement Screen', style: TextStyle(color: Colors.white)),
        toolbarHeight: 50,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  //measurements
                  RoundedContainer(
                    height: 150,
                    width: 500,
                    child: Center(child: Text("120.000", style: TextStyle(fontSize: 100, color: Colors.red, fontWeight: FontWeight.bold))),
                  ),
                  //action
                  Expanded(
                    child: Wrap(
                      children: _actions,
                    ),
                  )
                ],
              ),
              //*table data
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    alignment: Alignment.topLeft,
                    // height: MediaQuery.of(context).size.height - 200,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.minWidth),
                      child: DataTable2(
                        border: TableBorder.all(color: ChickiesColor.grey, width: 1),
                        columns: _headers,
                        rows: _rows,
                        minWidth: 1000,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_showDialog)
            FloatingDialog(
                onDrag: (x, y) {
                  print('x: $x, y: $y');
                },
                onClose: () {
                  setState(() {
                    _showDialog = false;
                  });
                },
                child: const SizedBox(height: 200, width: 300, child: Align(alignment: Alignment.topCenter, child: Text('Dialog Title')))),
        ],
      ),
    );
  }

  bool _showDialog = false;

  List<Widget> get _actions {
    //action function
    List<Function> functions = [
      () {},
      () {},
      () {
        setState(() {
          _showDialog = true;
        });
      },
      () {},
      () {},
      () {},
    ];
    List<String> titles = [
      'Xe+hàng',
      'Xác xe',
      'In Phiếu cân',
      'Thêm mới',
      'Lưu lại',
      'Lịch sử',
    ];
    if (functions.length != titles.length) {
      throw Exception("Length of functions, titles must be the same");
    }
    return List.generate(
        functions.length,
        (index) => Container(
            // width: 100,
            height: 50,
            margin: EdgeInsets.all(5),
            child: MaterialButton(
              color: Theme.of(context).colorScheme.primary,
              onPressed: functions[index] as void Function()?,
              child: Text(
                titles[index],
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            )));
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      Widget row = _actions.removeAt(oldIndex);
      _actions.insert(newIndex, row);
    });
  }

  List<DataColumn> get _headers {
    const List<List<dynamic>> titles = [
      ['Mã', 1],
      ['Tên khách hàng', 2],
      ['Địa chỉ', 1],
      ['Loại hàng', 1],
      ['Biển số xe', 1],
      ['TL xe hàng', 1],
      ['TL xe', 1],
      ['TL hàng', 1],
      ['Ngày cân', 1],
      ['Giờ cân xe', 1],
      ['Giờ cân xác', 1],
      ['Ghi chú', 1],
    ];
    num sum = titles.fold(0, (previousValue, element) => previousValue + element[1]);

    LogisticEntry test = LogisticEntry();
    // print(test.)

    print(MediaQuery.of(context).size.width / sum * titles[1][1]);
    return List.generate(
        titles.length,
        (index) => DataColumn2(
            fixedWidth: (MediaQuery.of(context).size.width - 150) / sum * titles[index][1],
            onSort: (index, ascending) {
              print('index: $index, ascending: $ascending');
            },
            label: Container(width: 200, height: 200, color: Colors.red, child: Text(titles[index][0]))));
  }

  List<DataRow> get _rows {
    return List.generate(
      20,
      (rowIndex) => DataRow(
        cells: List.generate(
            12,
            (colIndex) => DataCell(TextField(
                  decoration: InputDecoration(border: InputBorder.none, hintText: "$rowIndex - $colIndex"),
                ))),
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
