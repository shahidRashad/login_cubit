import 'package:bloc/bloc.dart';
import 'package:login_app/student_login/helper/database_helper.dart';
import 'package:login_app/student_login/model/model_class.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  DatabaseHelper db = DatabaseHelper();
  StudentCubit() : super(StudentInitial());  
  Future<void> getDatas() async => emit(StudentState(datas: await db.getData()));
  Future<void> deleteData(int id) async=> emit(StudentState(value:  db.delete(id), datas: await db.getData()));
  Future<void> select(id) async => emit(StudentState(data: await db.selectData(id), datas: await db.getData()));
}
