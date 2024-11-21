import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_app/presentation/bloc/car_bloc.dart';
import 'package:firebase_app/presentation/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CarBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: OnboardingScreen(),
      ),
    );
  }
}


