import 'package:flutter/material.dart';

class MyAspectRatio extends StatelessWidget {
  const MyAspectRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              'https://img.europapress.es/fotoweb/fotonoticia_20180210183601_1200.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
