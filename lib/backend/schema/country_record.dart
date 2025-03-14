import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountryRecord extends FirestoreRecord {
  CountryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "countryName" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  bool hasCountryName() => _countryName != null;

  // "flag" field.
  String? _flag;
  String get flag => _flag ?? '';
  bool hasFlag() => _flag != null;

  void _initializeFields() {
    _countryName = snapshotData['countryName'] as String?;
    _flag = snapshotData['flag'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Country');

  static Stream<CountryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountryRecord.fromSnapshot(s));

  static Future<CountryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountryRecord.fromSnapshot(s));

  static CountryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountryRecordData({
  String? countryName,
  String? flag,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'countryName': countryName,
      'flag': flag,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountryRecordDocumentEquality implements Equality<CountryRecord> {
  const CountryRecordDocumentEquality();

  @override
  bool equals(CountryRecord? e1, CountryRecord? e2) {
    return e1?.countryName == e2?.countryName && e1?.flag == e2?.flag;
  }

  @override
  int hash(CountryRecord? e) =>
      const ListEquality().hash([e?.countryName, e?.flag]);

  @override
  bool isValidKey(Object? o) => o is CountryRecord;
}
