import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_entry_widget.dart' show NewEntryWidget;
import 'package:flutter/material.dart';

class NewEntryModel extends FlutterFlowModel<NewEntryWidget> {
  ///  Local state fields for this page.

  List<String> tagSelection = [];
  void addToTagSelection(String item) => tagSelection.add(item);
  void removeFromTagSelection(String item) => tagSelection.remove(item);
  void removeAtIndexFromTagSelection(int index) => tagSelection.removeAt(index);
  void insertAtIndexInTagSelection(int index, String item) =>
      tagSelection.insert(index, item);
  void updateTagSelectionAtIndex(int index, Function(String) updateFn) =>
      tagSelection[index] = updateFn(tagSelection[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
  // State field(s) for Checkbox widget.
  bool? checkboxValue6;
  // State field(s) for Checkbox widget.
  bool? checkboxValue7;
  // State field(s) for Checkbox widget.
  bool? checkboxValue8;
  // State field(s) for Checkbox widget.
  bool? checkboxValue9;
  // State field(s) for Checkbox widget.
  bool? checkboxValue10;
  // State field(s) for Checkbox widget.
  bool? checkboxValue11;
  // State field(s) for Checkbox widget.
  bool? checkboxValue12;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EntryRecord? next;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
