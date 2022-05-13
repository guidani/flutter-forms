import 'package:flutter/material.dart';

class ZoomImage extends StatefulWidget {
  const ZoomImage({ Key? key }) : super(key: key);

  @override
  State<ZoomImage> createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom In Image'),
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