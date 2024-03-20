import 'package:flutter/material.dart';

import '../reactive_variables.dart';

/// Obs widget listens to changes in a list of reactive variables (Rv)
/// and rebuilds its child widget when any of the Rvs change.
class Obs extends StatefulWidget {
  /// A list of reactive variables to which this widget should listen.
  final List<AbstractRv> rvList;

  /// The builder function to create the child widget.
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
    _addListeners(widget.rvList);
    super.initState();
  }

  @override
  void dispose() {
    _removeListeners(widget.rvList);
    super.dispose();
  }

  /// Add a listener to each reactive variable in the list.
  void _addListeners(List<AbstractRv> rvList) {
    for (final element in rvList) {
      element.addListener(_listener);
    }
  }

  /// Remove the listener from each reactive variable in the list.
  void _removeListeners(List<AbstractRv> rvList) {
    for (final element in widget.rvList) {
      element.removeListener(_listener);
    }
  }

  /// The listener callback that triggers a rebuild when any of the Rvs change.
  void _listener() {
    // Ensure the widget is still in the widget tree before calling setState.
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(Obs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rvList != widget.rvList) {
      _removeListeners(oldWidget.rvList);
      _addListeners(widget.rvList);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the builder function to create the child widget.
    return widget.builder.call(context);
  }
}
