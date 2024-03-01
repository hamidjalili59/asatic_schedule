// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQueueModelCollection on Isar {
  IsarCollection<QueueModel> get queueModels => this.collection();
}

const QueueModelSchema = CollectionSchema(
  name: r'QueueModel',
  id: -1936520155659958650,
  properties: {
    r'lastTurn': PropertySchema(
      id: 0,
      name: r'lastTurn',
      type: IsarType.long,
    ),
    r'maxRange': PropertySchema(
      id: 1,
      name: r'maxRange',
      type: IsarType.long,
    ),
    r'minRange': PropertySchema(
      id: 2,
      name: r'minRange',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _queueModelEstimateSize,
  serialize: _queueModelSerialize,
  deserialize: _queueModelDeserialize,
  deserializeProp: _queueModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _queueModelGetId,
  getLinks: _queueModelGetLinks,
  attach: _queueModelAttach,
  version: '3.1.0+1',
);

int _queueModelEstimateSize(
  QueueModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _queueModelSerialize(
  QueueModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.lastTurn);
  writer.writeLong(offsets[1], object.maxRange);
  writer.writeLong(offsets[2], object.minRange);
  writer.writeString(offsets[3], object.name);
}

QueueModel _queueModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QueueModel(
    id: id,
    lastTurn: reader.readLongOrNull(offsets[0]),
    maxRange: reader.readLongOrNull(offsets[1]),
    minRange: reader.readLongOrNull(offsets[2]),
    name: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _queueModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _queueModelGetId(QueueModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _queueModelGetLinks(QueueModel object) {
  return [];
}

void _queueModelAttach(IsarCollection<dynamic> col, Id id, QueueModel object) {
  object.id = id;
}

extension QueueModelQueryWhereSort
    on QueryBuilder<QueueModel, QueueModel, QWhere> {
  QueryBuilder<QueueModel, QueueModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QueueModelQueryWhere
    on QueryBuilder<QueueModel, QueueModel, QWhereClause> {
  QueryBuilder<QueueModel, QueueModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QueueModelQueryFilter
    on QueryBuilder<QueueModel, QueueModel, QFilterCondition> {
  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> lastTurnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastTurn',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition>
      lastTurnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastTurn',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> lastTurnEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastTurn',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition>
      lastTurnGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastTurn',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> lastTurnLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastTurn',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> lastTurnBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastTurn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> maxRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxRange',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition>
      maxRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxRange',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> maxRangeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRange',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition>
      maxRangeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxRange',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> maxRangeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxRange',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> maxRangeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> minRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minRange',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition>
      minRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minRange',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> minRangeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minRange',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition>
      minRangeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minRange',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> minRangeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minRange',
        value: value,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> minRangeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension QueueModelQueryObject
    on QueryBuilder<QueueModel, QueueModel, QFilterCondition> {}

extension QueueModelQueryLinks
    on QueryBuilder<QueueModel, QueueModel, QFilterCondition> {}

extension QueueModelQuerySortBy
    on QueryBuilder<QueueModel, QueueModel, QSortBy> {
  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> sortByLastTurn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTurn', Sort.asc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> sortByLastTurnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTurn', Sort.desc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> sortByMaxRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRange', Sort.asc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> sortByMaxRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRange', Sort.desc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> sortByMinRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRange', Sort.asc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> sortByMinRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRange', Sort.desc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension QueueModelQuerySortThenBy
    on QueryBuilder<QueueModel, QueueModel, QSortThenBy> {
  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenByLastTurn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTurn', Sort.asc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenByLastTurnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTurn', Sort.desc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenByMaxRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRange', Sort.asc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenByMaxRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRange', Sort.desc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenByMinRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRange', Sort.asc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenByMinRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRange', Sort.desc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<QueueModel, QueueModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension QueueModelQueryWhereDistinct
    on QueryBuilder<QueueModel, QueueModel, QDistinct> {
  QueryBuilder<QueueModel, QueueModel, QDistinct> distinctByLastTurn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastTurn');
    });
  }

  QueryBuilder<QueueModel, QueueModel, QDistinct> distinctByMaxRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRange');
    });
  }

  QueryBuilder<QueueModel, QueueModel, QDistinct> distinctByMinRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minRange');
    });
  }

  QueryBuilder<QueueModel, QueueModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension QueueModelQueryProperty
    on QueryBuilder<QueueModel, QueueModel, QQueryProperty> {
  QueryBuilder<QueueModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QueueModel, int?, QQueryOperations> lastTurnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastTurn');
    });
  }

  QueryBuilder<QueueModel, int?, QQueryOperations> maxRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRange');
    });
  }

  QueryBuilder<QueueModel, int?, QQueryOperations> minRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minRange');
    });
  }

  QueryBuilder<QueueModel, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
