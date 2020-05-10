import 'package:emailapp/Overseer.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {

  final Overseer data;

  Provider({Key key, Widget child, this.data}) : super(key:key, child: child);

  static Overseer of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().data;
    //return (context.inheritFromWidgetOfExactType(Overseer) as Provider).data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

}