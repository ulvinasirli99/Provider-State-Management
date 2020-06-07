import 'package:flutter/material.dart';
import 'package:flutterstatemanagment/screens/weight_page.dart';
import 'package:flutterstatemanagment/states/weight_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Provider Management',
        home: WeightPage(),
      ),
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider(builder: (context)=>WeightState(),)
      ],
    );
  }
}
