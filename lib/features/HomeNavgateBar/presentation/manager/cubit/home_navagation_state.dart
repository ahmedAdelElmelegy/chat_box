part of 'home_navagation_cubit.dart';

@immutable
sealed class HomeNavagationState {}

final class HomeNavagationInitial extends HomeNavagationState {}

final class HomeNavagationSucess extends HomeNavagationState {}
