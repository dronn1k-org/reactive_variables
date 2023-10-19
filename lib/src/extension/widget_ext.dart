part of '../observer.dart';

/// Extension to provide additional method for `Widget`.
extension WidgetExt on Widget {
  /// Wraps the widget with an `Obs` widget that reacts to changes in a list of `RvInterface` items.
  ///
  /// [rvList] - List of reactive variables to observe. When any of these reactive variables change,
  /// the widget is rebuilt.
  Widget observe(List<AbstractRv> rvList, [Key? key]) {
    log('I have been called from here',
        stackTrace: StackTrace.current, sequenceNumber: 10, level: 10);
    return Obs(key: key, rvList: rvList, builder: (context) => this);
  }

  Widget center() => Center(
        child: this,
      );
}
