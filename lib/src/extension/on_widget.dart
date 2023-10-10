import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

/// Extension to provide additional method for `Widget`.
extension OnWidget on Widget {
  /// Wraps the widget with an `Obs` widget that reacts to changes in a list of `RvInterface` items.
  ///
  /// [rvList] - List of reactive variables to observe. When any of these reactive variables change,
  /// the widget is rebuilt.
  Obs observe(List<RvInterface> rvList) =>
      Obs(rvList: rvList, builder: (context) => this);
}
