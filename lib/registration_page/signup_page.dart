import 'package:api_signup/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registrationState = ref.watch(registrationProvider);
    final registrationNotifier = ref.read(registrationProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'firstName'),
                keyboardType: TextInputType.name,
                onChanged: (value) => registrationNotifier.updateName(value),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last name'),
                keyboardType: TextInputType.name,
                onChanged: (value) => registrationNotifier.updateEmail(value),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) =>
                    registrationNotifier.updatePassword(value),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                onChanged: (value) =>
                    registrationNotifier.updatePhoneNumber(value),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => registrationNotifier.register(),
                child: registrationState.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Register'),
              ),
              if (registrationState.error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    registrationState.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
