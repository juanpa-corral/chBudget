import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailResetPassField widget.
  FocusNode? emailResetPassFieldFocusNode;
  TextEditingController? emailResetPassFieldTextController;
  String? Function(BuildContext, String?)?
      emailResetPassFieldTextControllerValidator;
  String? _emailResetPassFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't1ffpdp6' /* example@example.com is require... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? userDocument;

  @override
  void initState(BuildContext context) {
    emailResetPassFieldTextControllerValidator =
        _emailResetPassFieldTextControllerValidator;
  }

  @override
  void dispose() {
    emailResetPassFieldFocusNode?.dispose();
    emailResetPassFieldTextController?.dispose();
  }
}
