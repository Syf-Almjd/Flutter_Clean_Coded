// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// part 'app_settings_event.dart';
// part 'app_settings_state.dart';

// class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
//   static AppSettingsBloc get(context) => BlocProvider.of(context);

//   AppSettingsBloc() : super(AppSettingsInitial()) {
//     on<UserAppLanguageEvent>((event, emit) => emit(UserAppSettingsState()));
//     on<UserAppSettingsEvent>((event, emit) => emit(UserAppSettingsState()));
//     on<UserAppNotificationEvent>(
//         (event, emit) => emit(UserNotificationSettingsState()));
//     on<UserProfileEvent>((event, emit) => emit(UserProfileState()));
//   }

//   updateLocalDataState(mapName, context) {
//     final bloc = AppSettingsBloc.get(context);

//     switch (mapName) {
//       case AppLocalConstants.appNotificationButtons:
//         //DISABLED: currently not implemented
//         // bloc.add(UserAppNotificationEvent());
//         break;
//       case AppLocalConstants.appSettingsButtons:
//         bloc.add(UserAppSettingsEvent());
//         break;
//       case AppLocalConstants.savedLocalUser ||
//             AppLocalConstants.currentLoginUser:
//         bloc.add(UserProfileEvent());
//         break;
//       case AppLocalConstants.appLocale:
//         bloc.add(UserAppLanguageEvent());
//         break;
//       default:
//     }
//   }
// }
