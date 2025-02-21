import 'package:flutter/services.dart';
import 'package:stash_android/core/data/model/contact_model.dart';

class ContactService {
  static const platform = MethodChannel('com.devcrazelu.stash/contact');

  static Future<void> updateContact(
      {required ContactModel contactModel}) async {
    try {
      await platform.invokeMethod('updateContact', contactModel.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> deleteContact(int id) async {
    try {
      await platform.invokeMethod('deleteContact', {'id': id});
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> insertContact(
      {required ContactModel contactModel}) async {
    try {
      await platform.invokeMethod('insertContact', contactModel.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<ContactModel>> getContacts() async {
    try {
      final List<dynamic> contacts = await platform.invokeMethod('getContacts');
      return contacts
          .map((contact) =>
              ContactModel.fromMap(Map<String, dynamic>.from(contact as Map)))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<ContactModel> getContact(int id) async {
    try {
      final contact = await platform.invokeMethod('fetchContact', {'id': id});
      return ContactModel.fromMap(Map<String, dynamic>.from(contact as Map));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
