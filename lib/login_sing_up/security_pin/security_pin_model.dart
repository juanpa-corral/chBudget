import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'security_pin_widget.dart' show SecurityPinWidget;
import 'package:flutter/material.dart';

class SecurityPinModel extends FlutterFlowModel<SecurityPinWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
