import 'package:flutter/material.dart';

class LightPage extends StatefulWidget {
  const LightPage({ Key? key }) : super(key: key);

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light'),
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