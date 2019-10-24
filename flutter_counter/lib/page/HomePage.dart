import 'package:flutter/material.dart';
import 'package:flutter_app/page/CounterPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/CounterBloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "one",
              child: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<CounterBloc>(context),
                    child: CounterPage(),
                  ),
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
