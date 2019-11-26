import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter/page/CounterPage.dart';
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
              heroTag: "two",
              child: Icon(Icons.add),
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(
                    CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "one",
              child: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  //这里使用.value构造函数，
//                  builder: (context) => BlocProvider.value(
//                    value: BlocProvider.of<CounterBloc>(context),
//                    child: CounterPage(),
//                  ),
//                //这里使用new构造，但是使用同一个bloc
//                  builder: (context) => BlocProvider(
//                    builder: (context) => BlocProvider.of<CounterBloc>(context),
//                    child: CounterPage(),
//                  ),
                  //这里使用new Provider，new Bloc
                  builder: (context) =>
                      BlocProvider(
                        builder: (_) => CounterBloc(),
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
