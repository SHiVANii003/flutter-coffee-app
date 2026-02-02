import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/view-model/coffee_viewmodel.dart';
import 'package:flutter_application_1/features/view/coffee_view.dart';
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
      create: (_) => CoffeeViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const CoffeeView(),
      ),
    );
  }
}
