import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyDataTable(),
        ),
      ),
    );
  }
}

class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  FocusNode _focusNode = FocusNode();
  int _selectedRowIndex = 0;
  int _selectedColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            setState(() {
              if (_selectedRowIndex > 0) _selectedRowIndex--;
            });
          } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            setState(() {
              if (_selectedRowIndex < 2) _selectedRowIndex++;
            });
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            setState(() {
              if (_selectedColumnIndex > 0) _selectedColumnIndex--;
            });
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            setState(() {
              if (_selectedColumnIndex < 2) _selectedColumnIndex++;
            });
          }
        }
      },
      child: DataTable(
        columns: List.generate(
          3,
          (index) => DataColumn(label: Text('Column ${index + 1}')),
        ),
        rows: List.generate(
          3,
          (rowIndex) => DataRow(
            cells: List.generate(
              3,
              (colIndex) {
                return DataCell(
                  Text('Row ${rowIndex + 1}, Col ${colIndex + 1}'),
                  onTap: () {
                    setState(() {
                      _selectedRowIndex = rowIndex;
                      _selectedColumnIndex = colIndex;
                    });
                  },
                  // color: rowIndex == _selectedRowIndex &&
                  //         colIndex == _selectedColumnIndex
                  //     ? MaterialStateColor.resolveWith(
                  //         (states) => Colors.blue.withOpacity(0.3))
                  //     : null,
                   
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
