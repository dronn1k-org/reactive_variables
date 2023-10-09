import 'package:flutter/material.dart';

import '../reactive_variables.dart';

class Obs extends StatefulWidget {
  final List<RvInterface> rvList;
  final WidgetBuilder builder;

  const Obs({
    Key? key,
    required this.rvList,
    required this.builder,
  }) : super(key: key);

  @override
  State<Obs> createState() => _ObsState();
}

class _ObsState extends State<Obs> {
  @override
  void initState() {
    for (final element in widget.rvList) {
      element.addListener(_listener);
    }
    super.initState();
  }

  @override
  void dispose() {
    for (final element in widget.rvList) {
      element.removeListener(_listener);
    }
    super.dispose();
  }

  void _listener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(context);
  }
}
