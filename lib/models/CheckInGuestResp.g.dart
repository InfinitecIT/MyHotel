// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckInGuestResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckInGuestResp _$CheckInGuestRespFromJson(Map<String, dynamic> json) =>
    CheckInGuestResp(
      json['Success'] as int?,
      json['Message'] as String?,
    );

Map<String, dynamic> _$CheckInGuestRespToJson(CheckInGuestResp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Success', instance.success);
  writeNotNull('Message', instance.message);
  return val;
}
