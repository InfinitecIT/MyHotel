import 'package:json_annotation/json_annotation.dart';
part 'UpdateMaintenanceNotesResp.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateMaintenanceNotesResp {
  @JsonKey(name: 'Success')
  int? success;
  @JsonKey(name: 'Message')
  String? message;

  UpdateMaintenanceNotesResp(this.success, this.message);

  static List<UpdateMaintenanceNotesResp> fromArray(List<dynamic> list) {
    List<UpdateMaintenanceNotesResp> result = [];
    list.forEach((item) {
      result.add(UpdateMaintenanceNotesResp.fromJson(item));
    });
    return result;
  }

  factory UpdateMaintenanceNotesResp.fromJson(Map<String, dynamic> json) => _$UpdateMaintenanceNotesRespFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateMaintenanceNotesRespToJson(this);
}
