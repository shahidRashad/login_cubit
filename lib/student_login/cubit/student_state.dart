part of 'student_cubit.dart';

class StudentState{
  DatabaseHelper db = DatabaseHelper();
  List<ModelClass> datas;
  List<ModelClass>? data;
  void value;
  StudentState({required this.datas, this.value, this.data});
}
class StudentInitial extends StudentState{
  StudentInitial() : super(datas: []);
  
  
}
