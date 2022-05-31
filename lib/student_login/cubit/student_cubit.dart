import 'package:bloc/bloc.dart';
import 'package:login_app/student_login/helper/database_helper.dart';
import 'package:login_app/student_login/model/model_class.dart';
import 'package:meta/meta.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  DatabaseHelper db = DatabaseHelper();
  StudentCubit() : super(StudentInitial());
  Future<void> getDatas() async => emit(StudentState(datas: await db.getData()));
}
