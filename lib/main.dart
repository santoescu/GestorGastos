import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gestorgastos/pages/reports.dart';
import 'package:gestorgastos/pages/transactions.dart';
import 'package:provider/provider.dart';
import 'package:gestorgastos/theme/theme_provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _page = 0;
  final pages = [Transactions(), Reports()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60,
        backgroundColor: Theme.of(context).colorScheme.background,
        color: Theme.of(context).colorScheme.secondary,
        animationDuration: Duration(milliseconds: 450),
        items: [
          Icon(Icons.favorite),
          Icon(Icons.donut_large),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: pages[_page],
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isDismissible: false,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              builder: ((context) {
                return Container(
                  height: 650,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Modal BottomSheet'),
                        ElevatedButton(
                          child: const Text('Close BottomSheet'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              }));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
