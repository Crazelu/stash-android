import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:stash_android/core/presentation/viewmodel/view_model_provider.dart';
import 'package:stash_android/features/initialization/presentation/viewmodels/contact_view_model.dart';

class ContactHomeScreen extends StatefulWidget {
  const ContactHomeScreen({super.key});

  @override
  State<ContactHomeScreen> createState() => _ContactHomeScreenState();
}

class _ContactHomeScreenState extends State<ContactHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      create: () => ContactViewModel(),
      builder: (context) {
        final viewModel = context.read<ContactViewModel>();
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            // onPressed: () {},
            onPressed: viewModel.fetchContacts,
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              const Gap(100),
              Row(
                children: [
                  Text(
                    'Stash',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: viewModel.contacts,
                builder: (context, contacts, _) {
                  if (contacts.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text("It's super quiet in here 🙈")],
                      ),
                    );
                  } else {
                    return Flexible(
                      child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
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
                                  contacts[index].firstName?.substring(0,1) ?? '',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            title: Text(
                              contacts[index].firstName ?? '',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            trailing: const Icon(Icons.info_outline, color: Colors.blue,),
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
