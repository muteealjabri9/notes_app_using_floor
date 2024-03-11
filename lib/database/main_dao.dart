import 'package:floor/floor.dart';

import 'note_entity.dart';

@dao
abstract class MainDao{

  @Query("SELECT * FROM NoteEntity")
  Future<List<NoteEntity>> getAllNotes();

  @insert
  Future<void> insertNote(NoteEntity noteEntity);

  @update
  Future<void> updateNote(NoteEntity noteEntity);

  @delete
  Future<void> deleteNote(NoteEntity noteEntity);


}