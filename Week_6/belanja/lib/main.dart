import 'package:flutter/material.dart';
import 'package:belanja/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Belanja App - Go Router',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
    );
  }
}
