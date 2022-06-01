import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/student_login/cubit/student_cubit.dart';
import 'package:login_app/student_login/helper/database_helper.dart';
import 'package:login_app/student_login/model/model_class.dart';
import 'package:login_app/student_login/ui/data_card.dart';
import 'package:login_app/student_login/ui/login_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

 //DatabaseHelper db = DatabaseHelper();
 // List<ModelClass> datas= [];
  // void getDatas() async{
  //   datas = await db.getData();
  // }
@override
  Widget build(BuildContext context) {
    // context.read<StudentCubit>().getDatas();
    return Scaffold(
      appBar: AppBar(title: Text("Home Page",style: TextStyle(color: Colors.white),),
      actions: [
        IconButton(onPressed: (){
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginPage()));
        }, icon: Icon(Icons.logout))
      ],),
      
      
      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          return Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (context, index) => DataCard(data: state.datas[index], index: index),
                itemCount: state.datas.length,
                ),
              
            );
        },
      )
    );
  }

  

//   void delete(int index) {
//     db.delete(datas[index].id!);
//     setState(() {
//       datas.removeAt(index);
//     });
// }
    
}
