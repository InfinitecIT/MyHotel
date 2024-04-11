// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckOutGuestReq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutGuestReq _$CheckOutGuestReqFromJson(Map<String, dynamic> json) =>
    CheckOutGuestReq(
      json['RoomId'] as int?,
    );

Map<String, dynamic> _$CheckOutGuestReqToJson(CheckOutGuestReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoomId', instance.roomId);
  return val;
}
