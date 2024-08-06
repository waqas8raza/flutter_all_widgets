import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_strip/firebase_options.dart';
import 'package:flutter_strip/pages/auth/login_page.dart';
import 'package:flutter_strip/providers/counter_provider.dart';
import 'package:flutter_strip/providers/loader_provider.dart';
import 'package:flutter_strip/providers/slider_provider.dart';
import 'package:provider/provider.dart';

import 'providers/list_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SliderProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LoaderProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ListProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      theme: ThemeData(useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
