import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gestorgastos/theme/theme_provider.dart';

class HomePage extends StatelessWidget {
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
          IconButton(
            icon: const Icon(Icons.brightness_6),
            tooltip: 'Cambiar tema',
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .toggleTheme('greenMode');
            },
          ),
        ],
      ),
      body: Center(child: Text('Hola Mundo')),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.secondary,
          animationDuration: Duration(milliseconds: 450),
          items: [Icon(Icons.favorite), Icon(Icons.donut_large)]),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
