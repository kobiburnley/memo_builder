library memo_builder;

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class MemoBuilder extends StatefulWidget {
  final List inputs;
  final WidgetBuilder builder;

  MemoBuilder(this.inputs, {@required this.builder});

  State<StatefulWidget> createState() => MemoBuilderState();
}

class MemoBuilderState extends State<MemoBuilder> {
  Widget lastResult;
  List lastInputs;

  Widget build(BuildContext context) {
    if (lastResult != null && const ListEquality().equals(lastInputs, widget.inputs)) {
      return lastResult;
    }

    lastResult = widget.builder(context);
    lastInputs = widget.inputs;

    return lastResult;
  }
}
