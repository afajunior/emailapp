import 'package:emailapp/CounterManager.dart';
import 'package:emailapp/Provider.dart';
import 'package:flutter/material.dart';

class FabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
    return FloatingActionButton(onPressed: manager.increment);
  }
}
