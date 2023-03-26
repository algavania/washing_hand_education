import '../../../data/models/handwash_data_model.dart';

abstract class BaseHandwashRepository {
  Future<void> getHandwash();
  Future<HandwashDataModel> getHandwashById(String id);
  Future<void> updateHandwashState(bool state);
}