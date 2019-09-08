import 'dart:convert';

import 'package:ambrosia/provider/recipe_provider.dart';
import 'package:ambrosia/screen/recipe.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'model/recipe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecipeProvider provider = new RecipeProvider();
    Future<Iterable<Recipe>> recipes = provider.getRecipes();
    var screen = FutureBuilder<Iterable<Recipe>>(
      future: recipes,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container();
        }
        return Container(
          child: RecipeScreen(snapshot.data.first),
        );
      },
    );

    return MaterialApp(
      title: 'Ambrosia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: screen,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
