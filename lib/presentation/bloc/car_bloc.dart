import 'package:firebase_app/domain/usecases/get_cars.dart';
import 'package:firebase_app/presentation/bloc/car_events.dart';
import 'package:firebase_app/presentation/bloc/car_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCarsUsecase;

  CarBloc(this.getCarsUsecase) : super(CarsLoading()) {
    on<LoadCars>(_onGetCars);
  }

  void _onGetCars(CarEvent event, Emitter<CarState> emit) async {
    emit(CarsLoading());
    try {
      final cars = await getCarsUsecase.call();
      emit(CarsLoaded(cars));
    } catch (e) {
      emit(CarsError(e.toString()));
    }
  }
}
