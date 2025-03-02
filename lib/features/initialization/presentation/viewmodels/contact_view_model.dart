import 'package:flutter/material.dart';
import 'package:stash_android/core/data/model/contact_model.dart';
import 'package:stash_android/core/data/services/contact_service.dart';
import 'package:stash_android/core/presentation/viewmodel/base_view_model.dart';

class ContactViewModel extends BaseViewModel {
  final ValueNotifier<Contact> _contact = ValueNotifier(
    const Contact(
      id: 0,
      firstName: '',
      lastName: '',
      number: '',
    ),
  );
  ValueNotifier<Contact> get contact => _contact;

  final ValueNotifier<List<Contact>> _contacts = ValueNotifier([]);
  ValueNotifier<List<Contact>> get contacts => _contacts;

  Future<void> saveContact(Contact contactModel) async {
    await ContactService.insertContact(contactModel: contactModel);
    fetchContacts();
  }

  Future<void> updateContact(Contact contactModel) async {
    await ContactService.updateContact(contactModel: contactModel);
    fetchContacts();
  }

  Future<void> deleteContact(int contactId) async {
    await ContactService.deleteContact(contactId);
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    final contacts = await ContactService.getContacts();
    _contacts.value = contacts;
  }

  @override
  Future<void> initialize() async {
    await fetchContacts();
    super.initialize();
  }

  @override
  void dispose() {
    _contact.dispose();
    _contacts.dispose();
    super.dispose();
  }
}
