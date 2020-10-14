import 'package:floor/floor.dart';
import '../models/unit.dart';

@dao
abstract class UnitDao {
  @Query('SELECT * FROM Unit')
  Future<List<Unit>> findAllUnits();

  @Query('SELECT * FROM Unit WHERE F_UNIT_ID = :id')
  Stream<Unit> findUnitById(String id);

  @insert
  Future<void> insertUnit(Unit unit);

  @insert
  Future<List<int>> insertUnits(List<Unit> unit);

  @update
  Future<int> updateUnit(List<Unit> units);


  @Query('DELETE FROM Unit')
  Future<void> deleteAllUnits();



  @transaction
  Future<void> replaceUnits(List<Unit> units) async {
    await deleteAllUnits();
    await insertUnits(units);
  }
}


/*
// definition
@Query('SELECT * FROM Person')
Stream<List<Person>> findAllPersonsAsStream();

// usage
StreamBuilder<List<Person>>(
  stream: dao.findAllPersonsAsStream(),
  builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
    // do something with the values here
  },
);
 */
