part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSucess extends ProfileState {}

final class ProfileFailed extends ProfileState {}

final class PickProfileImageFailed extends ProfileState {}

final class PickProfileImageSucess extends ProfileState {}

//edit profile States
final class EditProfileLoading extends ProfileState {}

final class EditProfileSucess extends ProfileState {}

final class EditProfileFailed extends ProfileState {}

//uplode profile image
final class UplodeProfileImageLoading extends ProfileState {}

final class UplodeProfileImageSucess extends ProfileState {}

final class UplodeProfileImageFailed extends ProfileState {}

final class OpenDrawer extends ProfileState {}

final class ClosedDrawer extends ProfileState {}

final class SignOutSucessState extends ProfileState {}
