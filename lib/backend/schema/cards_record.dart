import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardsRecord extends FirestoreRecord {
  CardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "card_alias" field.
  String? _cardAlias;
  String get cardAlias => _cardAlias ?? '';
  bool hasCardAlias() => _cardAlias != null;

  // "las_4_digits" field.
  String? _las4Digits;
  String get las4Digits => _las4Digits ?? '';
  bool hasLas4Digits() => _las4Digits != null;

  // "is_personal" field.
  bool? _isPersonal;
  bool get isPersonal => _isPersonal ?? false;
  bool hasIsPersonal() => _isPersonal != null;

  // "owner_id" field.
  DocumentReference? _ownerId;
  DocumentReference? get ownerId => _ownerId;
  bool hasOwnerId() => _ownerId != null;

  // "family_id" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  // "network" field.
  String? _network;
  String get network => _network ?? '';
  bool hasNetwork() => _network != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  void _initializeFields() {
    _cardAlias = snapshotData['card_alias'] as String?;
    _las4Digits = snapshotData['las_4_digits'] as String?;
    _isPersonal = snapshotData['is_personal'] as bool?;
    _ownerId = snapshotData['owner_id'] as DocumentReference?;
    _familyId = snapshotData['family_id'] as DocumentReference?;
    _network = snapshotData['network'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cards');

  static Stream<CardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardsRecord.fromSnapshot(s));

  static Future<CardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardsRecord.fromSnapshot(s));

  static CardsRecord fromSnapshot(DocumentSnapshot snapshot) => CardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardsRecordData({
  String? cardAlias,
  String? las4Digits,
  bool? isPersonal,
  DocumentReference? ownerId,
  DocumentReference? familyId,
  String? network,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'card_alias': cardAlias,
      'las_4_digits': las4Digits,
      'is_personal': isPersonal,
      'owner_id': ownerId,
      'family_id': familyId,
      'network': network,
      'is_active': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardsRecordDocumentEquality implements Equality<CardsRecord> {
  const CardsRecordDocumentEquality();

  @override
  bool equals(CardsRecord? e1, CardsRecord? e2) {
    return e1?.cardAlias == e2?.cardAlias &&
        e1?.las4Digits == e2?.las4Digits &&
        e1?.isPersonal == e2?.isPersonal &&
        e1?.ownerId == e2?.ownerId &&
        e1?.familyId == e2?.familyId &&
        e1?.network == e2?.network &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(CardsRecord? e) => const ListEquality().hash([
        e?.cardAlias,
        e?.las4Digits,
        e?.isPersonal,
        e?.ownerId,
        e?.familyId,
        e?.network,
        e?.isActive
      ]);

  @override
  bool isValidKey(Object? o) => o is CardsRecord;
}
