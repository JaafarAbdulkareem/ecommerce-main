import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/cubit/display_cubit/display_cubit.dart';
import 'package:testing/cubit/favorite_cubit/favorite_cubite.dart';
import 'package:testing/pages/display_a_product_page/display_a_product_page.dart';
import 'package:testing/pages/home_product_page/home_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DisplayCubit()),
        BlocProvider(create: (context) => FavoriteCubite()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          DisplayAProductPage.id: (context) => const DisplayAProductPage(),
          HomeProductPage.id: (context) => const HomeProductPage(),
        },
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        initialRoute: HomeProductPage.id,
      ),
    );
  }
}
