// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AttachmentStruct extends FFFirebaseStruct {
  AttachmentStruct({
    String? filename,
    String? path,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _filename = filename,
        _path = path,
        super(firestoreUtilData);

  // "filename" field.
  String? _filename;
  String get filename => _filename ?? '';
  set filename(String? val) => _filename = val;

  bool hasFilename() => _filename != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  static AttachmentStruct fromMap(Map<String, dynamic> data) =>
      AttachmentStruct(
        filename: data['filename'] as String?,
        path: data['path'] as String?,
      );

  static AttachmentStruct? maybeFromMap(dynamic data) => data is Map
      ? AttachmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'filename': _filename,
        'path': _path,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'filename': serializeParam(
          _filename,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
      }.withoutNulls;

  static AttachmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttachmentStruct(
        filename: deserializeParam(
          data['filename'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AttachmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttachmentStruct &&
        filename == other.filename &&
        path == other.path;
  }

  @override
  int get hashCode => const ListEquality().hash([filename, path]);
}

AttachmentStruct createAttachmentStruct({
  String? filename,
  String? path,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AttachmentStruct(
      filename: filename,
      path: path,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AttachmentStruct? updateAttachmentStruct(
  AttachmentStruct? attachment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    attachment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAttachmentStructData(
  Map<String, dynamic> firestoreData,
  AttachmentStruct? attachment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (attachment == null) {
    return;
  }
  if (attachment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && attachment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final attachmentData = getAttachmentFirestoreData(attachment, forFieldValue);
  final nestedData = attachmentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = attachment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAttachmentFirestoreData(
  AttachmentStruct? attachment, [
  bool forFieldValue = false,
]) {
  if (attachment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(attachment.toMap());

  // Add any Firestore field values
  attachment.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAttachmentListFirestoreData(
  List<AttachmentStruct>? attachments,
) =>
    attachments?.map((e) => getAttachmentFirestoreData(e, true)).toList() ?? [];
