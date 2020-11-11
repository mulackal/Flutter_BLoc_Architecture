part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final bool isEmailValid;
  final String password;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool noNetwork;

  bool get isFormValid => isEmailValid && isPasswordValid;

  const LoginState({
    @required this.email,
    @required this.isEmailValid,
    @required this.password,
    @required this.isPasswordValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.noNetwork,
  });

  factory LoginState.initial() {
    return LoginState(
      email: '',
      isEmailValid: false,
      password: '',
      isPasswordValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      noNetwork: false,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      noNetwork: false,
    );
  }

  factory LoginState.failure() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      noNetwork: false,
    );
  }

  factory LoginState.success() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      noNetwork: false,
    );
  }

  factory LoginState.noNetwork() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      noNetwork: true,
    );
  }

  LoginState dataWith({
    String email,
    bool isEmailValid,
    String password,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    bool noNetwork,
  }) {
    return LoginState(
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      noNetwork: noNetwork ?? this.noNetwork,
    );
  }

  @override
  List<Object> get props =>
      [
        email,
        isEmailValid,
        password,
        isPasswordValid,
        isSubmitting,
        isSuccess,
        isFailure,
        noNetwork,
      ];

  @override
  String toString() {
    return '''MyFormState {
      email: $email,
      isEmailValid: $isEmailValid,
      password: $password,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess : $isSuccess,
      isFailure : $isFailure,
      noNetwork : $noNetwork,
    }''';
  }
}
