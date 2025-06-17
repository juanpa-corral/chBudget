import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_card_form_widget.dart' show AddCardFormWidget;
import 'package:flutter/material.dart';

class AddCardFormModel extends FlutterFlowModel<AddCardFormWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for AliasCard widget.
  FocusNode? aliasCardFocusNode;
  TextEditingController? aliasCardTextController;
  String? Function(BuildContext, String?)? aliasCardTextControllerValidator;
  // State field(s) for Te widget.
  FocusNode? teFocusNode;
  TextEditingController? teTextController;
  String? Function(BuildContext, String?)? teTextControllerValidator;
  // State field(s) for Network widget.
  String? networkValue;
  FormFieldController<String>? networkValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? selectedUserDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    aliasCardFocusNode?.dispose();
    aliasCardTextController?.dispose();

    teFocusNode?.dispose();
    teTextController?.dispose();
  }
}
