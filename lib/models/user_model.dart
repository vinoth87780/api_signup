import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_signup/services/services.dart'; // Ensure this path is correct

final registrationProvider =
    StateNotifierProvider<RegistrationNotifier, RegistrationState>(
  (ref) => RegistrationNotifier(ref),
);

class RegistrationState {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final bool isLoading;
  final String? error;

  RegistrationState({
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.isLoading = false,
    this.error,
  });

  RegistrationState copyWith({
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    bool? isLoading,
    String? error,
  }) {
    return RegistrationState(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      error: error ?? this.error,
    );
  }
}

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  final Ref _ref;

  RegistrationNotifier(this._ref) : super(RegistrationState());

  void updateName(String firstname) {
    state = state.copyWith(firstname: firstname);
  }

  void updateEmail(String lastname) {
    state = state.copyWith(lastname: lastname);
  }

  void updatePassword(String email) {
    state = state.copyWith(email: email);
  }

  void updatePhoneNumber(String phone) {
    state = state.copyWith(phone: phone);
  }

  Future<void> register() async {
    if (state.firstname == null ||
        state.lastname == null ||
        state.email == null ||
        state.phone == null) {
      state = state.copyWith(error: 'Please fill in all fields');
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      await _ref.read(registrationServiceProvider).register(
            firstname: state.firstname!,
            lastname: state.lastname!,
            email: state.email!,
            phone: state.phone!,
          );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
