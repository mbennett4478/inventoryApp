import 'package:flutter/material.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/services/auth_service.dart';
import 'package:inventory/services/auth_service_adapter.dart';
import 'package:inventory/widgets/auth_widget.dart';
import 'package:inventory/widgets/auth_widget_builder.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({
    this.initialAuthServiceType = AuthServiceType.bsmple,
  });

  final AuthServiceType initialAuthServiceType;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthServiceAdapter(
            initialAuthServiceType: initialAuthServiceType,
          ),
          dispose: (_, AuthService authService) => authService.dispose(),
        ),
      ],
      child: AuthWidgetBuilder(
        builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: TextTheme(
                display1: TextStyle(
                  color: Colors.white,
                ),
              ),
              scaffoldBackgroundColor: Color.fromRGBO(84, 81, 100, 1.0),
            ),
            home: AuthWidget(userSnapshot: userSnapshot),
          );
        },
      ),
    );
  }
}

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  getCounter() => _counter;

  setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterModel.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: counterModel.getCounter() % 2 == 0 ? Colors.red : Colors.blue,
            onPressed: counterModel.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
          FloatingActionButton(
            backgroundColor: counterModel.getCounter() % 2 == 1 ? Colors.red : Colors.blue,
            onPressed: counterModel.decrementCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ],
      ),
    );
  }
}
