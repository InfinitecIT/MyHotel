import 'package:json_annotation/json_annotation.dart';
part 'UpdateMaintenanceNotesReq.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateMaintenanceNotesReq {
  @JsonKey(name: 'RoomId')
  int? roomId;
  @JsonKey(name: 'MaintenanceNotes')
  String? maintenanceNotes;

  UpdateMaintenanceNotesReq(this.roomId, this.maintenanceNotes);

  static List<UpdateMaintenanceNotesReq> fromArray(List<dynamic> list) {
    List<UpdateMaintenanceNotesReq> result = [];
    list.forEach((item) {
      result.add(UpdateMaintenanceNotesReq.fromJson(item));
    });
    return result;
  }

  factory UpdateMaintenanceNotesReq.fromJson(Map<String, dynamic> json) => _$UpdateMaintenanceNotesReqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateMaintenanceNotesReqToJson(this);
}
