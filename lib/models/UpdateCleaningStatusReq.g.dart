// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateCleaningStatusReq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCleaningStatusReq _$UpdateCleaningStatusReqFromJson(
        Map<String, dynamic> json) =>
    UpdateCleaningStatusReq(
      json['RoomId'] as int?,
      json['CleaningStatus'] as int?,
    );

Map<String, dynamic> _$UpdateCleaningStatusReqToJson(
    UpdateCleaningStatusReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoomId', instance.roomId);
  writeNotNull('CleaningStatus', instance.cleaningStatus);
  return val;
}
