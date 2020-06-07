import 'package:flutter/material.dart';
import 'package:flutterstatemanagment/models/weight.dart';
import 'package:flutterstatemanagment/states/weight_state.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class WeightPage extends StatefulWidget {
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
      ),
      body: Consumer<WeightState>(
        builder: (context, state, widget) {
          var weights = state.weights;
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Current Weight',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            weights.first.value.toString(),
                            textScaleFactor: 2,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      var weight = weights[index];
                      return ListTile(
                        title: Text(
                            "${weight.time.day}.${weight.time.month}.${weight.time.year}"),
                        trailing: Text(
                          weight.value.toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    itemCount: weights.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () async {
          var state = Provider.of<WeightState>(context, listen: false);
          var result = await showDialog<double>(
              context: context,
              builder: (context) => NumberPickerDialog.decimal(
                  minValue: 1, maxValue: 200, initialDoubleValue: state.weights.first.value));

          if (result != null && result > 0) {
            state
              ..add(
                Weight(
                  value: result,
                  time: DateTime.now(),
                ),
              );
          }
        },
        child: Icon(
          Icons.line_weight,
          color: Colors.black,
        ),
      ),
    );
  }
}
