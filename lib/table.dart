import 'package:flutter/material.dart';

void main() {
  runApp(table());
}
class table extends StatelessWidget {
  const table({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Table(
            border: TableBorder.all(width: 1.0, color: Colors.black),
            children: [
              TableRow(children: [
                TableCell(child: Center(child: Text('Medicine name'))),
                TableCell(child: Center(child: Text('Quantity'))),
                TableCell(child: Center(child: Text('Dosage'))),
                TableCell(child: Center(child: Text('Price'))),
              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text('Lohasava'))),
                TableCell(child: Center(child: Text('30'))),
                TableCell(child: Center(child: Text('o o o'))),
                TableCell(child: Center(child: Text('300 Rs '))),
              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text('Mustakarishta'))),
                TableCell(child: Center(child: Text('10'))),
                TableCell(child: Center(child: Text('o o o'))),
                TableCell(child: Center(child: Text('50 Rs'))),

              ]),
              TableRow(children: [
                TableCell(child: Center(child: Text('Arka Pudina'))),
                TableCell(child: Center(child: Text('05'))),
                TableCell(child: Center(child: Text('o o o'))),
              ]),
            TableRow(children: [
             TableCell(child: Center(child: Text('TOTAL'))),
             TableCell(child: Center(child: Text('  '))),
             TableCell(child: Center(child: Text('  '))),
            ]),
            ]),
        ),
      ),
    );
  }
}
