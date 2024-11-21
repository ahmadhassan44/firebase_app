import 'package:firebase_app/di.dart';
import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_app/presentation/bloc/car_bloc.dart';
import 'package:firebase_app/presentation/bloc/car_events.dart';
import 'package:firebase_app/presentation/screens/car_list_screen.dart';
import 'package:firebase_app/presentation/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  final Logger log = Logger('main');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  log.info('Firebase Initialized');
  try {
    log.info('Initializing Dependency Injection');
    initDependencyInjection();
  } catch (e) {
    log.severe("Error in Dependency Injection: $e");
  }
  final prefs = await SharedPreferences.getInstance();
  final bool? isOnboardingCompleted = prefs.getBool('onboardingCompleted');
  runApp(MyApp(isOnboardingCompleted ?? false));
}

class MyApp extends StatelessWidget {
  final bool isOnboardingCompleted;
  const MyApp(this.isOnboardingCompleted, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:
            isOnboardingCompleted ? CarListScreen() : const OnboardingScreen(),
      ),
    );
  }
}
