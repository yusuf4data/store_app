import 'package:flutter/material.dart';
import 'package:store_app/widgets/user_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Users'),
        ),
        body: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) => const UsersWidget(),
        ));
  }
}
