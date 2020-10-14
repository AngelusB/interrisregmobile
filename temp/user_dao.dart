import 'package:floor/floor.dart';
import '../models/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User WHERE F_PERSON_ID = :id')
  Stream<User> findUserById(int id);

  @Query('SELECT * FROM User WHERE F_USERNAME = :username')
  Future<User> findPasswordFromName(String username);
/*
  @Query('SELECT COUNT(*) FROM User')
  Future<String> getUserCount();
*/
  @Query('DELETE FROM User')
  Future<void> deleteAllUsers();

  // examples of changing multiple items with return

  @insert
  Future<List<int>> insertUsers(List<User> user);

  @update
  Future<int> updateUsers(List<User> user);


  @insert
  Future<void> insertUser(User user);

  @transaction
  Future<void> replaceUsers(List<User> users) async {
    await deleteAllUsers();
    await insertUsers(users);
  }
}