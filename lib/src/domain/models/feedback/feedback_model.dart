import 'dart:convert';

import 'package:flutter_clean_coded/src/presentation/Shared/widgets_builder.dart';

import '../General/image_model.dart';

List<FeedbackModel> feedbackListFromJson(dynamic parsed) {
  try {
    if (parsed is List) {
      return parsed.map<FeedbackModel>((json) {
        return FeedbackModel.fromJson(json ?? {});
      }).toList();
    } else {
      throw Exception();
    }
  } catch (e) {
    printC(e);
    throw Exception(e.toString());
  }
}

String feedbackListToJson(List<FeedbackModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedbackModel {
  final num contactId;
  final num userId;
  final String contactType;
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNo;
  final String enquiry;
  final String answer;
  final ImageModel image;
  final String contactStatus;
  final String createdAt;
  final String updatedAt;

  FeedbackModel({
    required this.contactId,
    required this.userId,
    required this.contactType,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNo,
    required this.enquiry,
    required this.answer,
    required this.image,
    required this.contactStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      userId: json['userId'] ?? 0,
      contactId: json['contactId'] ?? 0,
      contactType: json['contactType'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      email: json['email'] ?? "",
      mobileNo: json['mobileNo'] ?? "",
      enquiry: json['enquiry'] ?? "",
      answer: json['answer'] ?? "",
      image:
          ImageModel.fromJson(json['image'] ?? ImageModel.empty().toFullJson()),
      contactStatus: json['contactStatus'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      // 'contactId': contactId,
      'contactType': contactType,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobileNo': mobileNo,
      'enquiry': enquiry,
      'answer': answer,
      'image': image.toUploadJson(),
      'contactStatus': contactStatus,
      // 'createdAt': createdAt,
      // 'updatedAt': updatedAt,
    };
  }
}
