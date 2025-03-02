import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_android/core/presentation/viewmodel/view_model_provider.dart';
import 'package:stash_android/features/initialization/presentation/viewmodels/contact_view_model.dart';
import 'package:stash_android/features/initialization/presentation/widgets/contact_tile.dart';

class ContactHomeScreen extends StatefulWidget {
  const ContactHomeScreen({super.key});

  @override
  State<ContactHomeScreen> createState() => _ContactHomeScreenState();
}

class _ContactHomeScreenState extends State<ContactHomeScreen> {
  int selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      create: () => ContactViewModel(),
      initialize: (model) async => await model.initialize(),
      builder: (context) {
        final viewModel = context.read<ContactViewModel>();
        return Scaffold(
          appBar: AppBar(
            leading: Text(
              'Stash',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            leadingWidth: 90,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: viewModel.fetchContacts,
            child: const Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: viewModel.contacts,
                  builder: (context, contacts, _) {
                    if (contacts.isEmpty) {
                      return const Center(
                        child: Text("It's super quiet in here 🙈"),
                      );
                    } else {
                      return Flexible(
                        child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ContactTile(
                                contact: contacts[index],
                                onTap: (id) {},
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
