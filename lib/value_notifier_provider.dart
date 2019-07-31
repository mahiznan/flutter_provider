import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'A simple provider app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Provider<DataModel>(
      builder: (context) => DataModel(),
      child: Consumer<DataModel>(builder: (context, value, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                value.counter.value.toString(),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
              ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  value.counter.value++;
                });
              }),
        );
      }),
    );
  }
}

class DataModel {
  ValueNotifier<int> counter = ValueNotifier(0);
}
