import 'package:flutter_clean_coded/src/data/remote/api/network_constants.dart';

class ImageModel {
  final int imageId;
  final int imageIndex;
  final String imageUrl;
  final String uploadedAt;

  ImageModel({
    required this.imageId,
    required this.imageIndex,
    required this.imageUrl,
    required this.uploadedAt,
  });
  factory ImageModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ImageModel(
          imageId: 0, imageIndex: 0, imageUrl: '', uploadedAt: '');
    }
    String image = json['imageUrl'] ?? "";
    if (json['imageId'] != 0) {
      if (!image.startsWith(AppNetworkConstants.baseApiUrl)) {
        image = "${AppNetworkConstants.baseApiUrl}${json['imageUrl']}";
      }
    }

    return ImageModel(
      imageId: json['imageId'] ?? 0,
      imageIndex: (json['imageIndex'] ?? 0.0).toInt(),
      imageUrl: image,
      uploadedAt: json['uploadedAt'] ?? '',
    );
  }

  factory ImageModel.empty() {
    return ImageModel(
      imageId: 0,
      imageIndex: 0,
      imageUrl: "",
      uploadedAt: "",
    );
  }

  Map<String, dynamic> toUploadJson() {
    if (imageUrl == "null") {
      return {
        'imageIndex': null,
        'imageData': null,
      };
    }
    return {
      'imageIndex': imageIndex,
      'imageData': imageUrl,
    };
  }

  Map<String, dynamic> toFullJson() {
    return {
      'imageId': imageId,
      'imageIndex': imageIndex,
      'imageUrl': imageUrl,
      'uploadedAt': uploadedAt,
    };
  }
}
