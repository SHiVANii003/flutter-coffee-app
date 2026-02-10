import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/coffee/data/coffee_repository.dart';
import 'package:flutter_application_1/features/coffee/view-model/coffee_viewmodel.dart';
import 'package:flutter_application_1/features/coffee/view/coffee_view.dart';
import 'theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoffeeViewModel(CoffeeRepository())..loadCoffees(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const CoffeeView(),
      ),
    );
  }
}
