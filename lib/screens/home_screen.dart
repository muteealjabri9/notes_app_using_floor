import 'package:flutter/material.dart';
import 'package:notes_app_using_floor/database/database.dart';
import 'package:notes_app_using_floor/database/note_entity.dart';
import 'package:notes_app_using_floor/screens/add_update_note.dart';

class HomeScreen extends StatefulWidget {
  final AppDatabase database;
  const HomeScreen({super.key, required this.database});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // function  to view All Notes

  List<NoteEntity> allNotes=[];
  getAllNotes()async{
    List<NoteEntity> list=await widget.database.mainDao.getAllNotes();
    setState(() {
      allNotes=list;
    });


  }
  @override
  void initState() {
    getAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floor Curd"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (c)=>AddUpdateNote(database: widget.database, updateData:getAllNotes)));
        },
      ),
      body: SafeArea(
        child:allNotes.isEmpty? Center(child: Text("No Notes Saved Before"),):
        ListView.builder(
             itemCount: allNotes.length,
            itemBuilder: (context,index){
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c)=>AddUpdateNote(noteEntity:allNotes[index],database: widget.database, updateData:getAllNotes)));
            },
            title: Text(allNotes[index].title!),subtitle: Text(allNotes[index].date!),);
        }),
      ),
    );
  }
}
