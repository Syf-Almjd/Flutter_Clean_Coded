import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/UserModel.dart';
import '../../Shared/Singleton.dart';

part 'app_event.dart';
part 'app_state.dart';

class UserRegisterBloc extends Bloc<UserEvent, UserState> {
  UserRegisterBloc() : super(UserRegisterDataState(UserModel.empty())) {
    on<UpdateUserEvent>((event, emit) {
      Singleton().userDataToBeUploaded = event.newUser;
      emit(UserRegisterDataState(event.newUser));
    });
  }
}

class BaBBloc extends Bloc<BaBEvent, BaBState> {
  BaBBloc() : super(const BaBInitial(0)) {
    on<BaBEvent>((event, emit) {
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
