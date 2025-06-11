import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'join_family_widget.dart' show JoinFamilyWidget;
import 'package:flutter/material.dart';

class JoinFamilyModel extends FlutterFlowModel<JoinFamilyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for InvitationCode widget.
  TextEditingController? invitationCode;
  FocusNode? invitationCodeFocusNode;
  String? Function(BuildContext, String?)? invitationCodeValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FamiliesRecord? familyToJoin;

  @override
  void initState(BuildContext context) {
    invitationCode = TextEditingController();
  }

  @override
  void dispose() {
    invitationCodeFocusNode?.dispose();
    invitationCode?.dispose();
  }
}
