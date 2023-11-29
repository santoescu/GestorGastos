import 'package:flutter/material.dart';
import 'package:gestorgastos/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App bar'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.brightness_6),
            tooltip: 'Cambiar tema',
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .toggleTheme('lightMode');
            },
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            tooltip: 'Cambiar tema',
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .toggleTheme('darkMode');
            },
          ),
        ],
      ),
      body: Center(child: Text('Hola reports')),
    );
  }
}
