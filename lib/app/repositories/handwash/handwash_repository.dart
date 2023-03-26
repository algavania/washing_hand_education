import '../../../data/models/handwash_data_model.dart';
import '../../../data/models/retrieve_handwash_model.dart';
import '../../../services/network_service.dart';
import '../../../services/shared_preferences_service.dart';
import 'base_handwash_repository.dart';

class HandwashRepository extends BaseHandwashRepository {
  @override
  Future<void> getHandwash() async {
    final res = await NetworkService.post('/handwash/retriveid',
        {'handwash_name': 'handwash-1', 'password': 'inipassword'});
    RetrieveHandwashModel model = retrieveHandwashModelFromJson(res.body);
    if (res.statusCode != 200) {
      throw model.data.handwashName;
    }
    await SharedPreferencesService.setHandwashId(model.data.handwashId);
  }

  @override
  Future<HandwashDataModel> getHandwashById(String id) async {
    final res = await NetworkService.get('/state/$id');
    HandwashDataModel model = handwashDataModelFromJson(res.body);
    if (res.statusCode != 200) {
      throw model.data?.message ?? 'Error';
    }
    return model;
  }

  @override
  Future<void> updateHandwashState(bool state) async {
    String id = SharedPreferencesService.getHandwashId() ?? '';
    final res = await NetworkService.put('/state/$id', {'state': state});
    HandwashDataModel model = handwashDataModelFromJson(res.body);
    if (res.statusCode != 201) {
      throw model.data?.message ?? 'Error';
    }
  }
}
