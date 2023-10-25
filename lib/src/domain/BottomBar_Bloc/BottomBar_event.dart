part of 'BottomBar_bloc.dart';

@immutable
abstract class BottomBarEvent {}

@immutable
abstract class UserEvent {}

class TabChange extends BottomBarEvent {
  final int currentIndex;

  TabChange(this.currentIndex);
}

class UpdateUserEvent extends UserEvent {
  final UserModel newUser;

  UpdateUserEvent(this.newUser);
}
