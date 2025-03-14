import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_of_users_widget.dart' show ListOfUsersWidget;
import 'package:flutter/material.dart';

class ListOfUsersModel extends FlutterFlowModel<ListOfUsersWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
