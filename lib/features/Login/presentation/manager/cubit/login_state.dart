part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSucess extends LoginState {
  final User user;

  LoginSucess({required this.user});
}

final class LoginFailed extends LoginState {
  final String erorrMessage;

  LoginFailed({required this.erorrMessage});
}
