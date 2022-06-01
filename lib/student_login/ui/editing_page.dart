import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/student_login/cubit/student_cubit.dart';
import 'package:login_app/student_login/helper/database_helper.dart';
import 'package:login_app/student_login/model/model_class.dart';
import 'package:login_app/student_login/ui/home_page.dart';
import 'package:login_app/widgets/custom_elevated_button.dart';
import 'package:login_app/widgets/custom_sized_box.dart';
import 'package:login_app/widgets/custom_text_field.dart';
import 'package:login_app/widgets/custom_text_form_field.dart';

class EditingPage extends StatelessWidget {
  int index;

  EditingPage({Key? key, required this.index}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController admController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    //setData();
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: BlocBuilder<StudentCubit, StudentState>(
            builder: (context, state) {
              int id = state.datas[index].id!;
              print(id);

              context.read<StudentCubit>().select(id);
              
              nameController.text = state.datas[index].name;
              emailController.text = state.datas[index].email;
              dobController.text = state.datas[index].dob;
              courseController.text = state.datas[index].course;
              admController.text = state.datas[index].adm_no;
              mobileController.text = state.datas[index].mob;
              passController.text = state.datas[index].password;

              return Container(
                child: Center(
                  child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomtextField(
                            data: 'Update',
                            font_size: 40,
                            font_color: Colors.blue,
                            weight: FontWeight.bold,
                          ),
                          CustomSizedBox(
                            height: 50,
                          ),
                          CustomTextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            label: 'Name',
                            hint: 'name',
                            validate: (name) {
                              if (isnameValidate(name!)) {
                                return null;
                              } else
                                return "*Required";
                            },
                          ),
                          CustomSizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            label: 'Email',
                            hint: 'email',
                            validate: (email) {
                              if (isEmailValidate(email!)) {
                                return null;
                              } else
                                return "Invalid Email";
                            },
                          ),
                          CustomSizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            controller: dobController,
                            keyboardType: TextInputType.datetime,
                            label: 'Date of birth',
                            hint: 'dd-mm-yyyy',
                            validate: (dob) {
                              if (isDOBValidate(dob!)) {
                                return null;
                              } else
                                return "Invalid DOB format";
                            },
                          ),
                          CustomSizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            controller: courseController,
                            keyboardType: TextInputType.text,
                            label: 'Course',
                            hint: 'course',
                            validate: (course) {
                              if (isCourseValidate(course!)) {
                                return null;
                              } else
                                return "*Required";
                            },
                          ),
                          CustomSizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            controller: admController,
                            keyboardType: TextInputType.number,
                            label: 'Admission Number',
                            hint: 'admission no',
                            validate: (adm) {
                              if (isADMValidate(adm!)) {
                                return null;
                              } else
                                return "*Required";
                            },
                          ),
                          CustomSizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            controller: mobileController,
                            keyboardType: TextInputType.phone,
                            label: 'Mobile Number',
                            hint: 'mobile no',
                            validate: (mob) {
                              if (isMobileValidate(mob!)) {
                                return null;
                              } else
                                return "Invalid Mobile no";
                            },
                          ),
                          CustomSizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            obsecure: true,
                            controller: passController,
                            keyboardType: TextInputType.text,
                            label: 'Password',
                            hint: 'password',
                            validate: (pass) {
                              if (isPasswordValidate(pass!)) {
                                return null;
                              } else
                                return "Entered password is too short";
                            },
                          ),
                          CustomSizedBox(
                            height: 10,
                          ),
                          CustomElevatedButton(
                            button_text: 'Update',
                            onPressing: () {
                              if (formkey.currentState!.validate()) {
                                ModelClass localModel = state.datas[index];
                                print(localModel.email);
                                localModel.name = nameController.text;
                                localModel.email = emailController.text;
                                localModel.dob = dobController.text;
                                localModel.course = courseController.text;
                                localModel.adm_no = admController.text;
                                localModel.mob = mobileController.text;
                                localModel.password = passController.text;
                                db.update(localModel, state.datas[index].id!);
                                Navigator.of(context).pop(context);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomePage()));
                              }
                            },
                            button_color: Colors.green,
                          ),
                        ],
                      )),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }

  bool isnameValidate(String s) {
    String pattern = r'^[a-zA-Z ]+([._]?[a-zA-Z ]+)+$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(s) && s != null);
  }

  bool isEmailValidate(String email) {
    String e_pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp nameReg = RegExp(e_pattern);
    return (nameReg.hasMatch(email) && email != null);
  }

  bool isDOBValidate(String dob) {
    String d_pattern =
        r"^(0[1-9]|[12][0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19|20)";
    RegExp nameReg = RegExp(d_pattern);
    return (nameReg.hasMatch(dob) && dob != null);
  }

  bool isCourseValidate(String course) {
    String pattern = r'^[a-zA-Z ]+([._]?[a-zA-Z ]+)*$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(course) && course != null);
  }

  bool isADMValidate(String adm) {
    String pattern = r'^[0-9]+$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(adm) && adm != null);
  }

  bool isMobileValidate(String mob) {
    String pattern = r'^[0-9]{10}$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(mob) && mob != null);
  }

  bool isPasswordValidate(String password) {
    String pattern = r'[a-zA-Z0-9]{6,}$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(password) && password != null);
  }
}
