import "dart:developer";
import "package:articles/controller/all_data.dart";
import "package:articles/controller/session_data.dart";
import "package:articles/view/main_home_screen.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await SessionData.getDataSession();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        log("IN PROVIDER CREATE");
        return Alldata();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainHomeScreen(),
      ),
    );
  }
}
