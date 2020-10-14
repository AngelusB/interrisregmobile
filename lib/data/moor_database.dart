import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Users extends Table {
  TextColumn get F_PERSON_ID => text().withLength(min: 6, max: 32)();

  TextColumn get F_PERSON => text()();

  TextColumn get F_USERNAME => text()();

  TextColumn get F_PASSWORD => text()();

  Set<Column> get primaryKey => {F_PERSON_ID};
}

class Units extends Table {
  TextColumn get F_UNIT_ID => text()();

  TextColumn get F_UNIT => text()();

  TextColumn get F_REMARK => text()();

  TextColumn get F_RECORDER => text()();

  IntColumn get F_RECORD_TIME => integer()();

  TextColumn get F_PROJECT_ID => text()();

  BoolColumn get changed => boolean().withDefault(const Constant(false))();

  BoolColumn get inserted => boolean().withDefault(const Constant(false))();

  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  Set<Column> get primaryKey => {F_UNIT_ID};
}

class Planums extends Table {
  TextColumn get F_PLANUM_ID => text()();

  TextColumn get F_UNIT_ID => text()();

  TextColumn get F_PLANUM => text()();

  TextColumn get F_REMARK => text()();

  TextColumn get F_RECORDER => text()();

  IntColumn get F_RECORD_TIME => integer()();

  TextColumn get F_PROJECT_ID => text()();

  TextColumn get F_PLANUM_TYPE => text()();

  TextColumn get F_BEGIN_DATE => text()();

  TextColumn get F_END_DATE => text()();

  BoolColumn get changed => boolean().withDefault(const Constant(false))();

  BoolColumn get inserted => boolean().withDefault(const Constant(false))();

  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  Set<Column> get primaryKey => {F_PLANUM_ID};
}

class Features extends Table {
  TextColumn get F_FEATURE_ID => text()();

  TextColumn get F_UNIT_ID => text()();

  TextColumn get F_FEATURE => text()();

  TextColumn get F_FEATURE_TYPE => text()();

  IntColumn get F_DATE_BEGIN => integer()();

  IntColumn get F_DATE_END => integer()();

  TextColumn get F_BEGIN_PERIOD => text()();

  TextColumn get F_END_PERIOD => text()();

  BoolColumn get F_REJECTED => boolean()();

  TextColumn get F_CONTROL => text()();

  TextColumn get F_FEATURE_CONSERVATION => text()();

  TextColumn get F_Z_BOTTOM => text()();

  TextColumn get F_FEATURE_DEPTH => text()();

  TextColumn get F_Z_TOP => text()();

  TextColumn get F_REMARK => text()();

  TextColumn get F_RECORDER => text()();

  IntColumn get F_RECORD_TIME => integer()();

  TextColumn get F_PROJECT_ID => text()();

  BoolColumn get changed => boolean().withDefault(const Constant(false))();

  BoolColumn get inserted => boolean().withDefault(const Constant(false))();

  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  Set<Column> get primaryKey => {F_FEATURE_ID};
}

class RefFeatureTypes extends Table {
  TextColumn get F_FEATURE_TYPE => text()();
  TextColumn get F_DESCRIPTION => text()();
  Set<Column> get primaryKey => {F_FEATURE_TYPE};
}
class RefFeatureConservations extends Table {
  TextColumn get F_FEATURE_CONSERVATION => text()();
  TextColumn get F_DESCRIPTION => text()();
  Set<Column> get primaryKey => {F_FEATURE_CONSERVATION};
}

class RefPeriods extends Table {
  TextColumn get F_PERIOD => text()();
  TextColumn get F_DESCRIPTION => text()();
  Set<Column> get primaryKey => {F_PERIOD};
}


@UseMoor(
    tables: [Users, Units, Planums, Features,RefFeatureTypes,RefFeatureConservations,RefPeriods],
    daos: [UserDao, UnitDao, PlanumDao, FeatureDao,RefFeatureTypeDao,RefFeatureConservationDao,RefPeriodDao])
class InterrisDatabase extends _$InterrisDatabase {
  InterrisDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "interrisreg.db", logStatements: true));

  int get schemaVersion => 3;
}

@override
MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
      return m.createAllTables();
    }, onUpgrade: (Migrator m, int from, int to) async {
      /*  if (from == 4) {
        // we added the dueDate property in the change from version 1
        await m.addColumn(Units, Units.);
        await m.addColumn(planums,planums.deleted);
      }

     */
    });

//==============================================================================
// DAO
//  ========   I N F O ======================
//https://www.youtube.com/watch?v=KczX8DISRgI  !!!!!!!!!!!!!
//https://resocoder.com/2019/07/10/moor-room-for-flutter-2-advanced-queries-daos-fluent-sqlite-database/

// N.B. boolean in MOOR  1=true
//https://pub.dev/packages/moor_flutter/versions/1.2.0#ordering
//=========== USERS DAO      =================================================================
@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<InterrisDatabase> with _$UserDaoMixin {
  UserDao(InterrisDatabase db) : super(db);

  Future insertNewUser(User user) => into(users).insert(user);

  Stream<List<User>> watchAllUsers() => select(users).watch();

  Future deleteAllUsers() {
    delete(users).go();
  }

  Future<User> getPassword(String username) async {
//    Future<List<Animal>> findAnimalsByLegs(int legCount) {
    //    return (select(animals)..where((a) => a.legs.equals(legCount))).get();
//    }
    return (await select(users)
          ..where((tbl) => tbl.F_USERNAME.equals(username)))
        .getSingle();
  }

  Future<List<User>> getAllUsers() => select(users).get();

  Future<int> countUsers() async {
    int res = (await select(users).get()).length;
    return res;
  }
}

//=========== UNITS DAO      =================================================================
@UseDao(tables: [Units])
class UnitDao extends DatabaseAccessor<InterrisDatabase> with _$UnitDaoMixin {
  final InterrisDatabase db;

  UnitDao(this.db) : super(db);

  Future<List<Unit>> getAllUnitsOrdered() {
    return (select(units)..orderBy([(t) => OrderingTerm(expression: t.F_UNIT)]))
        .get();
  }

  Future<List<Unit>> getAllUnits() => select(units).get();

  Stream<List<Unit>> watchAllUnits(String filter) {
    if (filter == "") {
      return (select(units)
            ..orderBy([(tbl) => OrderingTerm(expression: tbl.F_UNIT)]))
          .watch();
    } else {
      return (select(units)
            ..where((tbl) => tbl.F_UNIT.contains(filter))
            ..orderBy([(tbl) => OrderingTerm(expression: tbl.F_UNIT)]))
          .watch();
    }
  }

  Future insertUnit(Insertable<Unit> unit) => into(units).insert(unit);

  Future updateUnit(Insertable<Unit> unit) => update(units).replace(unit);

  Future deleteAllUnits() => delete(units).go();

  Future deleteUnit(Insertable<Unit> unit) => delete(units).delete(unit);

  Future<int> countUnits() async {
    return (await select(units).get()).length;
  }

  Future<Unit> getUnit(String unitId) async {
    return (await select(units)
          ..where((tbl) => tbl.F_UNIT_ID.equals(unitId)))
        .getSingle();
  }
}

//=========== PLAMUM DAO      =================================================================

@UseDao(tables: [Planums])
class PlanumDao extends DatabaseAccessor<InterrisDatabase>
    with _$PlanumDaoMixin {
  final InterrisDatabase db;

  PlanumDao(this.db) : super(db);

  Future<List<Planum>> getAllPlanaOrdered() {
    return (select(planums)
          ..orderBy([(t) => OrderingTerm(expression: t.F_PLANUM)]))
        .get();
  }

  Future<List<Planum>> getAllPlanums() => select(planums).get();

  Stream<List<Planum>> watchAllPlanaFromUnit(Unit unit) {
    if (Unit == null) {
      return (select(planums)
            ..orderBy([(tbl) => OrderingTerm(expression: tbl.F_PLANUM)]))
          .watch();
    } else {
      return (select(planums)
            ..where((tbl) => //tbl.F_UNIT_ID.contains(filter)
                tbl.F_UNIT_ID.equals(unit.F_UNIT_ID))
            ..orderBy([(tbl) => OrderingTerm(expression: tbl.F_PLANUM)]))
          .watch();
    }
  }

  Future insertPlanum(Insertable<Planum> planum) =>
      into(planums).insert(planum);

  Future updatePlanum(Insertable<Planum> planum) =>
      update(planums).replace(planum);

  Future deleteAllPlanums() => delete(planums).go();

  Future deletePlanum(Insertable<Planum> planum) =>
      delete(planums).delete(planum);

  Future<int> countPlanums() async {
    return (await select(planums).get()).length;
  }
}

//=========== FEATURE DAO      =================================================================

@UseDao(tables: [Features])
class FeatureDao extends DatabaseAccessor<InterrisDatabase>
    with _$FeatureDaoMixin {
  final InterrisDatabase db;

  FeatureDao(this.db) : super(db);

  Future<List<Feature>> getAllPlanaOrdered() {
    return (select(features)
          ..orderBy([(t) => OrderingTerm(expression: t.F_FEATURE)]))
        .get();
  }

  Future<List<Feature>> getAllFeatures() => select(features).get();

  Stream<List<Feature>> watchAllFeaturesFromUnit(Unit unit) {
    if (Unit == null) {
      return (select(features)
            ..orderBy([(tbl) => OrderingTerm(expression: tbl.F_FEATURE)]))
          .watch();
    } else {
      return (select(features)
            ..where((tbl) => //tbl.F_UNIT_ID.contains(filter)
                tbl.F_UNIT_ID.equals(unit.F_UNIT_ID))
            ..orderBy([(tbl) => OrderingTerm(expression: tbl.F_FEATURE)]))
          .watch();
    }
  }

  Future insertFeature(Insertable<Feature> feature) =>
      into(features).insert(feature);

  Future updateFeature(Insertable<Feature> feature) =>
      update(features).replace(feature);

  Future deleteAllFeatures() => delete(features).go();

  Future deleteFeature(Insertable<Feature> feature) =>
      delete(features).delete(feature);

  Future<int> countFeatures() async {
    return (await select(features).get()).length;
  }
}



@UseDao(tables: [RefFeatureTypes])
class RefFeatureTypeDao extends DatabaseAccessor<InterrisDatabase>
    with _$RefFeatureTypeDaoMixin {
  final InterrisDatabase db;

  RefFeatureTypeDao(this.db) : super(db);

  Future insertRefFeatureType(Insertable<RefFeatureType> reffeaturetype) =>
      into(refFeatureTypes).insert(reffeaturetype);

  Future<List<RefFeatureType>> getAllRefFeatureTypeOrdered() async {
    return (select(refFeatureTypes)
      ..orderBy([(t) => OrderingTerm(expression: t.F_DESCRIPTION)]))
        .get();
  }

  Future deleteAllRefFeatureType() => delete(refFeatureTypes).go();

  Future<int> countRefFeatureTypes() async {
    return (await select(refFeatureTypes).get()).length;
  }

}


@UseDao(tables: [RefFeatureConservations])
class RefFeatureConservationDao extends DatabaseAccessor<InterrisDatabase>
    with _$RefFeatureConservationDaoMixin {
  final InterrisDatabase db;

  RefFeatureConservationDao(this.db) : super(db);

  Future insertRefFeatureConservation(Insertable<RefFeatureConservation> reffeatureconservation) =>
      into(refFeatureConservations).insert(reffeatureconservation);

  Future<List<RefFeatureConservation>> getAllRefFeatureConservationOrdered() async {
    return (select(refFeatureConservations)
      ..orderBy([(t) => OrderingTerm(expression: t.F_DESCRIPTION)]))
        .get();
  }

  Future deleteAllRefFeatureConservation() => delete(refFeatureConservations).go();

  Future<int> countRefFeatureConservations() async {
    return (await select(refFeatureConservations).get()).length;
  }

}


@UseDao(tables: [RefPeriods])
class RefPeriodDao extends DatabaseAccessor<InterrisDatabase>
    with _$RefPeriodDaoMixin {
  final InterrisDatabase db;

  RefPeriodDao(this.db) : super(db);

  Future insertRefPeriod(Insertable<RefPeriod> refperiod) =>
      into(refPeriods).insert(refperiod);

  Future<List<RefPeriod>> getAllRefPeriodOrdered() async {
    return (select(refPeriods)
      ..orderBy([(t) => OrderingTerm(expression: t.F_DESCRIPTION)]))
        .get();
  }

  Future deleteAllRefPeriod() => delete(refPeriods).go();

  Future<int> countRefPeriods() async {
    return (await select(refPeriods).get()).length;
  }

}


/*

https://moor.simonbinder.eu/docs/getting-started/

Moor integrates with the dart build system, so you can generate all the code needed with
flutter packages pub run build_runner build.
If you want to continously rebuild the generated code whever you change your code,



flutter packages pub run build_runner watch
instead.

flutter packages pub run build_runner build --delete-conflicting-outputs
 */
