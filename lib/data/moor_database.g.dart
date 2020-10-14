// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final String F_PERSON_ID;
  final String F_PERSON;
  final String F_USERNAME;
  final String F_PASSWORD;
  User(
      {@required this.F_PERSON_ID,
      @required this.F_PERSON,
      @required this.F_USERNAME,
      @required this.F_PASSWORD});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      F_PERSON_ID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_person_id']),
      F_PERSON: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_person']),
      F_USERNAME: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_username']),
      F_PASSWORD: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_password']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || F_PERSON_ID != null) {
      map['f_person_id'] = Variable<String>(F_PERSON_ID);
    }
    if (!nullToAbsent || F_PERSON != null) {
      map['f_person'] = Variable<String>(F_PERSON);
    }
    if (!nullToAbsent || F_USERNAME != null) {
      map['f_username'] = Variable<String>(F_USERNAME);
    }
    if (!nullToAbsent || F_PASSWORD != null) {
      map['f_password'] = Variable<String>(F_PASSWORD);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      F_PERSON_ID: F_PERSON_ID == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PERSON_ID),
      F_PERSON: F_PERSON == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PERSON),
      F_USERNAME: F_USERNAME == null && nullToAbsent
          ? const Value.absent()
          : Value(F_USERNAME),
      F_PASSWORD: F_PASSWORD == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PASSWORD),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      F_PERSON_ID: serializer.fromJson<String>(json['F_PERSON_ID']),
      F_PERSON: serializer.fromJson<String>(json['F_PERSON']),
      F_USERNAME: serializer.fromJson<String>(json['F_USERNAME']),
      F_PASSWORD: serializer.fromJson<String>(json['F_PASSWORD']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'F_PERSON_ID': serializer.toJson<String>(F_PERSON_ID),
      'F_PERSON': serializer.toJson<String>(F_PERSON),
      'F_USERNAME': serializer.toJson<String>(F_USERNAME),
      'F_PASSWORD': serializer.toJson<String>(F_PASSWORD),
    };
  }

  User copyWith(
          {String F_PERSON_ID,
          String F_PERSON,
          String F_USERNAME,
          String F_PASSWORD}) =>
      User(
        F_PERSON_ID: F_PERSON_ID ?? this.F_PERSON_ID,
        F_PERSON: F_PERSON ?? this.F_PERSON,
        F_USERNAME: F_USERNAME ?? this.F_USERNAME,
        F_PASSWORD: F_PASSWORD ?? this.F_PASSWORD,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('F_PERSON_ID: $F_PERSON_ID, ')
          ..write('F_PERSON: $F_PERSON, ')
          ..write('F_USERNAME: $F_USERNAME, ')
          ..write('F_PASSWORD: $F_PASSWORD')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      F_PERSON_ID.hashCode,
      $mrjc(
          F_PERSON.hashCode, $mrjc(F_USERNAME.hashCode, F_PASSWORD.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.F_PERSON_ID == this.F_PERSON_ID &&
          other.F_PERSON == this.F_PERSON &&
          other.F_USERNAME == this.F_USERNAME &&
          other.F_PASSWORD == this.F_PASSWORD);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> F_PERSON_ID;
  final Value<String> F_PERSON;
  final Value<String> F_USERNAME;
  final Value<String> F_PASSWORD;
  const UsersCompanion({
    this.F_PERSON_ID = const Value.absent(),
    this.F_PERSON = const Value.absent(),
    this.F_USERNAME = const Value.absent(),
    this.F_PASSWORD = const Value.absent(),
  });
  UsersCompanion.insert({
    @required String F_PERSON_ID,
    @required String F_PERSON,
    @required String F_USERNAME,
    @required String F_PASSWORD,
  })  : F_PERSON_ID = Value(F_PERSON_ID),
        F_PERSON = Value(F_PERSON),
        F_USERNAME = Value(F_USERNAME),
        F_PASSWORD = Value(F_PASSWORD);
  static Insertable<User> custom({
    Expression<String> F_PERSON_ID,
    Expression<String> F_PERSON,
    Expression<String> F_USERNAME,
    Expression<String> F_PASSWORD,
  }) {
    return RawValuesInsertable({
      if (F_PERSON_ID != null) 'f_person_id': F_PERSON_ID,
      if (F_PERSON != null) 'f_person': F_PERSON,
      if (F_USERNAME != null) 'f_username': F_USERNAME,
      if (F_PASSWORD != null) 'f_password': F_PASSWORD,
    });
  }

  UsersCompanion copyWith(
      {Value<String> F_PERSON_ID,
      Value<String> F_PERSON,
      Value<String> F_USERNAME,
      Value<String> F_PASSWORD}) {
    return UsersCompanion(
      F_PERSON_ID: F_PERSON_ID ?? this.F_PERSON_ID,
      F_PERSON: F_PERSON ?? this.F_PERSON,
      F_USERNAME: F_USERNAME ?? this.F_USERNAME,
      F_PASSWORD: F_PASSWORD ?? this.F_PASSWORD,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (F_PERSON_ID.present) {
      map['f_person_id'] = Variable<String>(F_PERSON_ID.value);
    }
    if (F_PERSON.present) {
      map['f_person'] = Variable<String>(F_PERSON.value);
    }
    if (F_USERNAME.present) {
      map['f_username'] = Variable<String>(F_USERNAME.value);
    }
    if (F_PASSWORD.present) {
      map['f_password'] = Variable<String>(F_PASSWORD.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('F_PERSON_ID: $F_PERSON_ID, ')
          ..write('F_PERSON: $F_PERSON, ')
          ..write('F_USERNAME: $F_USERNAME, ')
          ..write('F_PASSWORD: $F_PASSWORD')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _F_PERSON_IDMeta =
      const VerificationMeta('F_PERSON_ID');
  GeneratedTextColumn _F_PERSON_ID;
  @override
  GeneratedTextColumn get F_PERSON_ID => _F_PERSON_ID ??= _constructFPersonId();
  GeneratedTextColumn _constructFPersonId() {
    return GeneratedTextColumn('f_person_id', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _F_PERSONMeta = const VerificationMeta('F_PERSON');
  GeneratedTextColumn _F_PERSON;
  @override
  GeneratedTextColumn get F_PERSON => _F_PERSON ??= _constructFPerson();
  GeneratedTextColumn _constructFPerson() {
    return GeneratedTextColumn(
      'f_person',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_USERNAMEMeta = const VerificationMeta('F_USERNAME');
  GeneratedTextColumn _F_USERNAME;
  @override
  GeneratedTextColumn get F_USERNAME => _F_USERNAME ??= _constructFUsername();
  GeneratedTextColumn _constructFUsername() {
    return GeneratedTextColumn(
      'f_username',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_PASSWORDMeta = const VerificationMeta('F_PASSWORD');
  GeneratedTextColumn _F_PASSWORD;
  @override
  GeneratedTextColumn get F_PASSWORD => _F_PASSWORD ??= _constructFPassword();
  GeneratedTextColumn _constructFPassword() {
    return GeneratedTextColumn(
      'f_password',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [F_PERSON_ID, F_PERSON, F_USERNAME, F_PASSWORD];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('f_person_id')) {
      context.handle(
          _F_PERSON_IDMeta,
          F_PERSON_ID.isAcceptableOrUnknown(
              data['f_person_id'], _F_PERSON_IDMeta));
    } else if (isInserting) {
      context.missing(_F_PERSON_IDMeta);
    }
    if (data.containsKey('f_person')) {
      context.handle(_F_PERSONMeta,
          F_PERSON.isAcceptableOrUnknown(data['f_person'], _F_PERSONMeta));
    } else if (isInserting) {
      context.missing(_F_PERSONMeta);
    }
    if (data.containsKey('f_username')) {
      context.handle(
          _F_USERNAMEMeta,
          F_USERNAME.isAcceptableOrUnknown(
              data['f_username'], _F_USERNAMEMeta));
    } else if (isInserting) {
      context.missing(_F_USERNAMEMeta);
    }
    if (data.containsKey('f_password')) {
      context.handle(
          _F_PASSWORDMeta,
          F_PASSWORD.isAcceptableOrUnknown(
              data['f_password'], _F_PASSWORDMeta));
    } else if (isInserting) {
      context.missing(_F_PASSWORDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {F_PERSON_ID};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Unit extends DataClass implements Insertable<Unit> {
  final String F_UNIT_ID;
  final String F_UNIT;
  final String F_REMARK;
  final String F_RECORDER;
  final int F_RECORD_TIME;
  final String F_PROJECT_ID;
  final bool changed;
  final bool inserted;
  final bool deleted;
  Unit(
      {@required this.F_UNIT_ID,
      @required this.F_UNIT,
      @required this.F_REMARK,
      @required this.F_RECORDER,
      @required this.F_RECORD_TIME,
      @required this.F_PROJECT_ID,
      @required this.changed,
      @required this.inserted,
      @required this.deleted});
  factory Unit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Unit(
      F_UNIT_ID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_unit_id']),
      F_UNIT:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}f_unit']),
      F_REMARK: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_remark']),
      F_RECORDER: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_recorder']),
      F_RECORD_TIME: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_record_time']),
      F_PROJECT_ID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_project_id']),
      changed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}changed']),
      inserted:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}inserted']),
      deleted:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || F_UNIT_ID != null) {
      map['f_unit_id'] = Variable<String>(F_UNIT_ID);
    }
    if (!nullToAbsent || F_UNIT != null) {
      map['f_unit'] = Variable<String>(F_UNIT);
    }
    if (!nullToAbsent || F_REMARK != null) {
      map['f_remark'] = Variable<String>(F_REMARK);
    }
    if (!nullToAbsent || F_RECORDER != null) {
      map['f_recorder'] = Variable<String>(F_RECORDER);
    }
    if (!nullToAbsent || F_RECORD_TIME != null) {
      map['f_record_time'] = Variable<int>(F_RECORD_TIME);
    }
    if (!nullToAbsent || F_PROJECT_ID != null) {
      map['f_project_id'] = Variable<String>(F_PROJECT_ID);
    }
    if (!nullToAbsent || changed != null) {
      map['changed'] = Variable<bool>(changed);
    }
    if (!nullToAbsent || inserted != null) {
      map['inserted'] = Variable<bool>(inserted);
    }
    if (!nullToAbsent || deleted != null) {
      map['deleted'] = Variable<bool>(deleted);
    }
    return map;
  }

  UnitsCompanion toCompanion(bool nullToAbsent) {
    return UnitsCompanion(
      F_UNIT_ID: F_UNIT_ID == null && nullToAbsent
          ? const Value.absent()
          : Value(F_UNIT_ID),
      F_UNIT:
          F_UNIT == null && nullToAbsent ? const Value.absent() : Value(F_UNIT),
      F_REMARK: F_REMARK == null && nullToAbsent
          ? const Value.absent()
          : Value(F_REMARK),
      F_RECORDER: F_RECORDER == null && nullToAbsent
          ? const Value.absent()
          : Value(F_RECORDER),
      F_RECORD_TIME: F_RECORD_TIME == null && nullToAbsent
          ? const Value.absent()
          : Value(F_RECORD_TIME),
      F_PROJECT_ID: F_PROJECT_ID == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PROJECT_ID),
      changed: changed == null && nullToAbsent
          ? const Value.absent()
          : Value(changed),
      inserted: inserted == null && nullToAbsent
          ? const Value.absent()
          : Value(inserted),
      deleted: deleted == null && nullToAbsent
          ? const Value.absent()
          : Value(deleted),
    );
  }

  factory Unit.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Unit(
      F_UNIT_ID: serializer.fromJson<String>(json['F_UNIT_ID']),
      F_UNIT: serializer.fromJson<String>(json['F_UNIT']),
      F_REMARK: serializer.fromJson<String>(json['F_REMARK']),
      F_RECORDER: serializer.fromJson<String>(json['F_RECORDER']),
      F_RECORD_TIME: serializer.fromJson<int>(json['F_RECORD_TIME']),
      F_PROJECT_ID: serializer.fromJson<String>(json['F_PROJECT_ID']),
      changed: serializer.fromJson<bool>(json['changed']),
      inserted: serializer.fromJson<bool>(json['inserted']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'F_UNIT_ID': serializer.toJson<String>(F_UNIT_ID),
      'F_UNIT': serializer.toJson<String>(F_UNIT),
      'F_REMARK': serializer.toJson<String>(F_REMARK),
      'F_RECORDER': serializer.toJson<String>(F_RECORDER),
      'F_RECORD_TIME': serializer.toJson<int>(F_RECORD_TIME),
      'F_PROJECT_ID': serializer.toJson<String>(F_PROJECT_ID),
      'changed': serializer.toJson<bool>(changed),
      'inserted': serializer.toJson<bool>(inserted),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  Unit copyWith(
          {String F_UNIT_ID,
          String F_UNIT,
          String F_REMARK,
          String F_RECORDER,
          int F_RECORD_TIME,
          String F_PROJECT_ID,
          bool changed,
          bool inserted,
          bool deleted}) =>
      Unit(
        F_UNIT_ID: F_UNIT_ID ?? this.F_UNIT_ID,
        F_UNIT: F_UNIT ?? this.F_UNIT,
        F_REMARK: F_REMARK ?? this.F_REMARK,
        F_RECORDER: F_RECORDER ?? this.F_RECORDER,
        F_RECORD_TIME: F_RECORD_TIME ?? this.F_RECORD_TIME,
        F_PROJECT_ID: F_PROJECT_ID ?? this.F_PROJECT_ID,
        changed: changed ?? this.changed,
        inserted: inserted ?? this.inserted,
        deleted: deleted ?? this.deleted,
      );
  @override
  String toString() {
    return (StringBuffer('Unit(')
          ..write('F_UNIT_ID: $F_UNIT_ID, ')
          ..write('F_UNIT: $F_UNIT, ')
          ..write('F_REMARK: $F_REMARK, ')
          ..write('F_RECORDER: $F_RECORDER, ')
          ..write('F_RECORD_TIME: $F_RECORD_TIME, ')
          ..write('F_PROJECT_ID: $F_PROJECT_ID, ')
          ..write('changed: $changed, ')
          ..write('inserted: $inserted, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      F_UNIT_ID.hashCode,
      $mrjc(
          F_UNIT.hashCode,
          $mrjc(
              F_REMARK.hashCode,
              $mrjc(
                  F_RECORDER.hashCode,
                  $mrjc(
                      F_RECORD_TIME.hashCode,
                      $mrjc(
                          F_PROJECT_ID.hashCode,
                          $mrjc(
                              changed.hashCode,
                              $mrjc(
                                  inserted.hashCode, deleted.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Unit &&
          other.F_UNIT_ID == this.F_UNIT_ID &&
          other.F_UNIT == this.F_UNIT &&
          other.F_REMARK == this.F_REMARK &&
          other.F_RECORDER == this.F_RECORDER &&
          other.F_RECORD_TIME == this.F_RECORD_TIME &&
          other.F_PROJECT_ID == this.F_PROJECT_ID &&
          other.changed == this.changed &&
          other.inserted == this.inserted &&
          other.deleted == this.deleted);
}

class UnitsCompanion extends UpdateCompanion<Unit> {
  final Value<String> F_UNIT_ID;
  final Value<String> F_UNIT;
  final Value<String> F_REMARK;
  final Value<String> F_RECORDER;
  final Value<int> F_RECORD_TIME;
  final Value<String> F_PROJECT_ID;
  final Value<bool> changed;
  final Value<bool> inserted;
  final Value<bool> deleted;
  const UnitsCompanion({
    this.F_UNIT_ID = const Value.absent(),
    this.F_UNIT = const Value.absent(),
    this.F_REMARK = const Value.absent(),
    this.F_RECORDER = const Value.absent(),
    this.F_RECORD_TIME = const Value.absent(),
    this.F_PROJECT_ID = const Value.absent(),
    this.changed = const Value.absent(),
    this.inserted = const Value.absent(),
    this.deleted = const Value.absent(),
  });
  UnitsCompanion.insert({
    @required String F_UNIT_ID,
    @required String F_UNIT,
    @required String F_REMARK,
    @required String F_RECORDER,
    @required int F_RECORD_TIME,
    @required String F_PROJECT_ID,
    this.changed = const Value.absent(),
    this.inserted = const Value.absent(),
    this.deleted = const Value.absent(),
  })  : F_UNIT_ID = Value(F_UNIT_ID),
        F_UNIT = Value(F_UNIT),
        F_REMARK = Value(F_REMARK),
        F_RECORDER = Value(F_RECORDER),
        F_RECORD_TIME = Value(F_RECORD_TIME),
        F_PROJECT_ID = Value(F_PROJECT_ID);
  static Insertable<Unit> custom({
    Expression<String> F_UNIT_ID,
    Expression<String> F_UNIT,
    Expression<String> F_REMARK,
    Expression<String> F_RECORDER,
    Expression<int> F_RECORD_TIME,
    Expression<String> F_PROJECT_ID,
    Expression<bool> changed,
    Expression<bool> inserted,
    Expression<bool> deleted,
  }) {
    return RawValuesInsertable({
      if (F_UNIT_ID != null) 'f_unit_id': F_UNIT_ID,
      if (F_UNIT != null) 'f_unit': F_UNIT,
      if (F_REMARK != null) 'f_remark': F_REMARK,
      if (F_RECORDER != null) 'f_recorder': F_RECORDER,
      if (F_RECORD_TIME != null) 'f_record_time': F_RECORD_TIME,
      if (F_PROJECT_ID != null) 'f_project_id': F_PROJECT_ID,
      if (changed != null) 'changed': changed,
      if (inserted != null) 'inserted': inserted,
      if (deleted != null) 'deleted': deleted,
    });
  }

  UnitsCompanion copyWith(
      {Value<String> F_UNIT_ID,
      Value<String> F_UNIT,
      Value<String> F_REMARK,
      Value<String> F_RECORDER,
      Value<int> F_RECORD_TIME,
      Value<String> F_PROJECT_ID,
      Value<bool> changed,
      Value<bool> inserted,
      Value<bool> deleted}) {
    return UnitsCompanion(
      F_UNIT_ID: F_UNIT_ID ?? this.F_UNIT_ID,
      F_UNIT: F_UNIT ?? this.F_UNIT,
      F_REMARK: F_REMARK ?? this.F_REMARK,
      F_RECORDER: F_RECORDER ?? this.F_RECORDER,
      F_RECORD_TIME: F_RECORD_TIME ?? this.F_RECORD_TIME,
      F_PROJECT_ID: F_PROJECT_ID ?? this.F_PROJECT_ID,
      changed: changed ?? this.changed,
      inserted: inserted ?? this.inserted,
      deleted: deleted ?? this.deleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (F_UNIT_ID.present) {
      map['f_unit_id'] = Variable<String>(F_UNIT_ID.value);
    }
    if (F_UNIT.present) {
      map['f_unit'] = Variable<String>(F_UNIT.value);
    }
    if (F_REMARK.present) {
      map['f_remark'] = Variable<String>(F_REMARK.value);
    }
    if (F_RECORDER.present) {
      map['f_recorder'] = Variable<String>(F_RECORDER.value);
    }
    if (F_RECORD_TIME.present) {
      map['f_record_time'] = Variable<int>(F_RECORD_TIME.value);
    }
    if (F_PROJECT_ID.present) {
      map['f_project_id'] = Variable<String>(F_PROJECT_ID.value);
    }
    if (changed.present) {
      map['changed'] = Variable<bool>(changed.value);
    }
    if (inserted.present) {
      map['inserted'] = Variable<bool>(inserted.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('F_UNIT_ID: $F_UNIT_ID, ')
          ..write('F_UNIT: $F_UNIT, ')
          ..write('F_REMARK: $F_REMARK, ')
          ..write('F_RECORDER: $F_RECORDER, ')
          ..write('F_RECORD_TIME: $F_RECORD_TIME, ')
          ..write('F_PROJECT_ID: $F_PROJECT_ID, ')
          ..write('changed: $changed, ')
          ..write('inserted: $inserted, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, Unit> {
  final GeneratedDatabase _db;
  final String _alias;
  $UnitsTable(this._db, [this._alias]);
  final VerificationMeta _F_UNIT_IDMeta = const VerificationMeta('F_UNIT_ID');
  GeneratedTextColumn _F_UNIT_ID;
  @override
  GeneratedTextColumn get F_UNIT_ID => _F_UNIT_ID ??= _constructFUnitId();
  GeneratedTextColumn _constructFUnitId() {
    return GeneratedTextColumn(
      'f_unit_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_UNITMeta = const VerificationMeta('F_UNIT');
  GeneratedTextColumn _F_UNIT;
  @override
  GeneratedTextColumn get F_UNIT => _F_UNIT ??= _constructFUnit();
  GeneratedTextColumn _constructFUnit() {
    return GeneratedTextColumn(
      'f_unit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_REMARKMeta = const VerificationMeta('F_REMARK');
  GeneratedTextColumn _F_REMARK;
  @override
  GeneratedTextColumn get F_REMARK => _F_REMARK ??= _constructFRemark();
  GeneratedTextColumn _constructFRemark() {
    return GeneratedTextColumn(
      'f_remark',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_RECORDERMeta = const VerificationMeta('F_RECORDER');
  GeneratedTextColumn _F_RECORDER;
  @override
  GeneratedTextColumn get F_RECORDER => _F_RECORDER ??= _constructFRecorder();
  GeneratedTextColumn _constructFRecorder() {
    return GeneratedTextColumn(
      'f_recorder',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_RECORD_TIMEMeta =
      const VerificationMeta('F_RECORD_TIME');
  GeneratedIntColumn _F_RECORD_TIME;
  @override
  GeneratedIntColumn get F_RECORD_TIME =>
      _F_RECORD_TIME ??= _constructFRecordTime();
  GeneratedIntColumn _constructFRecordTime() {
    return GeneratedIntColumn(
      'f_record_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_PROJECT_IDMeta =
      const VerificationMeta('F_PROJECT_ID');
  GeneratedTextColumn _F_PROJECT_ID;
  @override
  GeneratedTextColumn get F_PROJECT_ID =>
      _F_PROJECT_ID ??= _constructFProjectId();
  GeneratedTextColumn _constructFProjectId() {
    return GeneratedTextColumn(
      'f_project_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _changedMeta = const VerificationMeta('changed');
  GeneratedBoolColumn _changed;
  @override
  GeneratedBoolColumn get changed => _changed ??= _constructChanged();
  GeneratedBoolColumn _constructChanged() {
    return GeneratedBoolColumn('changed', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _insertedMeta = const VerificationMeta('inserted');
  GeneratedBoolColumn _inserted;
  @override
  GeneratedBoolColumn get inserted => _inserted ??= _constructInserted();
  GeneratedBoolColumn _constructInserted() {
    return GeneratedBoolColumn('inserted', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  GeneratedBoolColumn _deleted;
  @override
  GeneratedBoolColumn get deleted => _deleted ??= _constructDeleted();
  GeneratedBoolColumn _constructDeleted() {
    return GeneratedBoolColumn('deleted', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        F_UNIT_ID,
        F_UNIT,
        F_REMARK,
        F_RECORDER,
        F_RECORD_TIME,
        F_PROJECT_ID,
        changed,
        inserted,
        deleted
      ];
  @override
  $UnitsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'units';
  @override
  final String actualTableName = 'units';
  @override
  VerificationContext validateIntegrity(Insertable<Unit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('f_unit_id')) {
      context.handle(_F_UNIT_IDMeta,
          F_UNIT_ID.isAcceptableOrUnknown(data['f_unit_id'], _F_UNIT_IDMeta));
    } else if (isInserting) {
      context.missing(_F_UNIT_IDMeta);
    }
    if (data.containsKey('f_unit')) {
      context.handle(_F_UNITMeta,
          F_UNIT.isAcceptableOrUnknown(data['f_unit'], _F_UNITMeta));
    } else if (isInserting) {
      context.missing(_F_UNITMeta);
    }
    if (data.containsKey('f_remark')) {
      context.handle(_F_REMARKMeta,
          F_REMARK.isAcceptableOrUnknown(data['f_remark'], _F_REMARKMeta));
    } else if (isInserting) {
      context.missing(_F_REMARKMeta);
    }
    if (data.containsKey('f_recorder')) {
      context.handle(
          _F_RECORDERMeta,
          F_RECORDER.isAcceptableOrUnknown(
              data['f_recorder'], _F_RECORDERMeta));
    } else if (isInserting) {
      context.missing(_F_RECORDERMeta);
    }
    if (data.containsKey('f_record_time')) {
      context.handle(
          _F_RECORD_TIMEMeta,
          F_RECORD_TIME.isAcceptableOrUnknown(
              data['f_record_time'], _F_RECORD_TIMEMeta));
    } else if (isInserting) {
      context.missing(_F_RECORD_TIMEMeta);
    }
    if (data.containsKey('f_project_id')) {
      context.handle(
          _F_PROJECT_IDMeta,
          F_PROJECT_ID.isAcceptableOrUnknown(
              data['f_project_id'], _F_PROJECT_IDMeta));
    } else if (isInserting) {
      context.missing(_F_PROJECT_IDMeta);
    }
    if (data.containsKey('changed')) {
      context.handle(_changedMeta,
          changed.isAcceptableOrUnknown(data['changed'], _changedMeta));
    }
    if (data.containsKey('inserted')) {
      context.handle(_insertedMeta,
          inserted.isAcceptableOrUnknown(data['inserted'], _insertedMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted'], _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {F_UNIT_ID};
  @override
  Unit map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Unit.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(_db, alias);
  }
}

class Planum extends DataClass implements Insertable<Planum> {
  final String F_PLANUM_ID;
  final String F_UNIT_ID;
  final String F_PLANUM;
  final String F_REMARK;
  final String F_RECORDER;
  final int F_RECORD_TIME;
  final String F_PROJECT_ID;
  final String F_PLANUM_TYPE;
  final String F_BEGIN_DATE;
  final String F_END_DATE;
  final bool changed;
  final bool inserted;
  final bool deleted;
  Planum(
      {@required this.F_PLANUM_ID,
      @required this.F_UNIT_ID,
      @required this.F_PLANUM,
      @required this.F_REMARK,
      @required this.F_RECORDER,
      @required this.F_RECORD_TIME,
      @required this.F_PROJECT_ID,
      @required this.F_PLANUM_TYPE,
      @required this.F_BEGIN_DATE,
      @required this.F_END_DATE,
      @required this.changed,
      @required this.inserted,
      @required this.deleted});
  factory Planum.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Planum(
      F_PLANUM_ID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_planum_id']),
      F_UNIT_ID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_unit_id']),
      F_PLANUM: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_planum']),
      F_REMARK: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_remark']),
      F_RECORDER: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_recorder']),
      F_RECORD_TIME: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_record_time']),
      F_PROJECT_ID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_project_id']),
      F_PLANUM_TYPE: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_planum_type']),
      F_BEGIN_DATE: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_begin_date']),
      F_END_DATE: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_end_date']),
      changed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}changed']),
      inserted:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}inserted']),
      deleted:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || F_PLANUM_ID != null) {
      map['f_planum_id'] = Variable<String>(F_PLANUM_ID);
    }
    if (!nullToAbsent || F_UNIT_ID != null) {
      map['f_unit_id'] = Variable<String>(F_UNIT_ID);
    }
    if (!nullToAbsent || F_PLANUM != null) {
      map['f_planum'] = Variable<String>(F_PLANUM);
    }
    if (!nullToAbsent || F_REMARK != null) {
      map['f_remark'] = Variable<String>(F_REMARK);
    }
    if (!nullToAbsent || F_RECORDER != null) {
      map['f_recorder'] = Variable<String>(F_RECORDER);
    }
    if (!nullToAbsent || F_RECORD_TIME != null) {
      map['f_record_time'] = Variable<int>(F_RECORD_TIME);
    }
    if (!nullToAbsent || F_PROJECT_ID != null) {
      map['f_project_id'] = Variable<String>(F_PROJECT_ID);
    }
    if (!nullToAbsent || F_PLANUM_TYPE != null) {
      map['f_planum_type'] = Variable<String>(F_PLANUM_TYPE);
    }
    if (!nullToAbsent || F_BEGIN_DATE != null) {
      map['f_begin_date'] = Variable<String>(F_BEGIN_DATE);
    }
    if (!nullToAbsent || F_END_DATE != null) {
      map['f_end_date'] = Variable<String>(F_END_DATE);
    }
    if (!nullToAbsent || changed != null) {
      map['changed'] = Variable<bool>(changed);
    }
    if (!nullToAbsent || inserted != null) {
      map['inserted'] = Variable<bool>(inserted);
    }
    if (!nullToAbsent || deleted != null) {
      map['deleted'] = Variable<bool>(deleted);
    }
    return map;
  }

  PlanumsCompanion toCompanion(bool nullToAbsent) {
    return PlanumsCompanion(
      F_PLANUM_ID: F_PLANUM_ID == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PLANUM_ID),
      F_UNIT_ID: F_UNIT_ID == null && nullToAbsent
          ? const Value.absent()
          : Value(F_UNIT_ID),
      F_PLANUM: F_PLANUM == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PLANUM),
      F_REMARK: F_REMARK == null && nullToAbsent
          ? const Value.absent()
          : Value(F_REMARK),
      F_RECORDER: F_RECORDER == null && nullToAbsent
          ? const Value.absent()
          : Value(F_RECORDER),
      F_RECORD_TIME: F_RECORD_TIME == null && nullToAbsent
          ? const Value.absent()
          : Value(F_RECORD_TIME),
      F_PROJECT_ID: F_PROJECT_ID == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PROJECT_ID),
      F_PLANUM_TYPE: F_PLANUM_TYPE == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PLANUM_TYPE),
      F_BEGIN_DATE: F_BEGIN_DATE == null && nullToAbsent
          ? const Value.absent()
          : Value(F_BEGIN_DATE),
      F_END_DATE: F_END_DATE == null && nullToAbsent
          ? const Value.absent()
          : Value(F_END_DATE),
      changed: changed == null && nullToAbsent
          ? const Value.absent()
          : Value(changed),
      inserted: inserted == null && nullToAbsent
          ? const Value.absent()
          : Value(inserted),
      deleted: deleted == null && nullToAbsent
          ? const Value.absent()
          : Value(deleted),
    );
  }

  factory Planum.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Planum(
      F_PLANUM_ID: serializer.fromJson<String>(json['F_PLANUM_ID']),
      F_UNIT_ID: serializer.fromJson<String>(json['F_UNIT_ID']),
      F_PLANUM: serializer.fromJson<String>(json['F_PLANUM']),
      F_REMARK: serializer.fromJson<String>(json['F_REMARK']),
      F_RECORDER: serializer.fromJson<String>(json['F_RECORDER']),
      F_RECORD_TIME: serializer.fromJson<int>(json['F_RECORD_TIME']),
      F_PROJECT_ID: serializer.fromJson<String>(json['F_PROJECT_ID']),
      F_PLANUM_TYPE: serializer.fromJson<String>(json['F_PLANUM_TYPE']),
      F_BEGIN_DATE: serializer.fromJson<String>(json['F_BEGIN_DATE']),
      F_END_DATE: serializer.fromJson<String>(json['F_END_DATE']),
      changed: serializer.fromJson<bool>(json['changed']),
      inserted: serializer.fromJson<bool>(json['inserted']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'F_PLANUM_ID': serializer.toJson<String>(F_PLANUM_ID),
      'F_UNIT_ID': serializer.toJson<String>(F_UNIT_ID),
      'F_PLANUM': serializer.toJson<String>(F_PLANUM),
      'F_REMARK': serializer.toJson<String>(F_REMARK),
      'F_RECORDER': serializer.toJson<String>(F_RECORDER),
      'F_RECORD_TIME': serializer.toJson<int>(F_RECORD_TIME),
      'F_PROJECT_ID': serializer.toJson<String>(F_PROJECT_ID),
      'F_PLANUM_TYPE': serializer.toJson<String>(F_PLANUM_TYPE),
      'F_BEGIN_DATE': serializer.toJson<String>(F_BEGIN_DATE),
      'F_END_DATE': serializer.toJson<String>(F_END_DATE),
      'changed': serializer.toJson<bool>(changed),
      'inserted': serializer.toJson<bool>(inserted),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  Planum copyWith(
          {String F_PLANUM_ID,
          String F_UNIT_ID,
          String F_PLANUM,
          String F_REMARK,
          String F_RECORDER,
          int F_RECORD_TIME,
          String F_PROJECT_ID,
          String F_PLANUM_TYPE,
          String F_BEGIN_DATE,
          String F_END_DATE,
          bool changed,
          bool inserted,
          bool deleted}) =>
      Planum(
        F_PLANUM_ID: F_PLANUM_ID ?? this.F_PLANUM_ID,
        F_UNIT_ID: F_UNIT_ID ?? this.F_UNIT_ID,
        F_PLANUM: F_PLANUM ?? this.F_PLANUM,
        F_REMARK: F_REMARK ?? this.F_REMARK,
        F_RECORDER: F_RECORDER ?? this.F_RECORDER,
        F_RECORD_TIME: F_RECORD_TIME ?? this.F_RECORD_TIME,
        F_PROJECT_ID: F_PROJECT_ID ?? this.F_PROJECT_ID,
        F_PLANUM_TYPE: F_PLANUM_TYPE ?? this.F_PLANUM_TYPE,
        F_BEGIN_DATE: F_BEGIN_DATE ?? this.F_BEGIN_DATE,
        F_END_DATE: F_END_DATE ?? this.F_END_DATE,
        changed: changed ?? this.changed,
        inserted: inserted ?? this.inserted,
        deleted: deleted ?? this.deleted,
      );
  @override
  String toString() {
    return (StringBuffer('Planum(')
          ..write('F_PLANUM_ID: $F_PLANUM_ID, ')
          ..write('F_UNIT_ID: $F_UNIT_ID, ')
          ..write('F_PLANUM: $F_PLANUM, ')
          ..write('F_REMARK: $F_REMARK, ')
          ..write('F_RECORDER: $F_RECORDER, ')
          ..write('F_RECORD_TIME: $F_RECORD_TIME, ')
          ..write('F_PROJECT_ID: $F_PROJECT_ID, ')
          ..write('F_PLANUM_TYPE: $F_PLANUM_TYPE, ')
          ..write('F_BEGIN_DATE: $F_BEGIN_DATE, ')
          ..write('F_END_DATE: $F_END_DATE, ')
          ..write('changed: $changed, ')
          ..write('inserted: $inserted, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      F_PLANUM_ID.hashCode,
      $mrjc(
          F_UNIT_ID.hashCode,
          $mrjc(
              F_PLANUM.hashCode,
              $mrjc(
                  F_REMARK.hashCode,
                  $mrjc(
                      F_RECORDER.hashCode,
                      $mrjc(
                          F_RECORD_TIME.hashCode,
                          $mrjc(
                              F_PROJECT_ID.hashCode,
                              $mrjc(
                                  F_PLANUM_TYPE.hashCode,
                                  $mrjc(
                                      F_BEGIN_DATE.hashCode,
                                      $mrjc(
                                          F_END_DATE.hashCode,
                                          $mrjc(
                                              changed.hashCode,
                                              $mrjc(inserted.hashCode,
                                                  deleted.hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Planum &&
          other.F_PLANUM_ID == this.F_PLANUM_ID &&
          other.F_UNIT_ID == this.F_UNIT_ID &&
          other.F_PLANUM == this.F_PLANUM &&
          other.F_REMARK == this.F_REMARK &&
          other.F_RECORDER == this.F_RECORDER &&
          other.F_RECORD_TIME == this.F_RECORD_TIME &&
          other.F_PROJECT_ID == this.F_PROJECT_ID &&
          other.F_PLANUM_TYPE == this.F_PLANUM_TYPE &&
          other.F_BEGIN_DATE == this.F_BEGIN_DATE &&
          other.F_END_DATE == this.F_END_DATE &&
          other.changed == this.changed &&
          other.inserted == this.inserted &&
          other.deleted == this.deleted);
}

class PlanumsCompanion extends UpdateCompanion<Planum> {
  final Value<String> F_PLANUM_ID;
  final Value<String> F_UNIT_ID;
  final Value<String> F_PLANUM;
  final Value<String> F_REMARK;
  final Value<String> F_RECORDER;
  final Value<int> F_RECORD_TIME;
  final Value<String> F_PROJECT_ID;
  final Value<String> F_PLANUM_TYPE;
  final Value<String> F_BEGIN_DATE;
  final Value<String> F_END_DATE;
  final Value<bool> changed;
  final Value<bool> inserted;
  final Value<bool> deleted;
  const PlanumsCompanion({
    this.F_PLANUM_ID = const Value.absent(),
    this.F_UNIT_ID = const Value.absent(),
    this.F_PLANUM = const Value.absent(),
    this.F_REMARK = const Value.absent(),
    this.F_RECORDER = const Value.absent(),
    this.F_RECORD_TIME = const Value.absent(),
    this.F_PROJECT_ID = const Value.absent(),
    this.F_PLANUM_TYPE = const Value.absent(),
    this.F_BEGIN_DATE = const Value.absent(),
    this.F_END_DATE = const Value.absent(),
    this.changed = const Value.absent(),
    this.inserted = const Value.absent(),
    this.deleted = const Value.absent(),
  });
  PlanumsCompanion.insert({
    @required String F_PLANUM_ID,
    @required String F_UNIT_ID,
    @required String F_PLANUM,
    @required String F_REMARK,
    @required String F_RECORDER,
    @required int F_RECORD_TIME,
    @required String F_PROJECT_ID,
    @required String F_PLANUM_TYPE,
    @required String F_BEGIN_DATE,
    @required String F_END_DATE,
    this.changed = const Value.absent(),
    this.inserted = const Value.absent(),
    this.deleted = const Value.absent(),
  })  : F_PLANUM_ID = Value(F_PLANUM_ID),
        F_UNIT_ID = Value(F_UNIT_ID),
        F_PLANUM = Value(F_PLANUM),
        F_REMARK = Value(F_REMARK),
        F_RECORDER = Value(F_RECORDER),
        F_RECORD_TIME = Value(F_RECORD_TIME),
        F_PROJECT_ID = Value(F_PROJECT_ID),
        F_PLANUM_TYPE = Value(F_PLANUM_TYPE),
        F_BEGIN_DATE = Value(F_BEGIN_DATE),
        F_END_DATE = Value(F_END_DATE);
  static Insertable<Planum> custom({
    Expression<String> F_PLANUM_ID,
    Expression<String> F_UNIT_ID,
    Expression<String> F_PLANUM,
    Expression<String> F_REMARK,
    Expression<String> F_RECORDER,
    Expression<int> F_RECORD_TIME,
    Expression<String> F_PROJECT_ID,
    Expression<String> F_PLANUM_TYPE,
    Expression<String> F_BEGIN_DATE,
    Expression<String> F_END_DATE,
    Expression<bool> changed,
    Expression<bool> inserted,
    Expression<bool> deleted,
  }) {
    return RawValuesInsertable({
      if (F_PLANUM_ID != null) 'f_planum_id': F_PLANUM_ID,
      if (F_UNIT_ID != null) 'f_unit_id': F_UNIT_ID,
      if (F_PLANUM != null) 'f_planum': F_PLANUM,
      if (F_REMARK != null) 'f_remark': F_REMARK,
      if (F_RECORDER != null) 'f_recorder': F_RECORDER,
      if (F_RECORD_TIME != null) 'f_record_time': F_RECORD_TIME,
      if (F_PROJECT_ID != null) 'f_project_id': F_PROJECT_ID,
      if (F_PLANUM_TYPE != null) 'f_planum_type': F_PLANUM_TYPE,
      if (F_BEGIN_DATE != null) 'f_begin_date': F_BEGIN_DATE,
      if (F_END_DATE != null) 'f_end_date': F_END_DATE,
      if (changed != null) 'changed': changed,
      if (inserted != null) 'inserted': inserted,
      if (deleted != null) 'deleted': deleted,
    });
  }

  PlanumsCompanion copyWith(
      {Value<String> F_PLANUM_ID,
      Value<String> F_UNIT_ID,
      Value<String> F_PLANUM,
      Value<String> F_REMARK,
      Value<String> F_RECORDER,
      Value<int> F_RECORD_TIME,
      Value<String> F_PROJECT_ID,
      Value<String> F_PLANUM_TYPE,
      Value<String> F_BEGIN_DATE,
      Value<String> F_END_DATE,
      Value<bool> changed,
      Value<bool> inserted,
      Value<bool> deleted}) {
    return PlanumsCompanion(
      F_PLANUM_ID: F_PLANUM_ID ?? this.F_PLANUM_ID,
      F_UNIT_ID: F_UNIT_ID ?? this.F_UNIT_ID,
      F_PLANUM: F_PLANUM ?? this.F_PLANUM,
      F_REMARK: F_REMARK ?? this.F_REMARK,
      F_RECORDER: F_RECORDER ?? this.F_RECORDER,
      F_RECORD_TIME: F_RECORD_TIME ?? this.F_RECORD_TIME,
      F_PROJECT_ID: F_PROJECT_ID ?? this.F_PROJECT_ID,
      F_PLANUM_TYPE: F_PLANUM_TYPE ?? this.F_PLANUM_TYPE,
      F_BEGIN_DATE: F_BEGIN_DATE ?? this.F_BEGIN_DATE,
      F_END_DATE: F_END_DATE ?? this.F_END_DATE,
      changed: changed ?? this.changed,
      inserted: inserted ?? this.inserted,
      deleted: deleted ?? this.deleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (F_PLANUM_ID.present) {
      map['f_planum_id'] = Variable<String>(F_PLANUM_ID.value);
    }
    if (F_UNIT_ID.present) {
      map['f_unit_id'] = Variable<String>(F_UNIT_ID.value);
    }
    if (F_PLANUM.present) {
      map['f_planum'] = Variable<String>(F_PLANUM.value);
    }
    if (F_REMARK.present) {
      map['f_remark'] = Variable<String>(F_REMARK.value);
    }
    if (F_RECORDER.present) {
      map['f_recorder'] = Variable<String>(F_RECORDER.value);
    }
    if (F_RECORD_TIME.present) {
      map['f_record_time'] = Variable<int>(F_RECORD_TIME.value);
    }
    if (F_PROJECT_ID.present) {
      map['f_project_id'] = Variable<String>(F_PROJECT_ID.value);
    }
    if (F_PLANUM_TYPE.present) {
      map['f_planum_type'] = Variable<String>(F_PLANUM_TYPE.value);
    }
    if (F_BEGIN_DATE.present) {
      map['f_begin_date'] = Variable<String>(F_BEGIN_DATE.value);
    }
    if (F_END_DATE.present) {
      map['f_end_date'] = Variable<String>(F_END_DATE.value);
    }
    if (changed.present) {
      map['changed'] = Variable<bool>(changed.value);
    }
    if (inserted.present) {
      map['inserted'] = Variable<bool>(inserted.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanumsCompanion(')
          ..write('F_PLANUM_ID: $F_PLANUM_ID, ')
          ..write('F_UNIT_ID: $F_UNIT_ID, ')
          ..write('F_PLANUM: $F_PLANUM, ')
          ..write('F_REMARK: $F_REMARK, ')
          ..write('F_RECORDER: $F_RECORDER, ')
          ..write('F_RECORD_TIME: $F_RECORD_TIME, ')
          ..write('F_PROJECT_ID: $F_PROJECT_ID, ')
          ..write('F_PLANUM_TYPE: $F_PLANUM_TYPE, ')
          ..write('F_BEGIN_DATE: $F_BEGIN_DATE, ')
          ..write('F_END_DATE: $F_END_DATE, ')
          ..write('changed: $changed, ')
          ..write('inserted: $inserted, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }
}

class $PlanumsTable extends Planums with TableInfo<$PlanumsTable, Planum> {
  final GeneratedDatabase _db;
  final String _alias;
  $PlanumsTable(this._db, [this._alias]);
  final VerificationMeta _F_PLANUM_IDMeta =
      const VerificationMeta('F_PLANUM_ID');
  GeneratedTextColumn _F_PLANUM_ID;
  @override
  GeneratedTextColumn get F_PLANUM_ID => _F_PLANUM_ID ??= _constructFPlanumId();
  GeneratedTextColumn _constructFPlanumId() {
    return GeneratedTextColumn(
      'f_planum_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_UNIT_IDMeta = const VerificationMeta('F_UNIT_ID');
  GeneratedTextColumn _F_UNIT_ID;
  @override
  GeneratedTextColumn get F_UNIT_ID => _F_UNIT_ID ??= _constructFUnitId();
  GeneratedTextColumn _constructFUnitId() {
    return GeneratedTextColumn(
      'f_unit_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_PLANUMMeta = const VerificationMeta('F_PLANUM');
  GeneratedTextColumn _F_PLANUM;
  @override
  GeneratedTextColumn get F_PLANUM => _F_PLANUM ??= _constructFPlanum();
  GeneratedTextColumn _constructFPlanum() {
    return GeneratedTextColumn(
      'f_planum',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_REMARKMeta = const VerificationMeta('F_REMARK');
  GeneratedTextColumn _F_REMARK;
  @override
  GeneratedTextColumn get F_REMARK => _F_REMARK ??= _constructFRemark();
  GeneratedTextColumn _constructFRemark() {
    return GeneratedTextColumn(
      'f_remark',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_RECORDERMeta = const VerificationMeta('F_RECORDER');
  GeneratedTextColumn _F_RECORDER;
  @override
  GeneratedTextColumn get F_RECORDER => _F_RECORDER ??= _constructFRecorder();
  GeneratedTextColumn _constructFRecorder() {
    return GeneratedTextColumn(
      'f_recorder',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_RECORD_TIMEMeta =
      const VerificationMeta('F_RECORD_TIME');
  GeneratedIntColumn _F_RECORD_TIME;
  @override
  GeneratedIntColumn get F_RECORD_TIME =>
      _F_RECORD_TIME ??= _constructFRecordTime();
  GeneratedIntColumn _constructFRecordTime() {
    return GeneratedIntColumn(
      'f_record_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_PROJECT_IDMeta =
      const VerificationMeta('F_PROJECT_ID');
  GeneratedTextColumn _F_PROJECT_ID;
  @override
  GeneratedTextColumn get F_PROJECT_ID =>
      _F_PROJECT_ID ??= _constructFProjectId();
  GeneratedTextColumn _constructFProjectId() {
    return GeneratedTextColumn(
      'f_project_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_PLANUM_TYPEMeta =
      const VerificationMeta('F_PLANUM_TYPE');
  GeneratedTextColumn _F_PLANUM_TYPE;
  @override
  GeneratedTextColumn get F_PLANUM_TYPE =>
      _F_PLANUM_TYPE ??= _constructFPlanumType();
  GeneratedTextColumn _constructFPlanumType() {
    return GeneratedTextColumn(
      'f_planum_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_BEGIN_DATEMeta =
      const VerificationMeta('F_BEGIN_DATE');
  GeneratedTextColumn _F_BEGIN_DATE;
  @override
  GeneratedTextColumn get F_BEGIN_DATE =>
      _F_BEGIN_DATE ??= _constructFBeginDate();
  GeneratedTextColumn _constructFBeginDate() {
    return GeneratedTextColumn(
      'f_begin_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_END_DATEMeta = const VerificationMeta('F_END_DATE');
  GeneratedTextColumn _F_END_DATE;
  @override
  GeneratedTextColumn get F_END_DATE => _F_END_DATE ??= _constructFEndDate();
  GeneratedTextColumn _constructFEndDate() {
    return GeneratedTextColumn(
      'f_end_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _changedMeta = const VerificationMeta('changed');
  GeneratedBoolColumn _changed;
  @override
  GeneratedBoolColumn get changed => _changed ??= _constructChanged();
  GeneratedBoolColumn _constructChanged() {
    return GeneratedBoolColumn('changed', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _insertedMeta = const VerificationMeta('inserted');
  GeneratedBoolColumn _inserted;
  @override
  GeneratedBoolColumn get inserted => _inserted ??= _constructInserted();
  GeneratedBoolColumn _constructInserted() {
    return GeneratedBoolColumn('inserted', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  GeneratedBoolColumn _deleted;
  @override
  GeneratedBoolColumn get deleted => _deleted ??= _constructDeleted();
  GeneratedBoolColumn _constructDeleted() {
    return GeneratedBoolColumn('deleted', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        F_PLANUM_ID,
        F_UNIT_ID,
        F_PLANUM,
        F_REMARK,
        F_RECORDER,
        F_RECORD_TIME,
        F_PROJECT_ID,
        F_PLANUM_TYPE,
        F_BEGIN_DATE,
        F_END_DATE,
        changed,
        inserted,
        deleted
      ];
  @override
  $PlanumsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'planums';
  @override
  final String actualTableName = 'planums';
  @override
  VerificationContext validateIntegrity(Insertable<Planum> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('f_planum_id')) {
      context.handle(
          _F_PLANUM_IDMeta,
          F_PLANUM_ID.isAcceptableOrUnknown(
              data['f_planum_id'], _F_PLANUM_IDMeta));
    } else if (isInserting) {
      context.missing(_F_PLANUM_IDMeta);
    }
    if (data.containsKey('f_unit_id')) {
      context.handle(_F_UNIT_IDMeta,
          F_UNIT_ID.isAcceptableOrUnknown(data['f_unit_id'], _F_UNIT_IDMeta));
    } else if (isInserting) {
      context.missing(_F_UNIT_IDMeta);
    }
    if (data.containsKey('f_planum')) {
      context.handle(_F_PLANUMMeta,
          F_PLANUM.isAcceptableOrUnknown(data['f_planum'], _F_PLANUMMeta));
    } else if (isInserting) {
      context.missing(_F_PLANUMMeta);
    }
    if (data.containsKey('f_remark')) {
      context.handle(_F_REMARKMeta,
          F_REMARK.isAcceptableOrUnknown(data['f_remark'], _F_REMARKMeta));
    } else if (isInserting) {
      context.missing(_F_REMARKMeta);
    }
    if (data.containsKey('f_recorder')) {
      context.handle(
          _F_RECORDERMeta,
          F_RECORDER.isAcceptableOrUnknown(
              data['f_recorder'], _F_RECORDERMeta));
    } else if (isInserting) {
      context.missing(_F_RECORDERMeta);
    }
    if (data.containsKey('f_record_time')) {
      context.handle(
          _F_RECORD_TIMEMeta,
          F_RECORD_TIME.isAcceptableOrUnknown(
              data['f_record_time'], _F_RECORD_TIMEMeta));
    } else if (isInserting) {
      context.missing(_F_RECORD_TIMEMeta);
    }
    if (data.containsKey('f_project_id')) {
      context.handle(
          _F_PROJECT_IDMeta,
          F_PROJECT_ID.isAcceptableOrUnknown(
              data['f_project_id'], _F_PROJECT_IDMeta));
    } else if (isInserting) {
      context.missing(_F_PROJECT_IDMeta);
    }
    if (data.containsKey('f_planum_type')) {
      context.handle(
          _F_PLANUM_TYPEMeta,
          F_PLANUM_TYPE.isAcceptableOrUnknown(
              data['f_planum_type'], _F_PLANUM_TYPEMeta));
    } else if (isInserting) {
      context.missing(_F_PLANUM_TYPEMeta);
    }
    if (data.containsKey('f_begin_date')) {
      context.handle(
          _F_BEGIN_DATEMeta,
          F_BEGIN_DATE.isAcceptableOrUnknown(
              data['f_begin_date'], _F_BEGIN_DATEMeta));
    } else if (isInserting) {
      context.missing(_F_BEGIN_DATEMeta);
    }
    if (data.containsKey('f_end_date')) {
      context.handle(
          _F_END_DATEMeta,
          F_END_DATE.isAcceptableOrUnknown(
              data['f_end_date'], _F_END_DATEMeta));
    } else if (isInserting) {
      context.missing(_F_END_DATEMeta);
    }
    if (data.containsKey('changed')) {
      context.handle(_changedMeta,
          changed.isAcceptableOrUnknown(data['changed'], _changedMeta));
    }
    if (data.containsKey('inserted')) {
      context.handle(_insertedMeta,
          inserted.isAcceptableOrUnknown(data['inserted'], _insertedMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted'], _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {F_PLANUM_ID};
  @override
  Planum map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Planum.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PlanumsTable createAlias(String alias) {
    return $PlanumsTable(_db, alias);
  }
}

class Feature extends DataClass implements Insertable<Feature> {
  final String F_FEATURE_ID;
  final String F_UNIT_ID;
  final String F_FEATURE;
  final String F_FEATURE_TYPE;
  final int F_DATE_BEGIN;
  final int F_DATE_END;
  final String F_BEGIN_PERIOD;
  final String F_END_PERIOD;
  final bool F_REJECTED;
  final String F_CONTROL;
  final String F_FEATURE_CONSERVATION;
  final String F_Z_BOTTOM;
  final String F_FEATURE_DEPTH;
  final String F_Z_TOP;
  final String F_REMARK;
  final String F_RECORDER;
  final int F_RECORD_TIME;
  final String F_PROJECT_ID;
  final bool changed;
  final bool inserted;
  final bool deleted;
  Feature(
      {@required this.F_FEATURE_ID,
      @required this.F_UNIT_ID,
      @required this.F_FEATURE,
      @required this.F_FEATURE_TYPE,
      @required this.F_DATE_BEGIN,
      @required this.F_DATE_END,
      @required this.F_BEGIN_PERIOD,
      @required this.F_END_PERIOD,
      @required this.F_REJECTED,
      @required this.F_CONTROL,
      @required this.F_FEATURE_CONSERVATION,
      @required this.F_Z_BOTTOM,
      @required this.F_FEATURE_DEPTH,
      @required this.F_Z_TOP,
      @required this.F_REMARK,
      @required this.F_RECORDER,
      @required this.F_RECORD_TIME,
      @required this.F_PROJECT_ID,
      @required this.changed,
      @required this.inserted,
      @required this.deleted});
  factory Feature.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Feature(
      F_FEATURE_ID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_feature_id']),
      F_UNIT_ID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_unit_id']),
      F_FEATURE: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_feature']),
      F_FEATURE_TYPE: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_feature_type']),
      F_DATE_BEGIN: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_date_begin']),
      F_DATE_END:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}f_date_end']),
      F_BEGIN_PERIOD: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_begin_period']),
      F_END_PERIOD: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_end_period']),
      F_REJECTED: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_rejected']),
      F_CONTROL: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_control']),
      F_FEATURE_CONSERVATION: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}f_feature_conservation']),
      F_Z_BOTTOM: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_z_bottom']),
      F_FEATURE_DEPTH: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_feature_depth']),
      F_Z_TOP:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}f_z_top']),
      F_REMARK: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_remark']),
      F_RECORDER: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_recorder']),
      F_RECORD_TIME: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_record_time']),
      F_PROJECT_ID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_project_id']),
      changed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}changed']),
      inserted:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}inserted']),
      deleted:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}deleted']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || F_FEATURE_ID != null) {
      map['f_feature_id'] = Variable<String>(F_FEATURE_ID);
    }
    if (!nullToAbsent || F_UNIT_ID != null) {
      map['f_unit_id'] = Variable<String>(F_UNIT_ID);
    }
    if (!nullToAbsent || F_FEATURE != null) {
      map['f_feature'] = Variable<String>(F_FEATURE);
    }
    if (!nullToAbsent || F_FEATURE_TYPE != null) {
      map['f_feature_type'] = Variable<String>(F_FEATURE_TYPE);
    }
    if (!nullToAbsent || F_DATE_BEGIN != null) {
      map['f_date_begin'] = Variable<int>(F_DATE_BEGIN);
    }
    if (!nullToAbsent || F_DATE_END != null) {
      map['f_date_end'] = Variable<int>(F_DATE_END);
    }
    if (!nullToAbsent || F_BEGIN_PERIOD != null) {
      map['f_begin_period'] = Variable<String>(F_BEGIN_PERIOD);
    }
    if (!nullToAbsent || F_END_PERIOD != null) {
      map['f_end_period'] = Variable<String>(F_END_PERIOD);
    }
    if (!nullToAbsent || F_REJECTED != null) {
      map['f_rejected'] = Variable<bool>(F_REJECTED);
    }
    if (!nullToAbsent || F_CONTROL != null) {
      map['f_control'] = Variable<String>(F_CONTROL);
    }
    if (!nullToAbsent || F_FEATURE_CONSERVATION != null) {
      map['f_feature_conservation'] = Variable<String>(F_FEATURE_CONSERVATION);
    }
    if (!nullToAbsent || F_Z_BOTTOM != null) {
      map['f_z_bottom'] = Variable<String>(F_Z_BOTTOM);
    }
    if (!nullToAbsent || F_FEATURE_DEPTH != null) {
      map['f_feature_depth'] = Variable<String>(F_FEATURE_DEPTH);
    }
    if (!nullToAbsent || F_Z_TOP != null) {
      map['f_z_top'] = Variable<String>(F_Z_TOP);
    }
    if (!nullToAbsent || F_REMARK != null) {
      map['f_remark'] = Variable<String>(F_REMARK);
    }
    if (!nullToAbsent || F_RECORDER != null) {
      map['f_recorder'] = Variable<String>(F_RECORDER);
    }
    if (!nullToAbsent || F_RECORD_TIME != null) {
      map['f_record_time'] = Variable<int>(F_RECORD_TIME);
    }
    if (!nullToAbsent || F_PROJECT_ID != null) {
      map['f_project_id'] = Variable<String>(F_PROJECT_ID);
    }
    if (!nullToAbsent || changed != null) {
      map['changed'] = Variable<bool>(changed);
    }
    if (!nullToAbsent || inserted != null) {
      map['inserted'] = Variable<bool>(inserted);
    }
    if (!nullToAbsent || deleted != null) {
      map['deleted'] = Variable<bool>(deleted);
    }
    return map;
  }

  FeaturesCompanion toCompanion(bool nullToAbsent) {
    return FeaturesCompanion(
      F_FEATURE_ID: F_FEATURE_ID == null && nullToAbsent
          ? const Value.absent()
          : Value(F_FEATURE_ID),
      F_UNIT_ID: F_UNIT_ID == null && nullToAbsent
          ? const Value.absent()
          : Value(F_UNIT_ID),
      F_FEATURE: F_FEATURE == null && nullToAbsent
          ? const Value.absent()
          : Value(F_FEATURE),
      F_FEATURE_TYPE: F_FEATURE_TYPE == null && nullToAbsent
          ? const Value.absent()
          : Value(F_FEATURE_TYPE),
      F_DATE_BEGIN: F_DATE_BEGIN == null && nullToAbsent
          ? const Value.absent()
          : Value(F_DATE_BEGIN),
      F_DATE_END: F_DATE_END == null && nullToAbsent
          ? const Value.absent()
          : Value(F_DATE_END),
      F_BEGIN_PERIOD: F_BEGIN_PERIOD == null && nullToAbsent
          ? const Value.absent()
          : Value(F_BEGIN_PERIOD),
      F_END_PERIOD: F_END_PERIOD == null && nullToAbsent
          ? const Value.absent()
          : Value(F_END_PERIOD),
      F_REJECTED: F_REJECTED == null && nullToAbsent
          ? const Value.absent()
          : Value(F_REJECTED),
      F_CONTROL: F_CONTROL == null && nullToAbsent
          ? const Value.absent()
          : Value(F_CONTROL),
      F_FEATURE_CONSERVATION: F_FEATURE_CONSERVATION == null && nullToAbsent
          ? const Value.absent()
          : Value(F_FEATURE_CONSERVATION),
      F_Z_BOTTOM: F_Z_BOTTOM == null && nullToAbsent
          ? const Value.absent()
          : Value(F_Z_BOTTOM),
      F_FEATURE_DEPTH: F_FEATURE_DEPTH == null && nullToAbsent
          ? const Value.absent()
          : Value(F_FEATURE_DEPTH),
      F_Z_TOP: F_Z_TOP == null && nullToAbsent
          ? const Value.absent()
          : Value(F_Z_TOP),
      F_REMARK: F_REMARK == null && nullToAbsent
          ? const Value.absent()
          : Value(F_REMARK),
      F_RECORDER: F_RECORDER == null && nullToAbsent
          ? const Value.absent()
          : Value(F_RECORDER),
      F_RECORD_TIME: F_RECORD_TIME == null && nullToAbsent
          ? const Value.absent()
          : Value(F_RECORD_TIME),
      F_PROJECT_ID: F_PROJECT_ID == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PROJECT_ID),
      changed: changed == null && nullToAbsent
          ? const Value.absent()
          : Value(changed),
      inserted: inserted == null && nullToAbsent
          ? const Value.absent()
          : Value(inserted),
      deleted: deleted == null && nullToAbsent
          ? const Value.absent()
          : Value(deleted),
    );
  }

  factory Feature.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Feature(
      F_FEATURE_ID: serializer.fromJson<String>(json['F_FEATURE_ID']),
      F_UNIT_ID: serializer.fromJson<String>(json['F_UNIT_ID']),
      F_FEATURE: serializer.fromJson<String>(json['F_FEATURE']),
      F_FEATURE_TYPE: serializer.fromJson<String>(json['F_FEATURE_TYPE']),
      F_DATE_BEGIN: serializer.fromJson<int>(json['F_DATE_BEGIN']),
      F_DATE_END: serializer.fromJson<int>(json['F_DATE_END']),
      F_BEGIN_PERIOD: serializer.fromJson<String>(json['F_BEGIN_PERIOD']),
      F_END_PERIOD: serializer.fromJson<String>(json['F_END_PERIOD']),
      F_REJECTED: serializer.fromJson<bool>(json['F_REJECTED']),
      F_CONTROL: serializer.fromJson<String>(json['F_CONTROL']),
      F_FEATURE_CONSERVATION:
          serializer.fromJson<String>(json['F_FEATURE_CONSERVATION']),
      F_Z_BOTTOM: serializer.fromJson<String>(json['F_Z_BOTTOM']),
      F_FEATURE_DEPTH: serializer.fromJson<String>(json['F_FEATURE_DEPTH']),
      F_Z_TOP: serializer.fromJson<String>(json['F_Z_TOP']),
      F_REMARK: serializer.fromJson<String>(json['F_REMARK']),
      F_RECORDER: serializer.fromJson<String>(json['F_RECORDER']),
      F_RECORD_TIME: serializer.fromJson<int>(json['F_RECORD_TIME']),
      F_PROJECT_ID: serializer.fromJson<String>(json['F_PROJECT_ID']),
      changed: serializer.fromJson<bool>(json['changed']),
      inserted: serializer.fromJson<bool>(json['inserted']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'F_FEATURE_ID': serializer.toJson<String>(F_FEATURE_ID),
      'F_UNIT_ID': serializer.toJson<String>(F_UNIT_ID),
      'F_FEATURE': serializer.toJson<String>(F_FEATURE),
      'F_FEATURE_TYPE': serializer.toJson<String>(F_FEATURE_TYPE),
      'F_DATE_BEGIN': serializer.toJson<int>(F_DATE_BEGIN),
      'F_DATE_END': serializer.toJson<int>(F_DATE_END),
      'F_BEGIN_PERIOD': serializer.toJson<String>(F_BEGIN_PERIOD),
      'F_END_PERIOD': serializer.toJson<String>(F_END_PERIOD),
      'F_REJECTED': serializer.toJson<bool>(F_REJECTED),
      'F_CONTROL': serializer.toJson<String>(F_CONTROL),
      'F_FEATURE_CONSERVATION':
          serializer.toJson<String>(F_FEATURE_CONSERVATION),
      'F_Z_BOTTOM': serializer.toJson<String>(F_Z_BOTTOM),
      'F_FEATURE_DEPTH': serializer.toJson<String>(F_FEATURE_DEPTH),
      'F_Z_TOP': serializer.toJson<String>(F_Z_TOP),
      'F_REMARK': serializer.toJson<String>(F_REMARK),
      'F_RECORDER': serializer.toJson<String>(F_RECORDER),
      'F_RECORD_TIME': serializer.toJson<int>(F_RECORD_TIME),
      'F_PROJECT_ID': serializer.toJson<String>(F_PROJECT_ID),
      'changed': serializer.toJson<bool>(changed),
      'inserted': serializer.toJson<bool>(inserted),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  Feature copyWith(
          {String F_FEATURE_ID,
          String F_UNIT_ID,
          String F_FEATURE,
          String F_FEATURE_TYPE,
          int F_DATE_BEGIN,
          int F_DATE_END,
          String F_BEGIN_PERIOD,
          String F_END_PERIOD,
          bool F_REJECTED,
          String F_CONTROL,
          String F_FEATURE_CONSERVATION,
          String F_Z_BOTTOM,
          String F_FEATURE_DEPTH,
          String F_Z_TOP,
          String F_REMARK,
          String F_RECORDER,
          int F_RECORD_TIME,
          String F_PROJECT_ID,
          bool changed,
          bool inserted,
          bool deleted}) =>
      Feature(
        F_FEATURE_ID: F_FEATURE_ID ?? this.F_FEATURE_ID,
        F_UNIT_ID: F_UNIT_ID ?? this.F_UNIT_ID,
        F_FEATURE: F_FEATURE ?? this.F_FEATURE,
        F_FEATURE_TYPE: F_FEATURE_TYPE ?? this.F_FEATURE_TYPE,
        F_DATE_BEGIN: F_DATE_BEGIN ?? this.F_DATE_BEGIN,
        F_DATE_END: F_DATE_END ?? this.F_DATE_END,
        F_BEGIN_PERIOD: F_BEGIN_PERIOD ?? this.F_BEGIN_PERIOD,
        F_END_PERIOD: F_END_PERIOD ?? this.F_END_PERIOD,
        F_REJECTED: F_REJECTED ?? this.F_REJECTED,
        F_CONTROL: F_CONTROL ?? this.F_CONTROL,
        F_FEATURE_CONSERVATION:
            F_FEATURE_CONSERVATION ?? this.F_FEATURE_CONSERVATION,
        F_Z_BOTTOM: F_Z_BOTTOM ?? this.F_Z_BOTTOM,
        F_FEATURE_DEPTH: F_FEATURE_DEPTH ?? this.F_FEATURE_DEPTH,
        F_Z_TOP: F_Z_TOP ?? this.F_Z_TOP,
        F_REMARK: F_REMARK ?? this.F_REMARK,
        F_RECORDER: F_RECORDER ?? this.F_RECORDER,
        F_RECORD_TIME: F_RECORD_TIME ?? this.F_RECORD_TIME,
        F_PROJECT_ID: F_PROJECT_ID ?? this.F_PROJECT_ID,
        changed: changed ?? this.changed,
        inserted: inserted ?? this.inserted,
        deleted: deleted ?? this.deleted,
      );
  @override
  String toString() {
    return (StringBuffer('Feature(')
          ..write('F_FEATURE_ID: $F_FEATURE_ID, ')
          ..write('F_UNIT_ID: $F_UNIT_ID, ')
          ..write('F_FEATURE: $F_FEATURE, ')
          ..write('F_FEATURE_TYPE: $F_FEATURE_TYPE, ')
          ..write('F_DATE_BEGIN: $F_DATE_BEGIN, ')
          ..write('F_DATE_END: $F_DATE_END, ')
          ..write('F_BEGIN_PERIOD: $F_BEGIN_PERIOD, ')
          ..write('F_END_PERIOD: $F_END_PERIOD, ')
          ..write('F_REJECTED: $F_REJECTED, ')
          ..write('F_CONTROL: $F_CONTROL, ')
          ..write('F_FEATURE_CONSERVATION: $F_FEATURE_CONSERVATION, ')
          ..write('F_Z_BOTTOM: $F_Z_BOTTOM, ')
          ..write('F_FEATURE_DEPTH: $F_FEATURE_DEPTH, ')
          ..write('F_Z_TOP: $F_Z_TOP, ')
          ..write('F_REMARK: $F_REMARK, ')
          ..write('F_RECORDER: $F_RECORDER, ')
          ..write('F_RECORD_TIME: $F_RECORD_TIME, ')
          ..write('F_PROJECT_ID: $F_PROJECT_ID, ')
          ..write('changed: $changed, ')
          ..write('inserted: $inserted, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      F_FEATURE_ID.hashCode,
      $mrjc(
          F_UNIT_ID.hashCode,
          $mrjc(
              F_FEATURE.hashCode,
              $mrjc(
                  F_FEATURE_TYPE.hashCode,
                  $mrjc(
                      F_DATE_BEGIN.hashCode,
                      $mrjc(
                          F_DATE_END.hashCode,
                          $mrjc(
                              F_BEGIN_PERIOD.hashCode,
                              $mrjc(
                                  F_END_PERIOD.hashCode,
                                  $mrjc(
                                      F_REJECTED.hashCode,
                                      $mrjc(
                                          F_CONTROL.hashCode,
                                          $mrjc(
                                              F_FEATURE_CONSERVATION.hashCode,
                                              $mrjc(
                                                  F_Z_BOTTOM.hashCode,
                                                  $mrjc(
                                                      F_FEATURE_DEPTH.hashCode,
                                                      $mrjc(
                                                          F_Z_TOP.hashCode,
                                                          $mrjc(
                                                              F_REMARK.hashCode,
                                                              $mrjc(
                                                                  F_RECORDER
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      F_RECORD_TIME
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          F_PROJECT_ID
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              changed.hashCode,
                                                                              $mrjc(inserted.hashCode, deleted.hashCode)))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Feature &&
          other.F_FEATURE_ID == this.F_FEATURE_ID &&
          other.F_UNIT_ID == this.F_UNIT_ID &&
          other.F_FEATURE == this.F_FEATURE &&
          other.F_FEATURE_TYPE == this.F_FEATURE_TYPE &&
          other.F_DATE_BEGIN == this.F_DATE_BEGIN &&
          other.F_DATE_END == this.F_DATE_END &&
          other.F_BEGIN_PERIOD == this.F_BEGIN_PERIOD &&
          other.F_END_PERIOD == this.F_END_PERIOD &&
          other.F_REJECTED == this.F_REJECTED &&
          other.F_CONTROL == this.F_CONTROL &&
          other.F_FEATURE_CONSERVATION == this.F_FEATURE_CONSERVATION &&
          other.F_Z_BOTTOM == this.F_Z_BOTTOM &&
          other.F_FEATURE_DEPTH == this.F_FEATURE_DEPTH &&
          other.F_Z_TOP == this.F_Z_TOP &&
          other.F_REMARK == this.F_REMARK &&
          other.F_RECORDER == this.F_RECORDER &&
          other.F_RECORD_TIME == this.F_RECORD_TIME &&
          other.F_PROJECT_ID == this.F_PROJECT_ID &&
          other.changed == this.changed &&
          other.inserted == this.inserted &&
          other.deleted == this.deleted);
}

class FeaturesCompanion extends UpdateCompanion<Feature> {
  final Value<String> F_FEATURE_ID;
  final Value<String> F_UNIT_ID;
  final Value<String> F_FEATURE;
  final Value<String> F_FEATURE_TYPE;
  final Value<int> F_DATE_BEGIN;
  final Value<int> F_DATE_END;
  final Value<String> F_BEGIN_PERIOD;
  final Value<String> F_END_PERIOD;
  final Value<bool> F_REJECTED;
  final Value<String> F_CONTROL;
  final Value<String> F_FEATURE_CONSERVATION;
  final Value<String> F_Z_BOTTOM;
  final Value<String> F_FEATURE_DEPTH;
  final Value<String> F_Z_TOP;
  final Value<String> F_REMARK;
  final Value<String> F_RECORDER;
  final Value<int> F_RECORD_TIME;
  final Value<String> F_PROJECT_ID;
  final Value<bool> changed;
  final Value<bool> inserted;
  final Value<bool> deleted;
  const FeaturesCompanion({
    this.F_FEATURE_ID = const Value.absent(),
    this.F_UNIT_ID = const Value.absent(),
    this.F_FEATURE = const Value.absent(),
    this.F_FEATURE_TYPE = const Value.absent(),
    this.F_DATE_BEGIN = const Value.absent(),
    this.F_DATE_END = const Value.absent(),
    this.F_BEGIN_PERIOD = const Value.absent(),
    this.F_END_PERIOD = const Value.absent(),
    this.F_REJECTED = const Value.absent(),
    this.F_CONTROL = const Value.absent(),
    this.F_FEATURE_CONSERVATION = const Value.absent(),
    this.F_Z_BOTTOM = const Value.absent(),
    this.F_FEATURE_DEPTH = const Value.absent(),
    this.F_Z_TOP = const Value.absent(),
    this.F_REMARK = const Value.absent(),
    this.F_RECORDER = const Value.absent(),
    this.F_RECORD_TIME = const Value.absent(),
    this.F_PROJECT_ID = const Value.absent(),
    this.changed = const Value.absent(),
    this.inserted = const Value.absent(),
    this.deleted = const Value.absent(),
  });
  FeaturesCompanion.insert({
    @required String F_FEATURE_ID,
    @required String F_UNIT_ID,
    @required String F_FEATURE,
    @required String F_FEATURE_TYPE,
    @required int F_DATE_BEGIN,
    @required int F_DATE_END,
    @required String F_BEGIN_PERIOD,
    @required String F_END_PERIOD,
    @required bool F_REJECTED,
    @required String F_CONTROL,
    @required String F_FEATURE_CONSERVATION,
    @required String F_Z_BOTTOM,
    @required String F_FEATURE_DEPTH,
    @required String F_Z_TOP,
    @required String F_REMARK,
    @required String F_RECORDER,
    @required int F_RECORD_TIME,
    @required String F_PROJECT_ID,
    this.changed = const Value.absent(),
    this.inserted = const Value.absent(),
    this.deleted = const Value.absent(),
  })  : F_FEATURE_ID = Value(F_FEATURE_ID),
        F_UNIT_ID = Value(F_UNIT_ID),
        F_FEATURE = Value(F_FEATURE),
        F_FEATURE_TYPE = Value(F_FEATURE_TYPE),
        F_DATE_BEGIN = Value(F_DATE_BEGIN),
        F_DATE_END = Value(F_DATE_END),
        F_BEGIN_PERIOD = Value(F_BEGIN_PERIOD),
        F_END_PERIOD = Value(F_END_PERIOD),
        F_REJECTED = Value(F_REJECTED),
        F_CONTROL = Value(F_CONTROL),
        F_FEATURE_CONSERVATION = Value(F_FEATURE_CONSERVATION),
        F_Z_BOTTOM = Value(F_Z_BOTTOM),
        F_FEATURE_DEPTH = Value(F_FEATURE_DEPTH),
        F_Z_TOP = Value(F_Z_TOP),
        F_REMARK = Value(F_REMARK),
        F_RECORDER = Value(F_RECORDER),
        F_RECORD_TIME = Value(F_RECORD_TIME),
        F_PROJECT_ID = Value(F_PROJECT_ID);
  static Insertable<Feature> custom({
    Expression<String> F_FEATURE_ID,
    Expression<String> F_UNIT_ID,
    Expression<String> F_FEATURE,
    Expression<String> F_FEATURE_TYPE,
    Expression<int> F_DATE_BEGIN,
    Expression<int> F_DATE_END,
    Expression<String> F_BEGIN_PERIOD,
    Expression<String> F_END_PERIOD,
    Expression<bool> F_REJECTED,
    Expression<String> F_CONTROL,
    Expression<String> F_FEATURE_CONSERVATION,
    Expression<String> F_Z_BOTTOM,
    Expression<String> F_FEATURE_DEPTH,
    Expression<String> F_Z_TOP,
    Expression<String> F_REMARK,
    Expression<String> F_RECORDER,
    Expression<int> F_RECORD_TIME,
    Expression<String> F_PROJECT_ID,
    Expression<bool> changed,
    Expression<bool> inserted,
    Expression<bool> deleted,
  }) {
    return RawValuesInsertable({
      if (F_FEATURE_ID != null) 'f_feature_id': F_FEATURE_ID,
      if (F_UNIT_ID != null) 'f_unit_id': F_UNIT_ID,
      if (F_FEATURE != null) 'f_feature': F_FEATURE,
      if (F_FEATURE_TYPE != null) 'f_feature_type': F_FEATURE_TYPE,
      if (F_DATE_BEGIN != null) 'f_date_begin': F_DATE_BEGIN,
      if (F_DATE_END != null) 'f_date_end': F_DATE_END,
      if (F_BEGIN_PERIOD != null) 'f_begin_period': F_BEGIN_PERIOD,
      if (F_END_PERIOD != null) 'f_end_period': F_END_PERIOD,
      if (F_REJECTED != null) 'f_rejected': F_REJECTED,
      if (F_CONTROL != null) 'f_control': F_CONTROL,
      if (F_FEATURE_CONSERVATION != null)
        'f_feature_conservation': F_FEATURE_CONSERVATION,
      if (F_Z_BOTTOM != null) 'f_z_bottom': F_Z_BOTTOM,
      if (F_FEATURE_DEPTH != null) 'f_feature_depth': F_FEATURE_DEPTH,
      if (F_Z_TOP != null) 'f_z_top': F_Z_TOP,
      if (F_REMARK != null) 'f_remark': F_REMARK,
      if (F_RECORDER != null) 'f_recorder': F_RECORDER,
      if (F_RECORD_TIME != null) 'f_record_time': F_RECORD_TIME,
      if (F_PROJECT_ID != null) 'f_project_id': F_PROJECT_ID,
      if (changed != null) 'changed': changed,
      if (inserted != null) 'inserted': inserted,
      if (deleted != null) 'deleted': deleted,
    });
  }

  FeaturesCompanion copyWith(
      {Value<String> F_FEATURE_ID,
      Value<String> F_UNIT_ID,
      Value<String> F_FEATURE,
      Value<String> F_FEATURE_TYPE,
      Value<int> F_DATE_BEGIN,
      Value<int> F_DATE_END,
      Value<String> F_BEGIN_PERIOD,
      Value<String> F_END_PERIOD,
      Value<bool> F_REJECTED,
      Value<String> F_CONTROL,
      Value<String> F_FEATURE_CONSERVATION,
      Value<String> F_Z_BOTTOM,
      Value<String> F_FEATURE_DEPTH,
      Value<String> F_Z_TOP,
      Value<String> F_REMARK,
      Value<String> F_RECORDER,
      Value<int> F_RECORD_TIME,
      Value<String> F_PROJECT_ID,
      Value<bool> changed,
      Value<bool> inserted,
      Value<bool> deleted}) {
    return FeaturesCompanion(
      F_FEATURE_ID: F_FEATURE_ID ?? this.F_FEATURE_ID,
      F_UNIT_ID: F_UNIT_ID ?? this.F_UNIT_ID,
      F_FEATURE: F_FEATURE ?? this.F_FEATURE,
      F_FEATURE_TYPE: F_FEATURE_TYPE ?? this.F_FEATURE_TYPE,
      F_DATE_BEGIN: F_DATE_BEGIN ?? this.F_DATE_BEGIN,
      F_DATE_END: F_DATE_END ?? this.F_DATE_END,
      F_BEGIN_PERIOD: F_BEGIN_PERIOD ?? this.F_BEGIN_PERIOD,
      F_END_PERIOD: F_END_PERIOD ?? this.F_END_PERIOD,
      F_REJECTED: F_REJECTED ?? this.F_REJECTED,
      F_CONTROL: F_CONTROL ?? this.F_CONTROL,
      F_FEATURE_CONSERVATION:
          F_FEATURE_CONSERVATION ?? this.F_FEATURE_CONSERVATION,
      F_Z_BOTTOM: F_Z_BOTTOM ?? this.F_Z_BOTTOM,
      F_FEATURE_DEPTH: F_FEATURE_DEPTH ?? this.F_FEATURE_DEPTH,
      F_Z_TOP: F_Z_TOP ?? this.F_Z_TOP,
      F_REMARK: F_REMARK ?? this.F_REMARK,
      F_RECORDER: F_RECORDER ?? this.F_RECORDER,
      F_RECORD_TIME: F_RECORD_TIME ?? this.F_RECORD_TIME,
      F_PROJECT_ID: F_PROJECT_ID ?? this.F_PROJECT_ID,
      changed: changed ?? this.changed,
      inserted: inserted ?? this.inserted,
      deleted: deleted ?? this.deleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (F_FEATURE_ID.present) {
      map['f_feature_id'] = Variable<String>(F_FEATURE_ID.value);
    }
    if (F_UNIT_ID.present) {
      map['f_unit_id'] = Variable<String>(F_UNIT_ID.value);
    }
    if (F_FEATURE.present) {
      map['f_feature'] = Variable<String>(F_FEATURE.value);
    }
    if (F_FEATURE_TYPE.present) {
      map['f_feature_type'] = Variable<String>(F_FEATURE_TYPE.value);
    }
    if (F_DATE_BEGIN.present) {
      map['f_date_begin'] = Variable<int>(F_DATE_BEGIN.value);
    }
    if (F_DATE_END.present) {
      map['f_date_end'] = Variable<int>(F_DATE_END.value);
    }
    if (F_BEGIN_PERIOD.present) {
      map['f_begin_period'] = Variable<String>(F_BEGIN_PERIOD.value);
    }
    if (F_END_PERIOD.present) {
      map['f_end_period'] = Variable<String>(F_END_PERIOD.value);
    }
    if (F_REJECTED.present) {
      map['f_rejected'] = Variable<bool>(F_REJECTED.value);
    }
    if (F_CONTROL.present) {
      map['f_control'] = Variable<String>(F_CONTROL.value);
    }
    if (F_FEATURE_CONSERVATION.present) {
      map['f_feature_conservation'] =
          Variable<String>(F_FEATURE_CONSERVATION.value);
    }
    if (F_Z_BOTTOM.present) {
      map['f_z_bottom'] = Variable<String>(F_Z_BOTTOM.value);
    }
    if (F_FEATURE_DEPTH.present) {
      map['f_feature_depth'] = Variable<String>(F_FEATURE_DEPTH.value);
    }
    if (F_Z_TOP.present) {
      map['f_z_top'] = Variable<String>(F_Z_TOP.value);
    }
    if (F_REMARK.present) {
      map['f_remark'] = Variable<String>(F_REMARK.value);
    }
    if (F_RECORDER.present) {
      map['f_recorder'] = Variable<String>(F_RECORDER.value);
    }
    if (F_RECORD_TIME.present) {
      map['f_record_time'] = Variable<int>(F_RECORD_TIME.value);
    }
    if (F_PROJECT_ID.present) {
      map['f_project_id'] = Variable<String>(F_PROJECT_ID.value);
    }
    if (changed.present) {
      map['changed'] = Variable<bool>(changed.value);
    }
    if (inserted.present) {
      map['inserted'] = Variable<bool>(inserted.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeaturesCompanion(')
          ..write('F_FEATURE_ID: $F_FEATURE_ID, ')
          ..write('F_UNIT_ID: $F_UNIT_ID, ')
          ..write('F_FEATURE: $F_FEATURE, ')
          ..write('F_FEATURE_TYPE: $F_FEATURE_TYPE, ')
          ..write('F_DATE_BEGIN: $F_DATE_BEGIN, ')
          ..write('F_DATE_END: $F_DATE_END, ')
          ..write('F_BEGIN_PERIOD: $F_BEGIN_PERIOD, ')
          ..write('F_END_PERIOD: $F_END_PERIOD, ')
          ..write('F_REJECTED: $F_REJECTED, ')
          ..write('F_CONTROL: $F_CONTROL, ')
          ..write('F_FEATURE_CONSERVATION: $F_FEATURE_CONSERVATION, ')
          ..write('F_Z_BOTTOM: $F_Z_BOTTOM, ')
          ..write('F_FEATURE_DEPTH: $F_FEATURE_DEPTH, ')
          ..write('F_Z_TOP: $F_Z_TOP, ')
          ..write('F_REMARK: $F_REMARK, ')
          ..write('F_RECORDER: $F_RECORDER, ')
          ..write('F_RECORD_TIME: $F_RECORD_TIME, ')
          ..write('F_PROJECT_ID: $F_PROJECT_ID, ')
          ..write('changed: $changed, ')
          ..write('inserted: $inserted, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }
}

class $FeaturesTable extends Features with TableInfo<$FeaturesTable, Feature> {
  final GeneratedDatabase _db;
  final String _alias;
  $FeaturesTable(this._db, [this._alias]);
  final VerificationMeta _F_FEATURE_IDMeta =
      const VerificationMeta('F_FEATURE_ID');
  GeneratedTextColumn _F_FEATURE_ID;
  @override
  GeneratedTextColumn get F_FEATURE_ID =>
      _F_FEATURE_ID ??= _constructFFeatureId();
  GeneratedTextColumn _constructFFeatureId() {
    return GeneratedTextColumn(
      'f_feature_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_UNIT_IDMeta = const VerificationMeta('F_UNIT_ID');
  GeneratedTextColumn _F_UNIT_ID;
  @override
  GeneratedTextColumn get F_UNIT_ID => _F_UNIT_ID ??= _constructFUnitId();
  GeneratedTextColumn _constructFUnitId() {
    return GeneratedTextColumn(
      'f_unit_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_FEATUREMeta = const VerificationMeta('F_FEATURE');
  GeneratedTextColumn _F_FEATURE;
  @override
  GeneratedTextColumn get F_FEATURE => _F_FEATURE ??= _constructFFeature();
  GeneratedTextColumn _constructFFeature() {
    return GeneratedTextColumn(
      'f_feature',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_FEATURE_TYPEMeta =
      const VerificationMeta('F_FEATURE_TYPE');
  GeneratedTextColumn _F_FEATURE_TYPE;
  @override
  GeneratedTextColumn get F_FEATURE_TYPE =>
      _F_FEATURE_TYPE ??= _constructFFeatureType();
  GeneratedTextColumn _constructFFeatureType() {
    return GeneratedTextColumn(
      'f_feature_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_DATE_BEGINMeta =
      const VerificationMeta('F_DATE_BEGIN');
  GeneratedIntColumn _F_DATE_BEGIN;
  @override
  GeneratedIntColumn get F_DATE_BEGIN =>
      _F_DATE_BEGIN ??= _constructFDateBegin();
  GeneratedIntColumn _constructFDateBegin() {
    return GeneratedIntColumn(
      'f_date_begin',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_DATE_ENDMeta = const VerificationMeta('F_DATE_END');
  GeneratedIntColumn _F_DATE_END;
  @override
  GeneratedIntColumn get F_DATE_END => _F_DATE_END ??= _constructFDateEnd();
  GeneratedIntColumn _constructFDateEnd() {
    return GeneratedIntColumn(
      'f_date_end',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_BEGIN_PERIODMeta =
      const VerificationMeta('F_BEGIN_PERIOD');
  GeneratedTextColumn _F_BEGIN_PERIOD;
  @override
  GeneratedTextColumn get F_BEGIN_PERIOD =>
      _F_BEGIN_PERIOD ??= _constructFBeginPeriod();
  GeneratedTextColumn _constructFBeginPeriod() {
    return GeneratedTextColumn(
      'f_begin_period',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_END_PERIODMeta =
      const VerificationMeta('F_END_PERIOD');
  GeneratedTextColumn _F_END_PERIOD;
  @override
  GeneratedTextColumn get F_END_PERIOD =>
      _F_END_PERIOD ??= _constructFEndPeriod();
  GeneratedTextColumn _constructFEndPeriod() {
    return GeneratedTextColumn(
      'f_end_period',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_REJECTEDMeta = const VerificationMeta('F_REJECTED');
  GeneratedBoolColumn _F_REJECTED;
  @override
  GeneratedBoolColumn get F_REJECTED => _F_REJECTED ??= _constructFRejected();
  GeneratedBoolColumn _constructFRejected() {
    return GeneratedBoolColumn(
      'f_rejected',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_CONTROLMeta = const VerificationMeta('F_CONTROL');
  GeneratedTextColumn _F_CONTROL;
  @override
  GeneratedTextColumn get F_CONTROL => _F_CONTROL ??= _constructFControl();
  GeneratedTextColumn _constructFControl() {
    return GeneratedTextColumn(
      'f_control',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_FEATURE_CONSERVATIONMeta =
      const VerificationMeta('F_FEATURE_CONSERVATION');
  GeneratedTextColumn _F_FEATURE_CONSERVATION;
  @override
  GeneratedTextColumn get F_FEATURE_CONSERVATION =>
      _F_FEATURE_CONSERVATION ??= _constructFFeatureConservation();
  GeneratedTextColumn _constructFFeatureConservation() {
    return GeneratedTextColumn(
      'f_feature_conservation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_Z_BOTTOMMeta = const VerificationMeta('F_Z_BOTTOM');
  GeneratedTextColumn _F_Z_BOTTOM;
  @override
  GeneratedTextColumn get F_Z_BOTTOM => _F_Z_BOTTOM ??= _constructFZBottom();
  GeneratedTextColumn _constructFZBottom() {
    return GeneratedTextColumn(
      'f_z_bottom',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_FEATURE_DEPTHMeta =
      const VerificationMeta('F_FEATURE_DEPTH');
  GeneratedTextColumn _F_FEATURE_DEPTH;
  @override
  GeneratedTextColumn get F_FEATURE_DEPTH =>
      _F_FEATURE_DEPTH ??= _constructFFeatureDepth();
  GeneratedTextColumn _constructFFeatureDepth() {
    return GeneratedTextColumn(
      'f_feature_depth',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_Z_TOPMeta = const VerificationMeta('F_Z_TOP');
  GeneratedTextColumn _F_Z_TOP;
  @override
  GeneratedTextColumn get F_Z_TOP => _F_Z_TOP ??= _constructFZTop();
  GeneratedTextColumn _constructFZTop() {
    return GeneratedTextColumn(
      'f_z_top',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_REMARKMeta = const VerificationMeta('F_REMARK');
  GeneratedTextColumn _F_REMARK;
  @override
  GeneratedTextColumn get F_REMARK => _F_REMARK ??= _constructFRemark();
  GeneratedTextColumn _constructFRemark() {
    return GeneratedTextColumn(
      'f_remark',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_RECORDERMeta = const VerificationMeta('F_RECORDER');
  GeneratedTextColumn _F_RECORDER;
  @override
  GeneratedTextColumn get F_RECORDER => _F_RECORDER ??= _constructFRecorder();
  GeneratedTextColumn _constructFRecorder() {
    return GeneratedTextColumn(
      'f_recorder',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_RECORD_TIMEMeta =
      const VerificationMeta('F_RECORD_TIME');
  GeneratedIntColumn _F_RECORD_TIME;
  @override
  GeneratedIntColumn get F_RECORD_TIME =>
      _F_RECORD_TIME ??= _constructFRecordTime();
  GeneratedIntColumn _constructFRecordTime() {
    return GeneratedIntColumn(
      'f_record_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_PROJECT_IDMeta =
      const VerificationMeta('F_PROJECT_ID');
  GeneratedTextColumn _F_PROJECT_ID;
  @override
  GeneratedTextColumn get F_PROJECT_ID =>
      _F_PROJECT_ID ??= _constructFProjectId();
  GeneratedTextColumn _constructFProjectId() {
    return GeneratedTextColumn(
      'f_project_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _changedMeta = const VerificationMeta('changed');
  GeneratedBoolColumn _changed;
  @override
  GeneratedBoolColumn get changed => _changed ??= _constructChanged();
  GeneratedBoolColumn _constructChanged() {
    return GeneratedBoolColumn('changed', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _insertedMeta = const VerificationMeta('inserted');
  GeneratedBoolColumn _inserted;
  @override
  GeneratedBoolColumn get inserted => _inserted ??= _constructInserted();
  GeneratedBoolColumn _constructInserted() {
    return GeneratedBoolColumn('inserted', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  GeneratedBoolColumn _deleted;
  @override
  GeneratedBoolColumn get deleted => _deleted ??= _constructDeleted();
  GeneratedBoolColumn _constructDeleted() {
    return GeneratedBoolColumn('deleted', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        F_FEATURE_ID,
        F_UNIT_ID,
        F_FEATURE,
        F_FEATURE_TYPE,
        F_DATE_BEGIN,
        F_DATE_END,
        F_BEGIN_PERIOD,
        F_END_PERIOD,
        F_REJECTED,
        F_CONTROL,
        F_FEATURE_CONSERVATION,
        F_Z_BOTTOM,
        F_FEATURE_DEPTH,
        F_Z_TOP,
        F_REMARK,
        F_RECORDER,
        F_RECORD_TIME,
        F_PROJECT_ID,
        changed,
        inserted,
        deleted
      ];
  @override
  $FeaturesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'features';
  @override
  final String actualTableName = 'features';
  @override
  VerificationContext validateIntegrity(Insertable<Feature> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('f_feature_id')) {
      context.handle(
          _F_FEATURE_IDMeta,
          F_FEATURE_ID.isAcceptableOrUnknown(
              data['f_feature_id'], _F_FEATURE_IDMeta));
    } else if (isInserting) {
      context.missing(_F_FEATURE_IDMeta);
    }
    if (data.containsKey('f_unit_id')) {
      context.handle(_F_UNIT_IDMeta,
          F_UNIT_ID.isAcceptableOrUnknown(data['f_unit_id'], _F_UNIT_IDMeta));
    } else if (isInserting) {
      context.missing(_F_UNIT_IDMeta);
    }
    if (data.containsKey('f_feature')) {
      context.handle(_F_FEATUREMeta,
          F_FEATURE.isAcceptableOrUnknown(data['f_feature'], _F_FEATUREMeta));
    } else if (isInserting) {
      context.missing(_F_FEATUREMeta);
    }
    if (data.containsKey('f_feature_type')) {
      context.handle(
          _F_FEATURE_TYPEMeta,
          F_FEATURE_TYPE.isAcceptableOrUnknown(
              data['f_feature_type'], _F_FEATURE_TYPEMeta));
    } else if (isInserting) {
      context.missing(_F_FEATURE_TYPEMeta);
    }
    if (data.containsKey('f_date_begin')) {
      context.handle(
          _F_DATE_BEGINMeta,
          F_DATE_BEGIN.isAcceptableOrUnknown(
              data['f_date_begin'], _F_DATE_BEGINMeta));
    } else if (isInserting) {
      context.missing(_F_DATE_BEGINMeta);
    }
    if (data.containsKey('f_date_end')) {
      context.handle(
          _F_DATE_ENDMeta,
          F_DATE_END.isAcceptableOrUnknown(
              data['f_date_end'], _F_DATE_ENDMeta));
    } else if (isInserting) {
      context.missing(_F_DATE_ENDMeta);
    }
    if (data.containsKey('f_begin_period')) {
      context.handle(
          _F_BEGIN_PERIODMeta,
          F_BEGIN_PERIOD.isAcceptableOrUnknown(
              data['f_begin_period'], _F_BEGIN_PERIODMeta));
    } else if (isInserting) {
      context.missing(_F_BEGIN_PERIODMeta);
    }
    if (data.containsKey('f_end_period')) {
      context.handle(
          _F_END_PERIODMeta,
          F_END_PERIOD.isAcceptableOrUnknown(
              data['f_end_period'], _F_END_PERIODMeta));
    } else if (isInserting) {
      context.missing(_F_END_PERIODMeta);
    }
    if (data.containsKey('f_rejected')) {
      context.handle(
          _F_REJECTEDMeta,
          F_REJECTED.isAcceptableOrUnknown(
              data['f_rejected'], _F_REJECTEDMeta));
    } else if (isInserting) {
      context.missing(_F_REJECTEDMeta);
    }
    if (data.containsKey('f_control')) {
      context.handle(_F_CONTROLMeta,
          F_CONTROL.isAcceptableOrUnknown(data['f_control'], _F_CONTROLMeta));
    } else if (isInserting) {
      context.missing(_F_CONTROLMeta);
    }
    if (data.containsKey('f_feature_conservation')) {
      context.handle(
          _F_FEATURE_CONSERVATIONMeta,
          F_FEATURE_CONSERVATION.isAcceptableOrUnknown(
              data['f_feature_conservation'], _F_FEATURE_CONSERVATIONMeta));
    } else if (isInserting) {
      context.missing(_F_FEATURE_CONSERVATIONMeta);
    }
    if (data.containsKey('f_z_bottom')) {
      context.handle(
          _F_Z_BOTTOMMeta,
          F_Z_BOTTOM.isAcceptableOrUnknown(
              data['f_z_bottom'], _F_Z_BOTTOMMeta));
    } else if (isInserting) {
      context.missing(_F_Z_BOTTOMMeta);
    }
    if (data.containsKey('f_feature_depth')) {
      context.handle(
          _F_FEATURE_DEPTHMeta,
          F_FEATURE_DEPTH.isAcceptableOrUnknown(
              data['f_feature_depth'], _F_FEATURE_DEPTHMeta));
    } else if (isInserting) {
      context.missing(_F_FEATURE_DEPTHMeta);
    }
    if (data.containsKey('f_z_top')) {
      context.handle(_F_Z_TOPMeta,
          F_Z_TOP.isAcceptableOrUnknown(data['f_z_top'], _F_Z_TOPMeta));
    } else if (isInserting) {
      context.missing(_F_Z_TOPMeta);
    }
    if (data.containsKey('f_remark')) {
      context.handle(_F_REMARKMeta,
          F_REMARK.isAcceptableOrUnknown(data['f_remark'], _F_REMARKMeta));
    } else if (isInserting) {
      context.missing(_F_REMARKMeta);
    }
    if (data.containsKey('f_recorder')) {
      context.handle(
          _F_RECORDERMeta,
          F_RECORDER.isAcceptableOrUnknown(
              data['f_recorder'], _F_RECORDERMeta));
    } else if (isInserting) {
      context.missing(_F_RECORDERMeta);
    }
    if (data.containsKey('f_record_time')) {
      context.handle(
          _F_RECORD_TIMEMeta,
          F_RECORD_TIME.isAcceptableOrUnknown(
              data['f_record_time'], _F_RECORD_TIMEMeta));
    } else if (isInserting) {
      context.missing(_F_RECORD_TIMEMeta);
    }
    if (data.containsKey('f_project_id')) {
      context.handle(
          _F_PROJECT_IDMeta,
          F_PROJECT_ID.isAcceptableOrUnknown(
              data['f_project_id'], _F_PROJECT_IDMeta));
    } else if (isInserting) {
      context.missing(_F_PROJECT_IDMeta);
    }
    if (data.containsKey('changed')) {
      context.handle(_changedMeta,
          changed.isAcceptableOrUnknown(data['changed'], _changedMeta));
    }
    if (data.containsKey('inserted')) {
      context.handle(_insertedMeta,
          inserted.isAcceptableOrUnknown(data['inserted'], _insertedMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted'], _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {F_FEATURE_ID};
  @override
  Feature map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Feature.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FeaturesTable createAlias(String alias) {
    return $FeaturesTable(_db, alias);
  }
}

class RefFeatureType extends DataClass implements Insertable<RefFeatureType> {
  final String F_FEATURE_TYPE;
  final String F_DESCRIPTION;
  RefFeatureType({@required this.F_FEATURE_TYPE, @required this.F_DESCRIPTION});
  factory RefFeatureType.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return RefFeatureType(
      F_FEATURE_TYPE: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_feature_type']),
      F_DESCRIPTION: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || F_FEATURE_TYPE != null) {
      map['f_feature_type'] = Variable<String>(F_FEATURE_TYPE);
    }
    if (!nullToAbsent || F_DESCRIPTION != null) {
      map['f_description'] = Variable<String>(F_DESCRIPTION);
    }
    return map;
  }

  RefFeatureTypesCompanion toCompanion(bool nullToAbsent) {
    return RefFeatureTypesCompanion(
      F_FEATURE_TYPE: F_FEATURE_TYPE == null && nullToAbsent
          ? const Value.absent()
          : Value(F_FEATURE_TYPE),
      F_DESCRIPTION: F_DESCRIPTION == null && nullToAbsent
          ? const Value.absent()
          : Value(F_DESCRIPTION),
    );
  }

  factory RefFeatureType.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RefFeatureType(
      F_FEATURE_TYPE: serializer.fromJson<String>(json['F_FEATURE_TYPE']),
      F_DESCRIPTION: serializer.fromJson<String>(json['F_DESCRIPTION']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'F_FEATURE_TYPE': serializer.toJson<String>(F_FEATURE_TYPE),
      'F_DESCRIPTION': serializer.toJson<String>(F_DESCRIPTION),
    };
  }

  RefFeatureType copyWith({String F_FEATURE_TYPE, String F_DESCRIPTION}) =>
      RefFeatureType(
        F_FEATURE_TYPE: F_FEATURE_TYPE ?? this.F_FEATURE_TYPE,
        F_DESCRIPTION: F_DESCRIPTION ?? this.F_DESCRIPTION,
      );
  @override
  String toString() {
    return (StringBuffer('RefFeatureType(')
          ..write('F_FEATURE_TYPE: $F_FEATURE_TYPE, ')
          ..write('F_DESCRIPTION: $F_DESCRIPTION')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(F_FEATURE_TYPE.hashCode, F_DESCRIPTION.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RefFeatureType &&
          other.F_FEATURE_TYPE == this.F_FEATURE_TYPE &&
          other.F_DESCRIPTION == this.F_DESCRIPTION);
}

class RefFeatureTypesCompanion extends UpdateCompanion<RefFeatureType> {
  final Value<String> F_FEATURE_TYPE;
  final Value<String> F_DESCRIPTION;
  const RefFeatureTypesCompanion({
    this.F_FEATURE_TYPE = const Value.absent(),
    this.F_DESCRIPTION = const Value.absent(),
  });
  RefFeatureTypesCompanion.insert({
    @required String F_FEATURE_TYPE,
    @required String F_DESCRIPTION,
  })  : F_FEATURE_TYPE = Value(F_FEATURE_TYPE),
        F_DESCRIPTION = Value(F_DESCRIPTION);
  static Insertable<RefFeatureType> custom({
    Expression<String> F_FEATURE_TYPE,
    Expression<String> F_DESCRIPTION,
  }) {
    return RawValuesInsertable({
      if (F_FEATURE_TYPE != null) 'f_feature_type': F_FEATURE_TYPE,
      if (F_DESCRIPTION != null) 'f_description': F_DESCRIPTION,
    });
  }

  RefFeatureTypesCompanion copyWith(
      {Value<String> F_FEATURE_TYPE, Value<String> F_DESCRIPTION}) {
    return RefFeatureTypesCompanion(
      F_FEATURE_TYPE: F_FEATURE_TYPE ?? this.F_FEATURE_TYPE,
      F_DESCRIPTION: F_DESCRIPTION ?? this.F_DESCRIPTION,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (F_FEATURE_TYPE.present) {
      map['f_feature_type'] = Variable<String>(F_FEATURE_TYPE.value);
    }
    if (F_DESCRIPTION.present) {
      map['f_description'] = Variable<String>(F_DESCRIPTION.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RefFeatureTypesCompanion(')
          ..write('F_FEATURE_TYPE: $F_FEATURE_TYPE, ')
          ..write('F_DESCRIPTION: $F_DESCRIPTION')
          ..write(')'))
        .toString();
  }
}

class $RefFeatureTypesTable extends RefFeatureTypes
    with TableInfo<$RefFeatureTypesTable, RefFeatureType> {
  final GeneratedDatabase _db;
  final String _alias;
  $RefFeatureTypesTable(this._db, [this._alias]);
  final VerificationMeta _F_FEATURE_TYPEMeta =
      const VerificationMeta('F_FEATURE_TYPE');
  GeneratedTextColumn _F_FEATURE_TYPE;
  @override
  GeneratedTextColumn get F_FEATURE_TYPE =>
      _F_FEATURE_TYPE ??= _constructFFeatureType();
  GeneratedTextColumn _constructFFeatureType() {
    return GeneratedTextColumn(
      'f_feature_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_DESCRIPTIONMeta =
      const VerificationMeta('F_DESCRIPTION');
  GeneratedTextColumn _F_DESCRIPTION;
  @override
  GeneratedTextColumn get F_DESCRIPTION =>
      _F_DESCRIPTION ??= _constructFDescription();
  GeneratedTextColumn _constructFDescription() {
    return GeneratedTextColumn(
      'f_description',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [F_FEATURE_TYPE, F_DESCRIPTION];
  @override
  $RefFeatureTypesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'ref_feature_types';
  @override
  final String actualTableName = 'ref_feature_types';
  @override
  VerificationContext validateIntegrity(Insertable<RefFeatureType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('f_feature_type')) {
      context.handle(
          _F_FEATURE_TYPEMeta,
          F_FEATURE_TYPE.isAcceptableOrUnknown(
              data['f_feature_type'], _F_FEATURE_TYPEMeta));
    } else if (isInserting) {
      context.missing(_F_FEATURE_TYPEMeta);
    }
    if (data.containsKey('f_description')) {
      context.handle(
          _F_DESCRIPTIONMeta,
          F_DESCRIPTION.isAcceptableOrUnknown(
              data['f_description'], _F_DESCRIPTIONMeta));
    } else if (isInserting) {
      context.missing(_F_DESCRIPTIONMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {F_FEATURE_TYPE};
  @override
  RefFeatureType map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RefFeatureType.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RefFeatureTypesTable createAlias(String alias) {
    return $RefFeatureTypesTable(_db, alias);
  }
}

class RefFeatureConservation extends DataClass
    implements Insertable<RefFeatureConservation> {
  final String F_FEATURE_CONSERVATION;
  final String F_DESCRIPTION;
  RefFeatureConservation(
      {@required this.F_FEATURE_CONSERVATION, @required this.F_DESCRIPTION});
  factory RefFeatureConservation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return RefFeatureConservation(
      F_FEATURE_CONSERVATION: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}f_feature_conservation']),
      F_DESCRIPTION: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || F_FEATURE_CONSERVATION != null) {
      map['f_feature_conservation'] = Variable<String>(F_FEATURE_CONSERVATION);
    }
    if (!nullToAbsent || F_DESCRIPTION != null) {
      map['f_description'] = Variable<String>(F_DESCRIPTION);
    }
    return map;
  }

  RefFeatureConservationsCompanion toCompanion(bool nullToAbsent) {
    return RefFeatureConservationsCompanion(
      F_FEATURE_CONSERVATION: F_FEATURE_CONSERVATION == null && nullToAbsent
          ? const Value.absent()
          : Value(F_FEATURE_CONSERVATION),
      F_DESCRIPTION: F_DESCRIPTION == null && nullToAbsent
          ? const Value.absent()
          : Value(F_DESCRIPTION),
    );
  }

  factory RefFeatureConservation.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RefFeatureConservation(
      F_FEATURE_CONSERVATION:
          serializer.fromJson<String>(json['F_FEATURE_CONSERVATION']),
      F_DESCRIPTION: serializer.fromJson<String>(json['F_DESCRIPTION']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'F_FEATURE_CONSERVATION':
          serializer.toJson<String>(F_FEATURE_CONSERVATION),
      'F_DESCRIPTION': serializer.toJson<String>(F_DESCRIPTION),
    };
  }

  RefFeatureConservation copyWith(
          {String F_FEATURE_CONSERVATION, String F_DESCRIPTION}) =>
      RefFeatureConservation(
        F_FEATURE_CONSERVATION:
            F_FEATURE_CONSERVATION ?? this.F_FEATURE_CONSERVATION,
        F_DESCRIPTION: F_DESCRIPTION ?? this.F_DESCRIPTION,
      );
  @override
  String toString() {
    return (StringBuffer('RefFeatureConservation(')
          ..write('F_FEATURE_CONSERVATION: $F_FEATURE_CONSERVATION, ')
          ..write('F_DESCRIPTION: $F_DESCRIPTION')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(F_FEATURE_CONSERVATION.hashCode, F_DESCRIPTION.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RefFeatureConservation &&
          other.F_FEATURE_CONSERVATION == this.F_FEATURE_CONSERVATION &&
          other.F_DESCRIPTION == this.F_DESCRIPTION);
}

class RefFeatureConservationsCompanion
    extends UpdateCompanion<RefFeatureConservation> {
  final Value<String> F_FEATURE_CONSERVATION;
  final Value<String> F_DESCRIPTION;
  const RefFeatureConservationsCompanion({
    this.F_FEATURE_CONSERVATION = const Value.absent(),
    this.F_DESCRIPTION = const Value.absent(),
  });
  RefFeatureConservationsCompanion.insert({
    @required String F_FEATURE_CONSERVATION,
    @required String F_DESCRIPTION,
  })  : F_FEATURE_CONSERVATION = Value(F_FEATURE_CONSERVATION),
        F_DESCRIPTION = Value(F_DESCRIPTION);
  static Insertable<RefFeatureConservation> custom({
    Expression<String> F_FEATURE_CONSERVATION,
    Expression<String> F_DESCRIPTION,
  }) {
    return RawValuesInsertable({
      if (F_FEATURE_CONSERVATION != null)
        'f_feature_conservation': F_FEATURE_CONSERVATION,
      if (F_DESCRIPTION != null) 'f_description': F_DESCRIPTION,
    });
  }

  RefFeatureConservationsCompanion copyWith(
      {Value<String> F_FEATURE_CONSERVATION, Value<String> F_DESCRIPTION}) {
    return RefFeatureConservationsCompanion(
      F_FEATURE_CONSERVATION:
          F_FEATURE_CONSERVATION ?? this.F_FEATURE_CONSERVATION,
      F_DESCRIPTION: F_DESCRIPTION ?? this.F_DESCRIPTION,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (F_FEATURE_CONSERVATION.present) {
      map['f_feature_conservation'] =
          Variable<String>(F_FEATURE_CONSERVATION.value);
    }
    if (F_DESCRIPTION.present) {
      map['f_description'] = Variable<String>(F_DESCRIPTION.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RefFeatureConservationsCompanion(')
          ..write('F_FEATURE_CONSERVATION: $F_FEATURE_CONSERVATION, ')
          ..write('F_DESCRIPTION: $F_DESCRIPTION')
          ..write(')'))
        .toString();
  }
}

class $RefFeatureConservationsTable extends RefFeatureConservations
    with TableInfo<$RefFeatureConservationsTable, RefFeatureConservation> {
  final GeneratedDatabase _db;
  final String _alias;
  $RefFeatureConservationsTable(this._db, [this._alias]);
  final VerificationMeta _F_FEATURE_CONSERVATIONMeta =
      const VerificationMeta('F_FEATURE_CONSERVATION');
  GeneratedTextColumn _F_FEATURE_CONSERVATION;
  @override
  GeneratedTextColumn get F_FEATURE_CONSERVATION =>
      _F_FEATURE_CONSERVATION ??= _constructFFeatureConservation();
  GeneratedTextColumn _constructFFeatureConservation() {
    return GeneratedTextColumn(
      'f_feature_conservation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_DESCRIPTIONMeta =
      const VerificationMeta('F_DESCRIPTION');
  GeneratedTextColumn _F_DESCRIPTION;
  @override
  GeneratedTextColumn get F_DESCRIPTION =>
      _F_DESCRIPTION ??= _constructFDescription();
  GeneratedTextColumn _constructFDescription() {
    return GeneratedTextColumn(
      'f_description',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [F_FEATURE_CONSERVATION, F_DESCRIPTION];
  @override
  $RefFeatureConservationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'ref_feature_conservations';
  @override
  final String actualTableName = 'ref_feature_conservations';
  @override
  VerificationContext validateIntegrity(
      Insertable<RefFeatureConservation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('f_feature_conservation')) {
      context.handle(
          _F_FEATURE_CONSERVATIONMeta,
          F_FEATURE_CONSERVATION.isAcceptableOrUnknown(
              data['f_feature_conservation'], _F_FEATURE_CONSERVATIONMeta));
    } else if (isInserting) {
      context.missing(_F_FEATURE_CONSERVATIONMeta);
    }
    if (data.containsKey('f_description')) {
      context.handle(
          _F_DESCRIPTIONMeta,
          F_DESCRIPTION.isAcceptableOrUnknown(
              data['f_description'], _F_DESCRIPTIONMeta));
    } else if (isInserting) {
      context.missing(_F_DESCRIPTIONMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {F_FEATURE_CONSERVATION};
  @override
  RefFeatureConservation map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RefFeatureConservation.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RefFeatureConservationsTable createAlias(String alias) {
    return $RefFeatureConservationsTable(_db, alias);
  }
}

class RefPeriod extends DataClass implements Insertable<RefPeriod> {
  final String F_PERIOD;
  final String F_DESCRIPTION;
  RefPeriod({@required this.F_PERIOD, @required this.F_DESCRIPTION});
  factory RefPeriod.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return RefPeriod(
      F_PERIOD: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_period']),
      F_DESCRIPTION: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}f_description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || F_PERIOD != null) {
      map['f_period'] = Variable<String>(F_PERIOD);
    }
    if (!nullToAbsent || F_DESCRIPTION != null) {
      map['f_description'] = Variable<String>(F_DESCRIPTION);
    }
    return map;
  }

  RefPeriodsCompanion toCompanion(bool nullToAbsent) {
    return RefPeriodsCompanion(
      F_PERIOD: F_PERIOD == null && nullToAbsent
          ? const Value.absent()
          : Value(F_PERIOD),
      F_DESCRIPTION: F_DESCRIPTION == null && nullToAbsent
          ? const Value.absent()
          : Value(F_DESCRIPTION),
    );
  }

  factory RefPeriod.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RefPeriod(
      F_PERIOD: serializer.fromJson<String>(json['F_PERIOD']),
      F_DESCRIPTION: serializer.fromJson<String>(json['F_DESCRIPTION']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'F_PERIOD': serializer.toJson<String>(F_PERIOD),
      'F_DESCRIPTION': serializer.toJson<String>(F_DESCRIPTION),
    };
  }

  RefPeriod copyWith({String F_PERIOD, String F_DESCRIPTION}) => RefPeriod(
        F_PERIOD: F_PERIOD ?? this.F_PERIOD,
        F_DESCRIPTION: F_DESCRIPTION ?? this.F_DESCRIPTION,
      );
  @override
  String toString() {
    return (StringBuffer('RefPeriod(')
          ..write('F_PERIOD: $F_PERIOD, ')
          ..write('F_DESCRIPTION: $F_DESCRIPTION')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(F_PERIOD.hashCode, F_DESCRIPTION.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RefPeriod &&
          other.F_PERIOD == this.F_PERIOD &&
          other.F_DESCRIPTION == this.F_DESCRIPTION);
}

class RefPeriodsCompanion extends UpdateCompanion<RefPeriod> {
  final Value<String> F_PERIOD;
  final Value<String> F_DESCRIPTION;
  const RefPeriodsCompanion({
    this.F_PERIOD = const Value.absent(),
    this.F_DESCRIPTION = const Value.absent(),
  });
  RefPeriodsCompanion.insert({
    @required String F_PERIOD,
    @required String F_DESCRIPTION,
  })  : F_PERIOD = Value(F_PERIOD),
        F_DESCRIPTION = Value(F_DESCRIPTION);
  static Insertable<RefPeriod> custom({
    Expression<String> F_PERIOD,
    Expression<String> F_DESCRIPTION,
  }) {
    return RawValuesInsertable({
      if (F_PERIOD != null) 'f_period': F_PERIOD,
      if (F_DESCRIPTION != null) 'f_description': F_DESCRIPTION,
    });
  }

  RefPeriodsCompanion copyWith(
      {Value<String> F_PERIOD, Value<String> F_DESCRIPTION}) {
    return RefPeriodsCompanion(
      F_PERIOD: F_PERIOD ?? this.F_PERIOD,
      F_DESCRIPTION: F_DESCRIPTION ?? this.F_DESCRIPTION,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (F_PERIOD.present) {
      map['f_period'] = Variable<String>(F_PERIOD.value);
    }
    if (F_DESCRIPTION.present) {
      map['f_description'] = Variable<String>(F_DESCRIPTION.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RefPeriodsCompanion(')
          ..write('F_PERIOD: $F_PERIOD, ')
          ..write('F_DESCRIPTION: $F_DESCRIPTION')
          ..write(')'))
        .toString();
  }
}

class $RefPeriodsTable extends RefPeriods
    with TableInfo<$RefPeriodsTable, RefPeriod> {
  final GeneratedDatabase _db;
  final String _alias;
  $RefPeriodsTable(this._db, [this._alias]);
  final VerificationMeta _F_PERIODMeta = const VerificationMeta('F_PERIOD');
  GeneratedTextColumn _F_PERIOD;
  @override
  GeneratedTextColumn get F_PERIOD => _F_PERIOD ??= _constructFPeriod();
  GeneratedTextColumn _constructFPeriod() {
    return GeneratedTextColumn(
      'f_period',
      $tableName,
      false,
    );
  }

  final VerificationMeta _F_DESCRIPTIONMeta =
      const VerificationMeta('F_DESCRIPTION');
  GeneratedTextColumn _F_DESCRIPTION;
  @override
  GeneratedTextColumn get F_DESCRIPTION =>
      _F_DESCRIPTION ??= _constructFDescription();
  GeneratedTextColumn _constructFDescription() {
    return GeneratedTextColumn(
      'f_description',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [F_PERIOD, F_DESCRIPTION];
  @override
  $RefPeriodsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'ref_periods';
  @override
  final String actualTableName = 'ref_periods';
  @override
  VerificationContext validateIntegrity(Insertable<RefPeriod> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('f_period')) {
      context.handle(_F_PERIODMeta,
          F_PERIOD.isAcceptableOrUnknown(data['f_period'], _F_PERIODMeta));
    } else if (isInserting) {
      context.missing(_F_PERIODMeta);
    }
    if (data.containsKey('f_description')) {
      context.handle(
          _F_DESCRIPTIONMeta,
          F_DESCRIPTION.isAcceptableOrUnknown(
              data['f_description'], _F_DESCRIPTIONMeta));
    } else if (isInserting) {
      context.missing(_F_DESCRIPTIONMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {F_PERIOD};
  @override
  RefPeriod map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RefPeriod.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RefPeriodsTable createAlias(String alias) {
    return $RefPeriodsTable(_db, alias);
  }
}

abstract class _$InterrisDatabase extends GeneratedDatabase {
  _$InterrisDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $UnitsTable _units;
  $UnitsTable get units => _units ??= $UnitsTable(this);
  $PlanumsTable _planums;
  $PlanumsTable get planums => _planums ??= $PlanumsTable(this);
  $FeaturesTable _features;
  $FeaturesTable get features => _features ??= $FeaturesTable(this);
  $RefFeatureTypesTable _refFeatureTypes;
  $RefFeatureTypesTable get refFeatureTypes =>
      _refFeatureTypes ??= $RefFeatureTypesTable(this);
  $RefFeatureConservationsTable _refFeatureConservations;
  $RefFeatureConservationsTable get refFeatureConservations =>
      _refFeatureConservations ??= $RefFeatureConservationsTable(this);
  $RefPeriodsTable _refPeriods;
  $RefPeriodsTable get refPeriods => _refPeriods ??= $RefPeriodsTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as InterrisDatabase);
  UnitDao _unitDao;
  UnitDao get unitDao => _unitDao ??= UnitDao(this as InterrisDatabase);
  PlanumDao _planumDao;
  PlanumDao get planumDao => _planumDao ??= PlanumDao(this as InterrisDatabase);
  FeatureDao _featureDao;
  FeatureDao get featureDao =>
      _featureDao ??= FeatureDao(this as InterrisDatabase);
  RefFeatureTypeDao _refFeatureTypeDao;
  RefFeatureTypeDao get refFeatureTypeDao =>
      _refFeatureTypeDao ??= RefFeatureTypeDao(this as InterrisDatabase);
  RefFeatureConservationDao _refFeatureConservationDao;
  RefFeatureConservationDao get refFeatureConservationDao =>
      _refFeatureConservationDao ??=
          RefFeatureConservationDao(this as InterrisDatabase);
  RefPeriodDao _refPeriodDao;
  RefPeriodDao get refPeriodDao =>
      _refPeriodDao ??= RefPeriodDao(this as InterrisDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        units,
        planums,
        features,
        refFeatureTypes,
        refFeatureConservations,
        refPeriods
      ];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UserDaoMixin on DatabaseAccessor<InterrisDatabase> {
  $UsersTable get users => attachedDatabase.users;
}
mixin _$UnitDaoMixin on DatabaseAccessor<InterrisDatabase> {
  $UnitsTable get units => attachedDatabase.units;
}
mixin _$PlanumDaoMixin on DatabaseAccessor<InterrisDatabase> {
  $PlanumsTable get planums => attachedDatabase.planums;
}
mixin _$FeatureDaoMixin on DatabaseAccessor<InterrisDatabase> {
  $FeaturesTable get features => attachedDatabase.features;
}
mixin _$RefFeatureTypeDaoMixin on DatabaseAccessor<InterrisDatabase> {
  $RefFeatureTypesTable get refFeatureTypes => attachedDatabase.refFeatureTypes;
}
mixin _$RefFeatureConservationDaoMixin on DatabaseAccessor<InterrisDatabase> {
  $RefFeatureConservationsTable get refFeatureConservations =>
      attachedDatabase.refFeatureConservations;
}
mixin _$RefPeriodDaoMixin on DatabaseAccessor<InterrisDatabase> {
  $RefPeriodsTable get refPeriods => attachedDatabase.refPeriods;
}
