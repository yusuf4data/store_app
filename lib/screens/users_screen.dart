import 'package:flutter/material.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/services/api_handler.dart';
import 'package:store_app/widgets/user_widget.dart';


class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserModel> allUsers = [];
  Future<List<UserModel>> getAllUsers() async {
    allUsers = await APIHandler<UserModel>().getAllData('users');
    return allUsers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: FutureBuilder(
        future: getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return UsersWidget(userModel: snapshot.data![index]);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
