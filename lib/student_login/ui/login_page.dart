import 'package:flutter/material.dart';
import 'package:login_app/student_login/helper/database_helper.dart';
import 'package:login_app/student_login/model/model_class.dart';
import 'package:login_app/student_login/ui/home_page.dart';
import 'package:login_app/student_login/ui/signup_page.dart';
import 'package:login_app/widgets/custom_elevated_button.dart';
import 'package:login_app/widgets/custom_sized_box.dart';
import 'package:login_app/widgets/custom_text_button.dart';
import 'package:login_app/widgets/custom_text_field.dart';
import 'package:login_app/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  DatabaseHelper db = DatabaseHelper();

  
  
  List<ModelClass> datas = [];

  //SharedPreferences logindata =  SharedPreferences.getInstance();
  
  // late SharedPreferences logindata;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   //super.initState();
  //   db = DatabaseHelper();
  //   //getLocal();
  // }

  // void getLocal() async {
  //   logindata = await SharedPreferences.getInstance();
  //   setState(() {
  //     userController.text = logindata.getString('username')!;
  //     passController.text = logindata.getString('password')!;
  //   });
  // }

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      CustomtextField(
                        data: 'Login',
                        font_size: 50,
                        font_color: Colors.black,
                        weight: FontWeight.bold,
                        ),
                      
                      CustomSizedBox(
                        height: 50,
                      ),

                      CustomTextFormField(
                        controller: userController,
                        label: 'Username or Email',
                        hint: 'username or email',
                        keyboardType: TextInputType.emailAddress,
                        text_color: Colors.black,
                        validate: (username) {
                          if (isUsernameValidate(username!)) {
                            return null;
                          } else
                            return 'Enter a valid username';
                        },
                      ),

                      CustomSizedBox(
                        height: 20,
                      ),

                      CustomTextFormField(
                        obsecure: true,
                        controller: passController,
                        label: 'Password',
                        hint: 'password',
                        keyboardType: TextInputType.text,
                        text_color: Colors.black,
                        validate: (password) {
                          if (isPasswordValidate(password!)) {
                            return null;
                          } else
                            return "Entered password is too short";
                        },
                      ),
                      
                      CustomSizedBox(
                        height: 30,
                      ),

                      CustomElevatedButton(
                        button_text: 'Login',
                        button_color: Colors.green,
                        onPressing: () async{
                          if (formkey.currentState!.validate()) {
                            String userName = userController.text.toString();
                            String Password = passController.text.toString();
                            datas = await db.check_log(userName, Password);
                            if (datas.isEmpty) {
                              print("error");
                            } else {
                            //   logindata.setString('username', userName);
                            //   logindata.setString('password', Password);
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          }
                          }
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomtextField(
                            data: 'Not a User?',
                            font_color: Colors.black,
                            font_size: 15,),
                          
                          CustomTextButton(
                            widget: CustomtextField(
                              data: 'Sign Up',
                              font_size: 18,
                              font_color: Colors.blueAccent,
                              weight: FontWeight.bold,
                            ), 
                            onPress:  () {
                                Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupPage()));
                              },
                          ),
                          
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isUsernameValidate(String username) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(username) && username != null);
  }

  bool isPasswordValidate(String password) {
    String pattern = r'[a-zA-Z0-9]{6,}$';
    RegExp nameReg = RegExp(pattern);
    return (nameReg.hasMatch(password) && password != null);
  }

  
}
