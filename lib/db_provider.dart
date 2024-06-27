import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:re_database/database_app.dart';

class dbProvider extends ChangeNotifier{

  List<Map<String , dynamic>> _AllNotes = [];

  void addNote({required title , required desc})
 async {
   bool check = await AppDatabase.db.insertNote(title: title, desc: desc);

   if(check){
     _AllNotes = await AppDatabase.db.fetchAllNotes();
     notifyListeners();
   }
  }

 List<Map<String , dynamic>> fetchAllNotes(){
    return _AllNotes;
  }

}