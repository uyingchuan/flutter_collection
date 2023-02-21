import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Make child widget measurable
class Measurable extends SingleChildRenderObjectWidget {
  const Measurable({Key? key, required this.onChange, required Widget child})
      : super(key: key, child: child);

  final void Function(Size size) onChange;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      MeasureSizeRenderObject(onChange);
}

class MeasureSizeRenderObject extends RenderProxyBox {
  MeasureSizeRenderObject(this.onChange);

  void Function(Size size) onChange;

  Size _preSize = Size.zero;

  @override
  void performLayout() {
    super.performLayout();
    Size newSize = child?.size ?? Size.zero;
    if (_preSize == newSize) return;
    _preSize = newSize;
    scheduleMicrotask(() => onChange(newSize));
  }
}
