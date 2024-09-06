import 'package:elementlist/src/view/home_view.dart';
import 'package:elementlist/src/view_models/bitcoin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>BitcoinViewModel())
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white
            )
          )
        ),
        debugShowCheckedModeBanner: false,
        home: HomeView(),

      ),
    );

  }
}





