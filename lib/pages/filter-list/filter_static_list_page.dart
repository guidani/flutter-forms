import 'package:flutter/material.dart';

class FilterStaticList extends StatefulWidget {
  const FilterStaticList({ Key? key }) : super(key: key);

  @override
  State<FilterStaticList> createState() => _FilterStaticListState();
}

class _FilterStaticListState extends State<FilterStaticList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter From Static List'),
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