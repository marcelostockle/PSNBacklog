import 'dart:async';

import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EntryRecord extends FirestoreRecord {
  EntryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "HundredPS5" field.
  bool? _hundredPS5;
  bool get hundredPS5 => _hundredPS5 ?? false;
  bool hasHundredPS5() => _hundredPS5 != null;

  // "HundredPS4" field.
  bool? _hundredPS4;
  bool get hundredPS4 => _hundredPS4 ?? false;
  bool hasHundredPS4() => _hundredPS4 != null;

  // "PlatPS5" field.
  bool? _platPS5;
  bool get platPS5 => _platPS5 ?? false;
  bool hasPlatPS5() => _platPS5 != null;

  // "PlatPS4" field.
  bool? _platPS4;
  bool get platPS4 => _platPS4 ?? false;
  bool hasPlatPS4() => _platPS4 != null;

  // "Abandoned" field.
  bool? _abandoned;
  bool get abandoned => _abandoned ?? false;
  bool hasAbandoned() => _abandoned != null;

  // "PS5" field.
  bool? _ps5;
  bool get ps5 => _ps5 ?? false;
  bool hasPs5() => _ps5 != null;

  // "PS4" field.
  bool? _ps4;
  bool get ps4 => _ps4 ?? false;
  bool hasPs4() => _ps4 != null;

  // "VRRequired" field.
  bool? _vRRequired;
  bool get vRRequired => _vRRequired ?? false;
  bool hasVRRequired() => _vRRequired != null;

  // "Wishlist" field.
  bool? _wishlist;
  bool get wishlist => _wishlist ?? false;
  bool hasWishlist() => _wishlist != null;

  // "PlusEssential" field.
  bool? _plusEssential;
  bool get plusEssential => _plusEssential ?? false;
  bool hasPlusEssential() => _plusEssential != null;

  // "PlusExtra" field.
  bool? _plusExtra;
  bool get plusExtra => _plusExtra ?? false;
  bool hasPlusExtra() => _plusExtra != null;

  // "PlusExpired" field.
  bool? _plusExpired;
  bool get plusExpired => _plusExpired ?? false;
  bool hasPlusExpired() => _plusExpired != null;

  // "Tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _hundredPS5 = snapshotData['HundredPS5'] as bool?;
    _hundredPS4 = snapshotData['HundredPS4'] as bool?;
    _platPS5 = snapshotData['PlatPS5'] as bool?;
    _platPS4 = snapshotData['PlatPS4'] as bool?;
    _abandoned = snapshotData['Abandoned'] as bool?;
    _ps5 = snapshotData['PS5'] as bool?;
    _ps4 = snapshotData['PS4'] as bool?;
    _vRRequired = snapshotData['VRRequired'] as bool?;
    _wishlist = snapshotData['Wishlist'] as bool?;
    _plusEssential = snapshotData['PlusEssential'] as bool?;
    _plusExtra = snapshotData['PlusExtra'] as bool?;
    _plusExpired = snapshotData['PlusExpired'] as bool?;
    _tags = getDataList(snapshotData['Tags']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Entry');

  static Stream<EntryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EntryRecord.fromSnapshot(s));

  static Future<EntryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EntryRecord.fromSnapshot(s));

  static EntryRecord fromSnapshot(DocumentSnapshot snapshot) => EntryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EntryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EntryRecord._(reference, mapFromFirestore(data));

  static EntryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EntryRecord.getDocumentFromData(
        {
          'Title': snapshot.data['Title'],
          'HundredPS5': snapshot.data['HundredPS5'],
          'HundredPS4': snapshot.data['HundredPS4'],
          'PlatPS5': snapshot.data['PlatPS5'],
          'PlatPS4': snapshot.data['PlatPS4'],
          'Abandoned': snapshot.data['Abandoned'],
          'PS5': snapshot.data['PS5'],
          'PS4': snapshot.data['PS4'],
          'VRRequired': snapshot.data['VRRequired'],
          'Wishlist': snapshot.data['Wishlist'],
          'PlusEssential': snapshot.data['PlusEssential'],
          'PlusExtra': snapshot.data['PlusExtra'],
          'PlusExpired': snapshot.data['PlusExpired'],
          'Tags': safeGet(
            () => snapshot.data['Tags'].toList(),
          ),
        },
        EntryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EntryRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Entry',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'EntryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EntryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEntryRecordData({
  String? title,
  bool? hundredPS5,
  bool? hundredPS4,
  bool? platPS5,
  bool? platPS4,
  bool? abandoned,
  bool? ps5,
  bool? ps4,
  bool? vRRequired,
  bool? wishlist,
  bool? plusEssential,
  bool? plusExtra,
  bool? plusExpired,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'HundredPS5': hundredPS5,
      'HundredPS4': hundredPS4,
      'PlatPS5': platPS5,
      'PlatPS4': platPS4,
      'Abandoned': abandoned,
      'PS5': ps5,
      'PS4': ps4,
      'VRRequired': vRRequired,
      'Wishlist': wishlist,
      'PlusEssential': plusEssential,
      'PlusExtra': plusExtra,
      'PlusExpired': plusExpired,
    }.withoutNulls,
  );

  return firestoreData;
}

class EntryRecordDocumentEquality implements Equality<EntryRecord> {
  const EntryRecordDocumentEquality();

  @override
  bool equals(EntryRecord? e1, EntryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.hundredPS5 == e2?.hundredPS5 &&
        e1?.hundredPS4 == e2?.hundredPS4 &&
        e1?.platPS5 == e2?.platPS5 &&
        e1?.platPS4 == e2?.platPS4 &&
        e1?.abandoned == e2?.abandoned &&
        e1?.ps5 == e2?.ps5 &&
        e1?.ps4 == e2?.ps4 &&
        e1?.vRRequired == e2?.vRRequired &&
        e1?.wishlist == e2?.wishlist &&
        e1?.plusEssential == e2?.plusEssential &&
        e1?.plusExtra == e2?.plusExtra &&
        e1?.plusExpired == e2?.plusExpired &&
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(EntryRecord? e) => const ListEquality().hash([
        e?.title,
        e?.hundredPS5,
        e?.hundredPS4,
        e?.platPS5,
        e?.platPS4,
        e?.abandoned,
        e?.ps5,
        e?.ps4,
        e?.vRRequired,
        e?.wishlist,
        e?.plusEssential,
        e?.plusExtra,
        e?.plusExpired,
        e?.tags
      ]);

  @override
  bool isValidKey(Object? o) => o is EntryRecord;
}
