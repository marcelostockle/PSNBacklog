import '/flutter_flow/flutter_flow_util.dart';
import 'tags_dropdown_widget.dart' show TagsDropdownWidget;
import 'package:flutter/material.dart';

class TagsDropdownModel extends FlutterFlowModel<TagsDropdownWidget> {
  ///  Local state fields for this component.

  List<String> filter = [];
  void addToFilter(String item) => filter.add(item);
  void removeFromFilter(String item) => filter.remove(item);
  void removeAtIndexFromFilter(int index) => filter.removeAt(index);
  void insertAtIndexInFilter(int index, String item) =>
      filter.insert(index, item);
  void updateFilterAtIndex(int index, Function(String) updateFn) =>
      filter[index] = updateFn(filter[index]);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
