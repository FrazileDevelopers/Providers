import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // This is the parent provider of MyHomePage which works only with ChangeNotifier & is a type of Counter
      home: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    /* While calling `Provider.of<T>(context)` does two things
    *  Retrives the value/object that is asked for
    *  Registers current widget which is identified by the context as a listener
    */
    // `listen` param of `Provider.of<T>(context, listen: false)` is default true it can be set to false
    final counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You said 'I LOVE YOU' these many times:",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            // Consumer<T> is used to register a widget as a listener to the type `Counter`
            Consumer<Counter>(
              builder: (_, counter, __) => Text(
                '${counter.value}',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
