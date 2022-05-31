part of 'student_cubit.dart';

class StudentState{
  DatabaseHelper db = DatabaseHelper();
  List<ModelClass> datas;
  StudentState({required this.datas});
}
class StudentInitial extends StudentState{
  StudentInitial() : super(datas: []);
  
  // Future<List<ModelClass>> getdata() async{
  //   List<ModelClass> datas;
  //   DatabaseHelper db = DatabaseHelper();
  //   datas = await db.getData();
  //   return datas;
  // }
}
