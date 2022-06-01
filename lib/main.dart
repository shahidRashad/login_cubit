import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/student_login/cubit/student_cubit.dart';
import 'package:login_app/student_login/ui/login_page.dart';

void main() {
  runApp(AppPage());
}


class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => StudentCubit(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
    ),
  );
  }
}

