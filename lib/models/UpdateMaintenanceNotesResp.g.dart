// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateMaintenanceNotesResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMaintenanceNotesResp _$UpdateMaintenanceNotesRespFromJson(
        Map<String, dynamic> json) =>
    UpdateMaintenanceNotesResp(
      json['Success'] as int?,
      json['Message'] as String?,
    );

Map<String, dynamic> _$UpdateMaintenanceNotesRespToJson(
    UpdateMaintenanceNotesResp instance) {
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
