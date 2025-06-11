import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FullNameField widget.
  FocusNode? fullNameFieldFocusNode;
  TextEditingController? fullNameFieldTextController;
  String? Function(BuildContext, String?)? fullNameFieldTextControllerValidator;
  // State field(s) for NumberField widget.
  FocusNode? numberFieldFocusNode;
  TextEditingController? numberFieldTextController;
  late MaskTextInputFormatter numberFieldMask;
  String? Function(BuildContext, String?)? numberFieldTextControllerValidator;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nowqgphd' /* example@example.com is require... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  String? _passwordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hf6isse5' /* *  *  *  *  *  *  *  *  is req... */,
      );
    }

    return null;
  }

  // State field(s) for ConfirmPassField widget.
  FocusNode? confirmPassFieldFocusNode;
  TextEditingController? confirmPassFieldTextController;
  late bool confirmPassFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPassFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldTextControllerValidator =
        _passwordFieldTextControllerValidator;
    confirmPassFieldVisibility = false;
  }

  @override
  void dispose() {
    fullNameFieldFocusNode?.dispose();
    fullNameFieldTextController?.dispose();

    numberFieldFocusNode?.dispose();
    numberFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();

    confirmPassFieldFocusNode?.dispose();
    confirmPassFieldTextController?.dispose();
  }
}
