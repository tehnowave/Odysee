import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TravelRecord extends FirestoreRecord {
  TravelRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "travelImage" field.
  String? _travelImage;
  String get travelImage => _travelImage ?? '';
  bool hasTravelImage() => _travelImage != null;

  // "travelName" field.
  String? _travelName;
  String get travelName => _travelName ?? '';
  bool hasTravelName() => _travelName != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "ratingList" field.
  List<int>? _ratingList;
  List<int> get ratingList => _ratingList ?? const [];
  bool hasRatingList() => _ratingList != null;

  // "countryRef" field.
  DocumentReference? _countryRef;
  DocumentReference? get countryRef => _countryRef;
  bool hasCountryRef() => _countryRef != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "ownerId" field.
  DocumentReference? _ownerId;
  DocumentReference? get ownerId => _ownerId;
  bool hasOwnerId() => _ownerId != null;

  void _initializeFields() {
    _travelImage = snapshotData['travelImage'] as String?;
    _travelName = snapshotData['travelName'] as String?;
    _images = getDataList(snapshotData['images']);
    _description = snapshotData['description'] as String?;
    _ratingList = getDataList(snapshotData['ratingList']);
    _countryRef = snapshotData['countryRef'] as DocumentReference?;
    _location = snapshotData['location'] as LatLng?;
    _ownerId = snapshotData['ownerId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('travel');

  static Stream<TravelRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TravelRecord.fromSnapshot(s));

  static Future<TravelRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TravelRecord.fromSnapshot(s));

  static TravelRecord fromSnapshot(DocumentSnapshot snapshot) => TravelRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TravelRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TravelRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TravelRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TravelRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTravelRecordData({
  String? travelImage,
  String? travelName,
  String? description,
  DocumentReference? countryRef,
  LatLng? location,
  DocumentReference? ownerId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'travelImage': travelImage,
      'travelName': travelName,
      'description': description,
      'countryRef': countryRef,
      'location': location,
      'ownerId': ownerId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TravelRecordDocumentEquality implements Equality<TravelRecord> {
  const TravelRecordDocumentEquality();

  @override
  bool equals(TravelRecord? e1, TravelRecord? e2) {
    const listEquality = ListEquality();
    return e1?.travelImage == e2?.travelImage &&
        e1?.travelName == e2?.travelName &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.ratingList, e2?.ratingList) &&
        e1?.countryRef == e2?.countryRef &&
        e1?.location == e2?.location &&
        e1?.ownerId == e2?.ownerId;
  }

  @override
  int hash(TravelRecord? e) => const ListEquality().hash([
        e?.travelImage,
        e?.travelName,
        e?.images,
        e?.description,
        e?.ratingList,
        e?.countryRef,
        e?.location,
        e?.ownerId
      ]);

  @override
  bool isValidKey(Object? o) => o is TravelRecord;
}
