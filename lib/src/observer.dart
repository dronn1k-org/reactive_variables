import 'dart:async';

import 'package:flutter/material.dart';

import 'variable.dart';

class Obs extends StatefulWidget {
  final List<Rv> rvList;
  final Widget Function() builder;

  const Obs({
    Key? key,
    required this.rvList,
    required this.builder,
  }) : super(key: key);

  @override
  State<Obs> createState() => _ObsState();
}

class _ObsState extends State<Obs> {
  final List<StreamSubscription> _subList = [];

  @override
  void initState() {
    for (var element in widget.rvList) {
      _subList.add(element.listen((value) {
        if (mounted) {
          setState(() {});
        }
      }));
    }
    super.initState();
  }

  @override
  void dispose() {
    for (var element in _subList) {
      element.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call();
  }
}
