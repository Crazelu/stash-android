import 'package:flutter/material.dart';
import 'package:stash_android/core/data/model/contact_model.dart';
import 'package:stash_android/core/data/services/contact_service.dart';
import 'package:stash_android/core/presentation/viewmodel/base_view_model.dart';

class ContactViewModel extends BaseViewModel {
  final ValueNotifier<ContactModel> _contact =
      ValueNotifier(const ContactModel());
  ValueNotifier<ContactModel> get contact => _contact;

  final ValueNotifier<List<ContactModel>> _contacts = ValueNotifier([]);
  ValueNotifier<List<ContactModel>> get contacts => _contacts;

  void saveContact(ContactModel contactModel) async {
    await ContactService.insertContact(contactModel: contactModel);
    fetchContacts();
  }

  void updateContact(ContactModel contactModel) async {
    await ContactService.updateContact(contactModel: contactModel);
    fetchContacts();
  }

  void deleteContact(int contactId) async {
    await ContactService.deleteContact(contactId);
    fetchContacts();
  }

  void fetchContacts() async {
    final contacts = await ContactService.getContacts();
    _contacts.value = contacts;
  }

  @override
  void dispose() {
    _contact.dispose();
    _contacts.dispose();
    super.dispose();
  }
}
