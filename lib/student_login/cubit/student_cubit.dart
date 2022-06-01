import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/student_login/helper/database_helper.dart';
import 'package:login_app/student_login/model/model_class.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  DatabaseHelper db = DatabaseHelper();
  StudentCubit() : super(StudentInitial()){
    getDatas();
  } 
  Future<void> getDatas() async => emit(StudentState(datas: await db.getData(), data: []));
  Future<void> deleteData(int id) async=> emit(StudentState(value:  db.delete(id), datas: await db.getData(), data: []));
  Future<void> select(int id) async => emit(StudentState(data: await db.selectData(id), datas: await db.getData()));
  void setData(int index, TextEditingController nameController, TextEditingController emailController, TextEditingController dobController, TextEditingController courseController, TextEditingController admController, TextEditingController mobileController, TextEditingController passController){
    nameController.text = state.datas[index].name;
    emailController.text = state.datas[index].email;
    dobController.text = state.datas[index].dob;
    courseController.text = state.datas[index].course;
    admController.text = state.datas[index].adm_no;
    mobileController.text = state.datas[index].mob;
    passController.text = state.datas[index].password;
  }
}
