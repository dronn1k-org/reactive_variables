import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

extension OnWidget on Widget {
  Obs observe(List<RvInterface> rvList) =>
      Obs(rvList: rvList, builder: (context) => this);
}
