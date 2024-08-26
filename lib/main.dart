import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/get_products_cubit.dart';
import 'screens/startscreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductsCubit()..getProducts(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Start(),
      ),
    );
  }
}
