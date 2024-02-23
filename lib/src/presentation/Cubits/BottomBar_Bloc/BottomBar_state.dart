part of 'BottomBar_bloc.dart';

@immutable
abstract class BottomBarState {
  final int defaultIndex;

  const BottomBarState(this.defaultIndex);
}

@immutable
abstract class UserState {
  final UserModel user;

  const UserState(this.user);
}

class BaBInitial extends BottomBarState {
  const BaBInitial(super.defaultIndex);
}

class UserRegisterDataState extends UserState {
  const UserRegisterDataState(super.user);
}

class LoginScreen extends BottomBarState {
  const LoginScreen(super.defaultIndex);
}

class RegisterScreenOne extends BottomBarState {
  const RegisterScreenOne(super.defaultIndex);
}

class RegisterScreenTwo extends BottomBarState {
  const RegisterScreenTwo(super.defaultIndex);
}

class RegisterScreenThree extends BottomBarState {
  const RegisterScreenThree(super.defaultIndex);
}
