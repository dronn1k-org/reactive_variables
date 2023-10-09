import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

extension OnWidget on Widget {
  Obs observe(List<Rv<dynamic>> rvList) =>
      Obs(rvList: rvList, builder: () => this);
}
