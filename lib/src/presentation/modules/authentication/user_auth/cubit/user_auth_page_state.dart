part of 'user_auth_page_cubit.dart';

@immutable
sealed class UserAuthPageState {}

final class UserAuthPageInitial extends UserAuthPageState {}

final class GuestModeState extends UserAuthPageState {}

final class UserSignupState extends UserAuthPageState {}

final class UserLoginState extends UserAuthPageState {}
