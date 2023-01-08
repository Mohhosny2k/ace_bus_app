import 'bus/bus_controller.dart';
import 'user/cubit/phone_auth/phone_auth_cubit.dart';
import 'user/user_view/login_screen.dart';
import 'navigation/navigation_screen.dart';
import 'shared/shared_screen/onBordingScreen.dart';
import 'shared/shared_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'navigation/navigation_controller.dart';

late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = 'splah'; // '/login_screen';
    } else {
      initialRoute = 'navigation';
    }
  });
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key,});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PhoneAuthCubit(),
            ),
            BlocProvider(create: (context) => NavigationController()),
            BlocProvider(create: (context) => BusController()),
          ],
          child: MaterialApp(
            routes: {
              'onBorading': (context) => onBoradingScreen(),
              '/login_screen': (context) => LoginScreen(),
              'navigation': (context) => NavigationScreen(),
              'splah': (context) => SplashScreen(),
            },
            initialRoute: initialRoute,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
