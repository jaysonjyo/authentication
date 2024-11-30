part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class FetchSignupEvent extends SignUpEvent {
  final String name;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;

  FetchSignupEvent({required this.name, required this.email, required this.state,
      required this.city, required this.locality, required this.password,
      });
}