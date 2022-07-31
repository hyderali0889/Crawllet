import 'package:crawllet/Routes/App_Routes.dart';
import 'package:crawllet/Screens/Forgot_Password_Screen.dart';
import 'package:crawllet/Screens/GetStartedScreen.dart';
import 'package:crawllet/Screens/Home_Screen.dart';
import 'package:crawllet/Screens/Login_Screen.dart';
import 'package:crawllet/Screens/Signup_Screen.dart';
import 'package:crawllet/firebase_options.dart';
import 'package:crawllet/handlers/config/Getx_Config.dart';
import 'package:crawllet/helpers/ObjectboxHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/Splash_Screen.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetxConfig().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: AppRoutes.getStartedScreen, page: () => const GetStartedScreen()),
        GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
        GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen()),
        GetPage(name: AppRoutes.signupScreen, page: () => const SignupScreen()),
        GetPage(name: AppRoutes.forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
       ],
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const SplashScreen();
            }
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
