import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_auth_page_state.dart';

class UserAuthPageCubit extends Cubit<UserAuthPageState> {
  UserAuthPageCubit() : super(UserAuthPageInitial());
  static UserAuthPageCubit get(context) => BlocProvider.of(context);

  void changeState(UserAuthPageState state) => emit(state);

  void resetState() => emit(UserAuthPageInitial());
}
