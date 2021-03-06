import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/student_login/cubit/student_cubit.dart';
import 'package:login_app/student_login/model/model_class.dart';
import 'package:login_app/student_login/ui/editing_page.dart';

class DataCard extends StatelessWidget {
   DataCard({Key? key, required this.data, required this.index})
      : super(key: key);
  ModelClass data;
  int index;
//final Function delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
        child: Row(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.email,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      data.dob,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      data.course,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      data.adm_no,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      data.mob,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      data.password,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditingPage(index: index)));
                      },
                      child: Text(
                        "Edit".toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)))),
                  BlocBuilder<StudentCubit, StudentState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            int id = state.datas[index].id!;
                            context.read<StudentCubit>().deleteData(id);
                          },
                          child: Text(
                            "Delete".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))));
                    },
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
