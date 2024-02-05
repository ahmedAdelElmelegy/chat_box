part of 'massages_cubit.dart';

@immutable
sealed class MassagesState {}

final class SendMassageSucess extends MassagesState {}

final class MassagesInitial extends MassagesState {}

final class SendMassageLoading extends MassagesState {}

final class SendMassageFailed extends MassagesState {}

final class GetMassagesSucess extends MassagesState {}

final class GetMassagesFailed extends MassagesState {}

final class GetMassagesLoading extends MassagesState {}
