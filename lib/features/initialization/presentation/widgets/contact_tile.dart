import 'package:flutter/material.dart';
import 'package:stash_android/core/data/model/contact_model.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.contact,
    this.onTap,
  });

  final Contact contact;
  final Function(int id)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[600],
        ),
        child: Center(
          child: Text(
            contact.firstName.substring(0, 1),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      onTap: () {
        onTap!(contact.id);
      },
      title: Text(
        contact.firstName,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const Icon(
        Icons.info_outline,
        color: Colors.blue,
      ),
    );
  }
}
