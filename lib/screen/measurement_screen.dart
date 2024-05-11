import 'package:chickies_ui/chickies_ui.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:floating_dialog/floating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:intl/intl.dart';
import 'package:test_app/data/model/logistic_entry.dart';

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({super.key});

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  List<LogisticEntry> _entries = [];
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0);

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
        backgroundColor: ChickiesColor.background,
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
                          dataRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                            return ChickiesColor.white;
                          }),
                          headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                            return ChickiesColor.white;
                          }),
                          scrollController: _scrollController,
                          columnSpacing: 10,
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
        //go down
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              newItem();
            });
          },
          child: const Icon(Icons.add),
        ));
  }

  bool _showDialog = false;

  void newItem() {
    _entries.add(LogisticEntry(id: _entries.length + 1));
    if (_scrollController.hasClients) _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

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
      () {
        setState(() {
          newItem();
        });
      },
      () {},
      () {},
    ];
    List<String> actionNames = [
      'Xe+hàng',
      'Xác xe',
      'In Phiếu cân',
      'Thêm mới',
      'Lưu lại',
      'Lịch sử',
    ];
    if (functions.length != actionNames.length) {
      throw Exception("Length of functions, titles must be the same");
    }
    return List.generate(functions.length, (index) {
      return Container(
          // width: 100,
          height: 50,
          margin: EdgeInsets.all(5),
          child: MaterialButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: functions[index] as void Function()?,
            child: Text(
              actionNames[index],
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ));
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      Widget row = _actions.removeAt(oldIndex);
      _actions.insert(newIndex, row);
    });
  }

  List<DataColumn> get _headers {
    num sum = titles.fold(0, (previousValue, element) => previousValue + element[1]);

    print(MediaQuery.of(context).size.width / sum * titles[1][1]);
    return List.generate(
        titles.length,
        (index) => DataColumn2( 
            fixedWidth: (MediaQuery.of(context).size.width - 150) / sum * titles[index][1],
            onSort: (index, ascending) {
              print('index: $index, ascending: $ascending');
            },
            label: Container(
                alignment: Alignment.center,
              child: Text(titles[index][0]))));
  }

  List<List<dynamic>> titles = [
    ['Mã', 0.3],
    ['Tên khách hàng', 2],
    ['Ghi chú', 1],
    ['Biển số xe', 1],
    ['TL xe hàng', 1],
    ['TL xe', 1],
    ['TL hàng', 1],
    ['Ngày cân', 1],
    ['Giờ cân xe', 1],
    ['Giờ cân xác', 1],
    ['Loại hàng', 1],
    ['Địa chỉ', 1],
  ];

  List<DataRow> get _rows {
    return List.generate(
    _entries.length,
      (rowIndex) => DataRow(
        cells: List.generate(titles.length, (colIndex) {
          switch (colIndex) {
            case 0: // id
              return DataCell(Text(rowIndex == _entries.length ? '' : _entries[rowIndex].id.toString()));
            case 1: // customer name
              TextEditingController controller = TextEditingController(text: _entries[rowIndex].customerName ?? '');
              return DataCell(TextField(
                controller: controller,
                decoration: const InputDecoration(border: InputBorder.none),
                onChanged: (value) {
                  _entries[rowIndex] = _entries[rowIndex].copyWith(customerName: value);
                  // controller.text = _entries[rowIndex].customerName ?? '';
                },
              ));
            case 2: // note
              TextEditingController controller = TextEditingController(text: _entries[rowIndex].note ?? '');
              return DataCell(TextField(
                controller: controller,
                decoration: const InputDecoration(border: InputBorder.none),
                onChanged: (value) {
                  _entries[rowIndex] = _entries[rowIndex].copyWith(note: value);
                },
              ));
            case 3: // license plate
              TextEditingController controller = TextEditingController(text: _entries[rowIndex].licensePlate ?? '');
              return DataCell(TextField(
                controller: controller,
                decoration: const InputDecoration(border: InputBorder.none),
                onChanged: (value) {
                  _entries[rowIndex] = _entries[rowIndex].copyWith(licensePlate: value);
                },
              ));
            case 4:
              return DataCell(Container(
                alignment: Alignment.centerRight,
                child: Text(rowIndex == _entries.length ? '' : _entries[rowIndex].cargoWeight ?? '0'),
              ));
            case 5:
              return DataCell(Container(
                alignment: Alignment.centerRight,
                child: Text(rowIndex == _entries.length ? '' : _entries[rowIndex].vehicleWeight ?? '0'),
              ));
            case 6:
              return DataCell(Container(
                alignment: Alignment.centerRight,
                child: Text(rowIndex == _entries.length ? '' : _entries[rowIndex].goodsWeight ?? '0')));
            case 7:
              return DataCell(Text(rowIndex == _entries.length ? '' : DateFormat('dd/MM').format(_entries[rowIndex].vehicleWeighingDate ?? DateTime.now())));
            case 8:
              return DataCell(Text(rowIndex == _entries.length ? '' : DateFormat('hh:mm').format(_entries[rowIndex].vehicleWeighingDate ?? DateTime.now())));
            case 9:
              return DataCell(Text(rowIndex == _entries.length ? '' : DateFormat('hh:mm').format(_entries[rowIndex].verifiedWeighingDate ?? DateTime.now())));
            case 10:
              return DataCell(Text(rowIndex == _entries.length ? '' : _entries[rowIndex].type ?? ''));
            case 11:
              return DataCell(Text(rowIndex == _entries.length ? '' : _entries[rowIndex].address ?? ''));
            default:
              return DataCell(Text(''));
          }
          // TextEditingController controller = TextEditingController();
          // return DataCell(TextField(
          //   controller: controller,
          //   decoration: InputDecoration(border: InputBorder.none, hintText: "$rowIndex - $colIndex"),
          //   onChanged: (value) {
          //     _entries[rowIndex].updateValue(colIndex, value);
          //   },
          // ));
        }),
      ),
    );
  }

  // String columnOfAttributes(LogisticEntry entry, int index) {
  //   switch (index) {
  //     case 0:
  //       return entry.id.toString();
  //     case 1:
  //       return entry.customerName ?? '';
  //     case 2:
  //       return entry.address ?? '';
  //     case 3:
  //       return entry.type ?? '';
  //     case 4:
  //       return entry.licensePlate ?? '';
  //     case 5:
  //       return entry.cargoWeight ?? '';
  //     case 6:
  //       return entry.vehicleWeight ?? '';
  //     case 7:
  //       return entry.goodsWeight ?? '';
  //     case 8:
  //       return DateFormat('dd/MM').format(entry.vehicleWeighingDate ?? DateTime.now());
  //     case 9:
  //       return DateFormat('hh:mm').format(entry.vehicleWeighingDate ?? DateTime.now());
  //     case 10:
  //       return DateFormat('hh:mm').format(entry.verifiedWeighingDate ?? DateTime.now());
  //     case 11:
  //       return entry.note ?? '';
  //     default:
  //       return '';
  //   }
  // }
}
