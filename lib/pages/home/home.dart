import 'package:flutter/material.dart';
import 'package:forms/pages/styleText/style_text_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fomulários'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/style-text');
                },
                child: Text('01 - Editar formulários'),
              ),
              Divider(
                color: Colors.transparent,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/light-page');
                },
                child: Text('02 - Ligar/Desligar luz'),
              ),
              Divider(
                color: Colors.transparent,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/zoom-page');
                },
                child: Text('03 - Zoom em imagem'),
              ),
              Divider(
                color: Colors.transparent,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/filter-static-list');
                },
                child: Text('04 - Filtro em lista estática'),
              ),
              Divider(
                color: Colors.transparent,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/filter-api-list');
                },
                child: Text('05 - Filtro em API'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
