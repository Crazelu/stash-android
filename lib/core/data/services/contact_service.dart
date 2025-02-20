import 'package:flutter/services.dart';
import 'package:stash_android/core/data/model/contact_model.dart';

class ContactService {
  static const platform = MethodChannel('com.devcrazelu.stash/contact');

  static Future<void> updateContact({required ContactModel contactModel}) async {
    await platform.invokeMethod('updateContact', contactModel.toMap());
  }

  static Future<void> deleteContact(int id) async {
    await platform.invokeMethod('deleteContact', {'id': id});
  }

  static Future<void> insertContact({required ContactModel contactModel}) async {
    await platform.invokeMethod('insertContact', contactModel.toMap());
  }

  static Future<List<ContactModel>> getContacts() async {
    final List<dynamic> users = await platform.invokeMethod('getContacts');
    return users
        .map((user) =>
            ContactModel.fromMap(Map<String, dynamic>.from(user as Map)))
        .toList();
  }
}
