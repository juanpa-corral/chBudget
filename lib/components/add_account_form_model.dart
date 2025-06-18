import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_account_form_widget.dart' show AddAccountFormWidget;
import 'package:flutter/material.dart';

class AddAccountFormModel extends FlutterFlowModel<AddAccountFormWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for type widget.
  FormFieldController<List<String>>? typeValueController;
  String? get typeValue => typeValueController?.value?.firstOrNull;
  set typeValue(String? val) =>
      typeValueController?.value = val != null ? [val] : [];
  // State field(s) for AliasAccount widget.
  FocusNode? aliasAccountFocusNode;
  TextEditingController? aliasAccountTextController;
  String? Function(BuildContext, String?)? aliasAccountTextControllerValidator;
  // State field(s) for Te widget.
  FocusNode? teFocusNode;
  TextEditingController? teTextController;
  String? Function(BuildContext, String?)? teTextControllerValidator;
  // State field(s) for Network widget.
  String? networkValue;
  FormFieldController<String>? networkValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    aliasAccountFocusNode?.dispose();
    aliasAccountTextController?.dispose();

    teFocusNode?.dispose();
    teTextController?.dispose();
  }
}
