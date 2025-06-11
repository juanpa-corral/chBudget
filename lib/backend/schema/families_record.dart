import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FamiliesRecord extends FirestoreRecord {
  FamiliesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admin_id" field.
  DocumentReference? _adminId;
  DocumentReference? get adminId => _adminId;
  bool hasAdminId() => _adminId != null;

  // "family_name" field.
  String? _familyName;
  String get familyName => _familyName ?? '';
  bool hasFamilyName() => _familyName != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "invitation_code" field.
  String? _invitationCode;
  String get invitationCode => _invitationCode ?? '';
  bool hasInvitationCode() => _invitationCode != null;

  void _initializeFields() {
    _adminId = snapshotData['admin_id'] as DocumentReference?;
    _familyName = snapshotData['family_name'] as String?;
    _members = getDataList(snapshotData['members']);
    _invitationCode = snapshotData['invitation_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('families');

  static Stream<FamiliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FamiliesRecord.fromSnapshot(s));

  static Future<FamiliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FamiliesRecord.fromSnapshot(s));

  static FamiliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FamiliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FamiliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FamiliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FamiliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FamiliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFamiliesRecordData({
  DocumentReference? adminId,
  String? familyName,
  String? invitationCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin_id': adminId,
      'family_name': familyName,
      'invitation_code': invitationCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class FamiliesRecordDocumentEquality implements Equality<FamiliesRecord> {
  const FamiliesRecordDocumentEquality();

  @override
  bool equals(FamiliesRecord? e1, FamiliesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.adminId == e2?.adminId &&
        e1?.familyName == e2?.familyName &&
        listEquality.equals(e1?.members, e2?.members) &&
        e1?.invitationCode == e2?.invitationCode;
  }

  @override
  int hash(FamiliesRecord? e) => const ListEquality()
      .hash([e?.adminId, e?.familyName, e?.members, e?.invitationCode]);

  @override
  bool isValidKey(Object? o) => o is FamiliesRecord;
}
