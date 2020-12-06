import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/data/entity/note.dart';
import 'package:tritek_lms/database/database.dart';

class NoteRepository {
  Future<List<Notes>> getNotes() async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final noteDao = database.notesDao;

    return await noteDao.findAll();
  }

  Future<List<Notes>> getByLessonId(int id) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final noteDao = database.notesDao;

    return await noteDao.findByLessonId(id);
  }

  Future<List<Notes>> getBySectionId(int id) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final noteDao = database.notesDao;

    return await noteDao.findBySectionId(id);
  }

  Future<List<Notes>> getByCourseId(int id) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final noteDao = database.notesDao;

    return await noteDao.findByCourseId(id);
  }

  Future<Notes> save(Notes note) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final noteDao = database.notesDao;

    int id = await noteDao.save(note);
    note.id = id;
    return note;
  }

  Future<Notes> update(Notes note) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final noteDao = database.notesDao;
    int id = await noteDao.update(note);
    note.id = id;
    return note;
  }

  Future<Notes> delete(Notes note) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final noteDao = database.notesDao;
    await noteDao.delete(note.id);

    return note;
  }

  Future<void> deleteAll() async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final noteDao = database.notesDao;
    noteDao.deleteAll();
  }
}
