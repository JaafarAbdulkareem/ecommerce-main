import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:testing/cubit/display_cubit/display_cubit.dart';
import 'package:testing/cubit/display_cubit/display_state.dart';
import 'package:testing/helper/api.dart';
import 'package:testing/pages/home_product_page/widget/customer_app_title_widget.dart';
import 'package:testing/pages/home_product_page/widget/customer_appbar_button_widget.dart';
import 'package:testing/pages/home_product_page/widget/customer_builder_sheet_widget.dart';
import 'package:testing/pages/home_product_page/widget/customer_builder_shimmer__widget.dart';
import 'package:testing/pages/home_product_page/widget/customer_gride_products_wisget.dart';

import '../../constant/name_constant.dart';

class HomeProductPage extends StatefulWidget {
  const HomeProductPage({super.key});
  static String id = 'Home Product Page';

  @override
  State<HomeProductPage> createState() => _HomeProductPageState();
}

class _HomeProductPageState extends State<HomeProductPage> {
  late List categoryList;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    categoryList = await Api.getCategoryName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomerAppTitleWidget(title: AppTitle.mainTitle),
        actions: [
          CustomerAppBarButtonWidget(
            icon: Icons.favorite,
            onTap: () {
              BlocProvider.of<DisplayCubit>(context).getFavoriteProducts();
            },
          ),
          CustomerAppBarButtonWidget(
            icon: Icons.apps_sharp,
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                builder: (context) => CustomerBuilderSheetWidget(
                  categoryList: categoryList,
                ),
              );
            },
          ),
          CustomerAppBarButtonWidget(
            icon: Icons.home,
            onTap: () {
              BlocProvider.of<DisplayCubit>(context).getAllProducts();
            },
          ),
        ],
      ),
      body: BlocBuilder<DisplayCubit, DisplayState>(
        builder: (context, state) {
          if (state is StateFailed) {
            return const CusomtomerFailedWidget();
            //  Text(state.errerMessage);
          } else if (state is StateSuccessful) {
            return CustomerGrideProductsWidget(data: state.data);
          } else if (state is StateLoading) {
            return const CustomerShimmerBuildingWidget();
          }
          BlocProvider.of<DisplayCubit>(context).getAllProducts();
          return const CustomerShimmerBuildingWidget();
        },
      ),
    );
  }
}

class CusomtomerFailedWidget extends StatelessWidget {
  const CusomtomerFailedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Disconnected',
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Lottie.asset(AppLottie.splash),
      ],
    );
  }
}
