import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_expense_form_widget.dart' show AddExpenseFormWidget;
import 'package:flutter/material.dart';

class AddExpenseFormModel extends FlutterFlowModel<AddExpenseFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // State field(s) for date widget.
  DateTimeRange? dateSelectedDay;
  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for typeOfTransaction widget.
  FormFieldController<List<String>>? typeOfTransactionValueController;
  String? get typeOfTransactionValue =>
      typeOfTransactionValueController?.value?.firstOrNull;
  set typeOfTransactionValue(String? val) =>
      typeOfTransactionValueController?.value = val != null ? [val] : [];
  // State field(s) for card widget.
  String? cardValue;
  FormFieldController<String>? cardValueController;

  @override
  void initState(BuildContext context) {
    dateSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
