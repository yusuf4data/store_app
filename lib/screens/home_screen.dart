import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:store_app/widgets/app_bar_icons.dart';
import 'package:store_app/widgets/my_input_decoration.dart';
import 'package:store_app/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.red,
            title: const Text('Home'),
            leading: AppBarIcons(icon: IconlyBold.category, function: () {}),
            actions: [AppBarIcons(function: () {}, icon: IconlyBold.user3)],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: myInputDecoration(context),
                ),
                SaleWidget()
              ],
            ),
          )),
    );
  }
}
