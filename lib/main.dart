import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pratice_language_app/provider/Favorite_provider.dart';
import 'package:pratice_language_app/provider/cart_provider.dart';
import 'package:pratice_language_app/screens/auth/wrapper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CardProvider(),
        ),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: BottomNavBar(),
        home: Wrapper(),
      ),
    );
  }
}
