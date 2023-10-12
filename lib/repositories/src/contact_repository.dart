import 'package:contact_app/api/contact_app_api.dart';
import 'package:contact_app/models/models.dart';

class ContactRepository {
  final _api = ContactAppAPI().dio;

  ContactRepository() {
    _api.options.headers['X-Parse-Session-Token'] = UserModel.sessionToken;
  }

  Future<void> getContacts() async {
    var response = await _api.get('/classes/Contact');

    UserContactsModel.fromJson(response.data);
  }

  Future<void> createContact({
    required String name,
    required String number,
    required String imagePath,
  }) async {
    await _api.post(
      '/classes/Contact',
      data: {
        'name': name,
        'number': name,
        'imagePath': name,
        'owner': Owner(UserModel.objectId),
      },
    );
  }

  Future<void> deleteContact(String objectId) async {
    await _api
        .delete('/classes/Address/$objectId')
        .then((_) async => await getContacts());
  }
}
