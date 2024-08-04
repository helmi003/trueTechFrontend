import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:truetech/screens/HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:truetech/screens/SplashScreen.dart';
import 'package:truetech/screens/stratingScreen.dart';
import 'package:truetech/screens/successScreen.dart';
import 'package:truetech/services/optionProvider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env").then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OptionProvider()),
      ],
      child: MyApp(),
    ));
  }).catchError((error) {
    print("Error during initialization: $error");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return MaterialApp(
            title: 'TrueTech',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.ubuntuTextTheme(),
            ),
            home: SplashScreen(),
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              StartingScreen.routeName: (context) => StartingScreen(),
              Successscreen.routeName: (context) => Successscreen(),
            },
          );
        });
  }
}
