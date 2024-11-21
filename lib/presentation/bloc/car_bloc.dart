import 'package:firebase_app/presentation/bloc/car_events.dart';
import 'package:firebase_app/presentation/bloc/car_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBloc extends Bloc<CarEvent,CarState>{
  CarBloc():super(CarsLoading());

}