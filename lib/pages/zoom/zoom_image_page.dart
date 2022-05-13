import 'package:flutter/material.dart';

class ZoomImage extends StatefulWidget {
  const ZoomImage({Key? key}) : super(key: key);

  @override
  State<ZoomImage> createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom In Image'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                width: 300.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.amber,
                    width: 5.0,
                  ),
                ),
                child: Image.asset(
                  'assets/images/imagem01.png',
                  // scale: 2,
                  // fit: BoxFit.cover,
                ),
              ),
              Spacer(),
              Slider(
                  value: _currentSliderValue,
                  max: 10,
                  // divisions: 10,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  })
            ],
          ),
        )),
      ),
    );
  }
}
