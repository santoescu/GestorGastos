import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gestorgastos/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Transactions extends StatelessWidget {
  List<String> _list = [
    'esto',
    'es',
    'una',
    'prueba',
    'facil',
    'esto',
    'es',
    'una',
    'prueba',
    'facil',
    'esto',
    'es',
    'una',
    'prueba',
    'facil',
    'esto',
    'es',
    'una',
    'prueba',
    'facil',
    'esto',
    'es',
    'una',
    'prueba',
    'facil'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            snap: false,
            floating: true,
            flexibleSpace: const FlexibleSpaceBar(),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Slidable(
                  key: ValueKey(index),
                  startActionPane: ActionPane(
                    motion: BehindMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        label: 'Eliminar',
                        icon: Icons.delete,
                        onPressed: (Context) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Eliminar ${_list[index]}')));
                        },
                      )
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: BehindMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.green,
                        label: 'compartir',
                        icon: Icons.share,
                        onPressed: (Context) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('COMPARTIR ${_list[index]}'),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  child: ListTile(
                    title: Text(_list[index]),
                    subtitle: Text(_list[index]),
                    leading: Icon(Icons.emoji_emotions),
                    trailing: Text(
                      'prueba',
                      style: TextStyle(
                        fontSize: 20,
                        color: _list[index] == 'prueba'
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ),
                );
              },
              childCount: _list.length,
            ),
          ),
        ],
      ),
    );
  }
}
