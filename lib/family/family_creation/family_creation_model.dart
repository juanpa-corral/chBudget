import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'family_creation_widget.dart' show FamilyCreationWidget;
import 'package:flutter/material.dart';

class FamilyCreationModel extends FlutterFlowModel<FamilyCreationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for FamilyNameField widget.
  FocusNode? familyNameFieldFocusNode;
  TextEditingController? familyNameFieldTextController;
  String? Function(BuildContext, String?)?
      familyNameFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in CreateFamily widget.
  FamiliesRecord? newFamily;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    familyNameFieldFocusNode?.dispose();
    familyNameFieldTextController?.dispose();
  }
}
