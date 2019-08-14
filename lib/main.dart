//void main() => runApp(SimpleProvider());
//void main() => runApp(ProviderExampleApp());

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(MyApp());
//void main() => runApp(SimpleProvider());
//void main() => runApp(ProviderExampleApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<MyModel>(builder: (context) => MyModel()),
          ChangeNotifierProvider.value(value: null)
        ],
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[ListItemWidget(), DetailedItemWidget()],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MyModel>(context);
    return Container(
      height: 100.0,
      child: Center(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  key: Key('${model.items[index]}'),
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: GestureDetector(
                    onTap: () {
                      model.tap(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: RandomColor().randomColor(
                              colorBrightness: ColorBrightness.light,
                              colorHue: ColorHue.random,
                              colorSaturation:
                                  ColorSaturation.mediumSaturation),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 3)),
                      width: 100,
                      child: Center(
                        child: Text(
                          '${model.items[index].no}',
                          style: TextStyle(
                              fontSize: 50,
                              color: Color(0XFF414345),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}

class DetailedItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final model = Provider.of<MyModel>(context);
    return GestureDetector(
      onTap: () {
        model.tap(model.selectedIndex);
      },
      child: Container(
        height: 0.50 * screenHeight,
        width: 0.6 * screenWidth,
        decoration: BoxDecoration(
            color: RandomColor().randomColor(
                colorBrightness: ColorBrightness.light,
                colorHue: ColorHue.random,
                colorSaturation: ColorSaturation.mediumSaturation),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white, width: 3)),
        child: Center(
          child: Text(
            '${model.items[model.selectedIndex].no}',
            style: TextStyle(
                fontSize: 100,
                color: RandomColor().randomColor(
                    colorBrightness: ColorBrightness.dark,
                    colorHue: ColorHue.random,
                    colorSaturation: ColorSaturation.highSaturation),
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  MyModel() {
    intializeItems();
  }

  //Cust
  List<Item> _items = [];
  int _selectedIndex = 0;

  List<Item> get items => _items;

  int get selectedIndex => _selectedIndex;

  void intializeItems() {
    print('intializeItems');

    for (var i = 0; i < 10; i++) {
      _items.add(
        Item(
          0,
          'Item $i',
          RandomColor().randomColor(
              colorBrightness: ColorBrightness.light,
              colorHue: ColorHue.random,
              colorSaturation: ColorSaturation.mediumSaturation),
          i,
        ),
      );
    }
  }

  void tap(int index) {
    _items[index].tap();
    _selectedIndex = index;
    notifyListeners();
  }
}

class Item with ChangeNotifier {
  int _no;
  Color _color;
  String _name;
  int identifier;

  Item(this._no, this._name, this._color, this.identifier);

  int get no => _no;

  Color get color => _color;

  void setColor(Color color) {
    _color = color;
  }

  String get name => _name;

  void tap() {
    _no++;
  }
}
