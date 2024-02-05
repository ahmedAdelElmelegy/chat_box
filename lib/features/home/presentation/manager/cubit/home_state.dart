part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSucess extends HomeState {}

final class HomeFailed extends HomeState {
  final String errorMassage;

  HomeFailed({required this.errorMassage});
}

final class SearchSucess extends HomeState {}

final class SendMassageSucess extends HomeState {}

final class SendMassageLoading extends HomeState {}

final class SendMassageFailed extends HomeState {}

final class GetMassagesSucess extends HomeState {}

final class GetMassagesFailed extends HomeState {}

final class GetMassagesLoading extends HomeState {}
