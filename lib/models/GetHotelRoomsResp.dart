import 'package:json_annotation/json_annotation.dart';
part 'GetHotelRoomsResp.g.dart';

//dart run build_runner build --delete-conflicting-outputs

@JsonSerializable(includeIfNull: false)
class GetHotelRoomsResp {
  @JsonKey(name: 'Success')
  int? success;
  @JsonKey(name: 'Message')
  String? message;
  @JsonKey(name: 'Rooms')
  List<Rooms>? rooms;

  GetHotelRoomsResp(this.success, this.message, this.rooms);

  static List<GetHotelRoomsResp> fromArray(List<dynamic> list) {
    List<GetHotelRoomsResp> result = [];
    list.forEach((item) {
      result.add(GetHotelRoomsResp.fromJson(item));
    });
    return result;
  }

  factory GetHotelRoomsResp.fromJson(Map<String, dynamic> json) => _$GetHotelRoomsRespFromJson(json);

  Map<String, dynamic> toJson() => _$GetHotelRoomsRespToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Rooms {
  @JsonKey(name: 'RoomId')
  int? roomId;
  @JsonKey(name: 'RoomNumber')
  int? roomNumber;
  @JsonKey(name: 'RoomStatus')
  int? roomStatus;
  @JsonKey(name: 'CleaningStatus')
  int? isCleaning;
  @JsonKey(name: 'MaintenanceStatus')
  int? isMaintenance;
  @JsonKey(name: 'MaintenanceNotes')
  String? maintenanceNotes;

  Rooms(this.roomId, this.roomNumber, this.roomStatus, this.isCleaning);

  static List<Rooms> fromArray(List<dynamic> list) {
    List<Rooms> result = [];
    list.forEach((item) {
      result.add(Rooms.fromJson(item));
    });
    return result;
  }

  factory Rooms.fromJson(Map<String, dynamic> json) => _$RoomsFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsToJson(this);
}
