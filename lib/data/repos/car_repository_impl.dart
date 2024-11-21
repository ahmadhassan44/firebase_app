import 'package:firebase_app/data/data_sources/remote/firebase_car_data_source.dart';
import 'package:firebase_app/data/models/car_model.dart';
import 'package:firebase_app/domain/repos/cars_repository.dart';

class CarRepositoryImpl implements CarsRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);
  @override
  Future<List<Car>> getCars() {
    return dataSource.getCars();
  }
}
