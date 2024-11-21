import '../../data/models/car_model.dart';

abstract class CarsRepository {
  Future<List<Car>> getCars();
}
