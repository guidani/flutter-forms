import 'package:flutter/material.dart';

class FilterApiList extends StatefulWidget {
  const FilterApiList({Key? key}) : super(key: key);

  @override
  State<FilterApiList> createState() => _FilterApiListState();
}

class _FilterApiListState extends State<FilterApiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter From API'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          children: [
            Text('asd'),
          ],
        )),
      ),
    );
  }
}
