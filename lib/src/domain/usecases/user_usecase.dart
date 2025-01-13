import 'package:flutter_clean_coded/src/core/utils/managers/app_enums.dart';
import 'package:flutter_clean_coded/src/data/local/constant/local_constants.dart';
import 'package:flutter_clean_coded/src/data/services/local_storage_service.dart';
import 'package:flutter_clean_coded/src/domain/models/General/image_model.dart';
import 'package:flutter_clean_coded/src/domain/models/users/user_model.dart';

class UserUsecase {
  final localDataStorage = getLocalStorageService();

  Future<UserModel> getUserProfile() async {
    var localUserData = localDataStorage.getMap(AppLocalConstants.user);
    if (localUserData != null) {
      return UserModel.fromJson(localUserData);
    }
    return UserModel(
      userId: 0,
      username: "",
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      phone: "",
      gender: "",
      userRole: "",
      userType: "",
      userStatus: "",
      image:
          ImageModel(imageId: 0, imageIndex: 0, imageUrl: "", uploadedAt: ""),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  String? getUserToken() {
    return localDataStorage.get(AppLocalConstants.token);
  }

  Stream<UserStatusType> getUserStatus() async* {
    await Future.delayed(const Duration(seconds: 2));
    // This is a dummy implementation
    yield (UserStatusType.newUser);
  }
}
