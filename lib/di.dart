import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/data/data_sources/remote/firebase_car_data_source.dart';
import 'package:firebase_app/domain/repos/cars_repository.dart';
import 'package:firebase_app/domain/usecases/get_cars.dart';
import 'package:firebase_app/presentation/bloc/car_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import 'data/repos/car_repository_impl.dart';

final Logger logger = Logger('di');
GetIt sl = GetIt.instance;
void initDependencyInjection() {
  try {
    logger.info("Dependency Injection Started");
    sl.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);

    sl.registerSingleton(FirebaseCarDataSource(sl()));
    logger.info("FirebaseCarDataSource Registered");
    sl.registerSingleton<CarsRepository>(CarRepositoryImpl(sl()));
    logger.info("CarRepositoryImpl Registered");
    sl.registerSingleton<GetCars>(GetCars(sl()));
    logger.info("GetCars Registered");
    sl.registerFactory<CarBloc>(() => CarBloc(sl<GetCars>()));
  } catch (e) {
    logger.severe("Error in Dependency Injection: $e");
  }
}
