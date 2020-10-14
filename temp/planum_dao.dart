import 'package:floor/floor.dart';
import '../models/planum.dart';

@dao
abstract class PlanumDao {
  @Query('SELECT * FROM Planum')
  Future<List<Planum>> findAllPlana();

  @Query('SELECT * FROM Planum WHERE F_PLANUM_ID = :id')
  Stream<Planum> findPersonById(String id);

  @insert
  Future<void> insertPlanum(Planum planum);

  @insert
  Future<List<int>> insertPlana(List<Planum> plana);

  @update
  Future<int> updatePlanum(List<Planum> plana);


  @Query('DELETE FROM Planum')
  Future<void> deleteAllPlana();



  @transaction
  Future<void> replacePlana(List<Planum> plana) async {
    await deleteAllPlana();
    await insertPlana(plana);
  }


}