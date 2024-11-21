import 'package:firebase_app/data/models/car_model.dart';
import 'package:firebase_app/domain/repos/cars_repository.dart';

class GetCars {
  final CarsRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.getCars();
  }
}