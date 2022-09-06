import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Template Coleta',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: MyHomePage(
        title: 'App Template Coleta',
        analytics: analytics,
        observer: observer,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.analytics,
    required this.observer,
  }) : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = '';

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<void> _viewItemList() async {
    await widget.analytics.logEvent(
      name: 'view_item_list',
      parameters: {
        'screenName': "/view_item_list/array_items",
        'items': [
          {
            'item_id': '12345678',
            'item_name': 'sofa',
            'item_category': 'moveis',
            'item_variant': 'preto',
            'item_brand': 'tokstok',
            'price': '2132.47',
            'currency': 'brl',
            'index': '1'
          },
          {
            'item_id': '87654321',
            'item_name': 'cama',
            'item_category': 'quarto',
            'item_variant': 'azul',
            'item_brand': 'magalu',
            'price': '1567.98',
            'currency': 'brl',
            'index': '2'
          }
        ],
      },
    );
  }

  Future<void> _selectItem() async {
    await widget.analytics.logEvent(
      name: 'select_item',
      parameters: {
        'screenName': "/testeUA_SchemaGA4",
        'item_list_name': 'Teste UA Schema GA4',
        'items': [
          {
            'item_id': '12345678',
            'item_name': 'sofa',
            'item_category': 'moveis',
            'item_variant': 'preto',
            'item_brand': 'tokstok',
            'price': '2132.47',
            'currency': 'brl',
            'index': '1'
          }
        ],
      },
    );
  }

  Future<void> _purchase() async {
    await widget.analytics.logEvent(
      name: 'purchase',
      parameters: {
        'screenName': "/purchase",
        'transaction_id': '123456',
        'items': [
          {
            'item_id': '12345678',
            'item_name': 'sofa',
            'item_category': 'moveis',
            'item_variant': 'preto',
            'item_brand': 'tokstok',
            'price': '2132.47',
            'currency': 'brl',
            'index': '1'
          },
          {
            'item_id': '87654321',
            'item_name': 'cama',
            'item_category': 'quarto',
            'item_variant': 'azul',
            'item_brand': 'magalu',
            'price': '1567.98',
            'currency': 'brl',
            'index': '2'
          }
        ],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: _viewItemList,
            child: const Text('View Item List'),
          ),
          MaterialButton(
            onPressed: _selectItem,
            child: const Text('Select Item'),
          ),
          MaterialButton(
            onPressed: _purchase,
            child: const Text('Purchase'),
          ),
          Text(_message,
              style: const TextStyle(color: Color.fromARGB(255, 0, 155, 0))),
        ],
      ),
    );
  }
}
