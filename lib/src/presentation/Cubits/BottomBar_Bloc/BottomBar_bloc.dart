import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/UserModel.dart';
import '../../Shared/Singleton.dart';

part 'BottomBar_event.dart';
part 'BottomBar_state.dart';

class UserRegisterBloc extends Bloc<UserEvent, UserState> {
  UserRegisterBloc() : super(UserRegisterDataState(UserModel.empty())) {
    on<UpdateUserEvent>((event, emit) {
      Singleton().userDataToBeUploaded = event.newUser;
      emit(UserRegisterDataState(event.newUser));
    });
  }
}

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(const BaBInitial(0)) {
    on<BottomBarEvent>((event, emit) {
      if (event is TabChange) {
        switch (event.currentIndex) {
          case (0):
            emit(LoginScreen(event.currentIndex));
            break;
          case (1):
            emit(RegisterScreenOne(event.currentIndex));
            break;
          case (2):
            emit(RegisterScreenTwo(event.currentIndex));
            break;
          case (3):
            emit(RegisterScreenThree(event.currentIndex));
        }
      }
    });
  }
}
