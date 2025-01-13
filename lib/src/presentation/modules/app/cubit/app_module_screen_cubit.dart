import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_module_screen_state.dart';

class AppModuleScreenCubit extends Cubit<AppModuleScreenState> {
  AppModuleScreenCubit() : super(AppModuleScreenInitial());

  void changeScreenState(AppModuleScreenState state) => emit(state);

  void resetScreenState() => emit(AppModuleScreenInitial());
}
