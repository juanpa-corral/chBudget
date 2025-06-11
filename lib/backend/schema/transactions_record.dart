import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "is_personal" field.
  bool? _isPersonal;
  bool get isPersonal => _isPersonal ?? false;
  bool hasIsPersonal() => _isPersonal != null;

  // "recorded_by" field.
  DocumentReference? _recordedBy;
  DocumentReference? get recordedBy => _recordedBy;
  bool hasRecordedBy() => _recordedBy != null;

  // "card_ref" field.
  DocumentReference? _cardRef;
  DocumentReference? get cardRef => _cardRef;
  bool hasCardRef() => _cardRef != null;

  // "family_id" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  void _initializeFields() {
    _amount = castToType<double>(snapshotData['amount']);
    _category = snapshotData['category'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _isPersonal = snapshotData['is_personal'] as bool?;
    _recordedBy = snapshotData['recorded_by'] as DocumentReference?;
    _cardRef = snapshotData['card_ref'] as DocumentReference?;
    _familyId = snapshotData['family_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  double? amount,
  String? category,
  DateTime? date,
  String? description,
  bool? isPersonal,
  DocumentReference? recordedBy,
  DocumentReference? cardRef,
  DocumentReference? familyId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'category': category,
      'date': date,
      'description': description,
      'is_personal': isPersonal,
      'recorded_by': recordedBy,
      'card_ref': cardRef,
      'family_id': familyId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.category == e2?.category &&
        e1?.date == e2?.date &&
        e1?.description == e2?.description &&
        e1?.isPersonal == e2?.isPersonal &&
        e1?.recordedBy == e2?.recordedBy &&
        e1?.cardRef == e2?.cardRef &&
        e1?.familyId == e2?.familyId;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.category,
        e?.date,
        e?.description,
        e?.isPersonal,
        e?.recordedBy,
        e?.cardRef,
        e?.familyId
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
