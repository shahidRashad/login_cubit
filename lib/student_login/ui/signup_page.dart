import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_app/student_login/helper/database_helper.dart';
import 'package:login_app/student_login/model/model_class.dart';
import 'package:login_app/student_login/ui/login_page.dart';
import 'package:login_app/widgets/custom_elevated_button.dart';
import 'package:login_app/widgets/custom_sized_box.dart';
import 'package:login_app/widgets/custom_text_field.dart';
import 'package:login_app/widgets/custom_text_form_field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController admController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();

  DatabaseHelper db = DatabaseHelper();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   //super.initState();
  //   db = DatabaseHelper();
  // }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Center(
              child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CustomtextField(
                        data: 'Sign Up',
                        font_color: Colors.blue,
                        font_size: 40,
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
                        validate:  (name) {
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
                        validate:  (email) {
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
                        validate:  (dob) {
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
                        validate:  (course) {
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
                        validate:  (adm) {
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
                        validate:  (mob) {
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
                        controller: passController, 
                        keyboardType: TextInputType.text,
                        label: 'Password',
                        hint: 'password',
                        validate:  (pass) {
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
                        button_text: 'Sign Up', 
                        onPressing: () {
                             if (formkey.currentState!.validate()) {
                               ModelClass localModel = ModelClass(
                                   name: nameController.text,
                                   email: emailController.text,
                                   dob: dobController.text,
                                   course: courseController.text,
                                   adm_no: admController.text,
                                   mob: mobileController.text,
                                   password: passController.text);
                               db.insertdata(localModel);
                               print(localModel.name);
                                Navigator.of(context).pop(context);
                               // Navigator.of(context).push(MaterialPageRoute(
                               //     builder: (context) => LoginPage()));
                              }
                          },
                          button_color: Colors.green,
                           ),
                    ],
                  )),
            ),
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
