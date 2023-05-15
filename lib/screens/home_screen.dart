import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/feeds_screen.dart';
import 'package:store_app/screens/users_screen.dart';
import 'package:store_app/services/api_handler.dart';

import 'package:store_app/widgets/app_bar_icons.dart';
import 'package:store_app/widgets/feeds_widget.dart';
import 'package:store_app/widgets/my_grid_view_builder.dart';
import 'package:store_app/widgets/my_input_decoration.dart';
import 'package:store_app/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  List<ProductsModel> allProducts = [];
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
  void didChangeDependencies() async {
    allProducts = await APIHandler().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.red,
            title: const Text('Home'),
            leading: AppBarIcons(icon: IconlyBold.category, function: () {}),
            actions: [
              AppBarIcons(
                  function: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const UsersScreen(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  icon: IconlyBold.user3)
            ],
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
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .22,
                          child: Swiper(
                            pagination: const SwiperPagination(
                                alignment: Alignment.bottomCenter,
                                builder: DotSwiperPaginationBuilder(
                                    activeColor: Colors.red)),
                            itemCount: 3,
                            itemBuilder: (context, index) => const SaleWidget(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Spacer(),
                              AppBarIcons(
                                  function: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: FeedsScreen(
                                          allProducts: allProducts,
                                        ),
                                        type: PageTransitionType.fade,
                                      ),
                                    );
                                  },
                                  icon: IconlyBold.arrowRight2),
                            ],
                          ),
                        ),
                        MyGridViewBuilder(
                          allProducts: allProducts,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
