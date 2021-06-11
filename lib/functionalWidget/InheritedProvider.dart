import 'package:flutter/cupertino.dart';

class InheritedProvider<L> extends InheritedWidget {
  final L data;

  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedProvider<L> old) {
    return true;
  }
}

class _Provider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data;
  
  static T of<T>(BuildContext context) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider =  context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
    return provider.data;
  }
  
  _Provider({
    Key key,
    this.data,
    this.child,
  })

  @override
  _state<T> createState() => _state<T>();
}

class _state<T extends ChangeNotifier> extends State<_Provider<T>> {
  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(data: widget.data, child: widget.child,);
  }
}