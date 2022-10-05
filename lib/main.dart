import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moshel_app/ui/auth/pages/auth_page.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moshel App',
      theme: ThemeData(textTheme:GoogleFonts.latoTextTheme(),),
      home: const  AuthPage(),
    );
  }
}
