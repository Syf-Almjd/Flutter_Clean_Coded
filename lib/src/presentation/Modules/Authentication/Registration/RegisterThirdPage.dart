import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/config/utils/managers/app_constants.dart';
import 'package:flutter_clean_architecture/src/config/utils/styles/app_colors.dart';
import 'package:flutter_clean_architecture/src/data/local/localData_cubit/local_data_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/remote/RemoteData_cubit/RemoteData_cubit.dart';
import '../../../../domain/models/UserModel.dart';
import '../../../Cubits/BottomBar_Bloc/BottomBar_bloc.dart';
import '../../../Shared/Components.dart';
import '../../../Shared/Singleton.dart';
import '../../../Shared/WidgetBuilders.dart';

class RegisterThirdPage extends StatefulWidget {
  final UserModel previousUserData;

  const RegisterThirdPage({super.key, required this.previousUserData});

  @override
  State<RegisterThirdPage> createState() => _RegisterThirdPageState();
}

class _RegisterThirdPageState extends State<RegisterThirdPage> {
  late UserModel userData;
  DateTime timeNow = DateTime.now();
  String? _imageBytes;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2), shape: BoxShape.circle),
              child: InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                  size: getWidth(10, context),
                ),
                onTap: () {
                  BlocProvider.of<BottomBarBloc>(context).add(TabChange(2));
                },
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            "Smile!",
            style: TextStyle(fontSize: getWidth(10, context)),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: getHeight(20, context),
            width: getWidth(45, context),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(500),
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Center(
              child: InkWell(
                onTap: () async {
                  _pickFile();
                },
                child: Stack(
                  children: [
                    Center(
                      child: (_imageBytes != null)
                          ? previewImage(
                              context: context, fileUser: _imageBytes)
                          : previewImage(
                              context: context,
                              editable: true,
                              fileUser: AppConstants.noPhoto),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        loadButton(
          buttonHeight: getHeight(5, context),
          buttonWidth: getWidth(50, context),
          textSize: getWidth(4, context),
          textColor: Colors.blueGrey,
          buttonElevation: 0.0,
          onPressed: () {
            signUser("NO_PHOTO");
          },
          buttonText: 'Skip',
        ),
        const Spacer(),
        Center(
            child: loadButton(
                buttonText: "Start!",
                onPressed: () {
                  if (_imageBytes != null) {
                    signUser(_imageBytes);
                  } else {
                    showToast(
                        'Choose a photo', AppColors.primaryColor, context);
                  }
                })),
        getCube(5, context),
      ],
    );
  }

  Future<void> signUser(imageBytes) async {
    userData = UserModel(
        email: widget.previousUserData.email,
        password: widget.previousUserData.password,
        name: widget.previousUserData.name,
        phoneNumber: widget.previousUserData.phoneNumber,
        photoID: imageBytes,
        userID: "",
        lastLogin: timeNow.toString(),
        address: widget.previousUserData.address);
    Singleton().userDataToBeUploaded = userData;
    LocalDataCubit.get(context)
        .saveSharedMap('currentuser', userData.toJson())
        .then((value) => RemoteDataCubit.get(context)
            .userRegister(Singleton().userDataToBeUploaded, context));
  }

  void _pickFile() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      Uint8List bytesUint8List = Uint8List.fromList(bytes);
      setState(() {
        _imageBytes = base64Encode(bytesUint8List);
      });
    }
  }
}
