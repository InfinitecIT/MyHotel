// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetHotelRoomsResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHotelRoomsResp _$GetHotelRoomsRespFromJson(Map<String, dynamic> json) =>
    GetHotelRoomsResp(
      json['Success'] as int?,
      json['Message'] as String?,
      (json['Rooms'] as List<dynamic>?)
          ?.map((e) => Rooms.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetHotelRoomsRespToJson(GetHotelRoomsResp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Success', instance.success);
  writeNotNull('Message', instance.message);
  writeNotNull('Rooms', instance.rooms);
  return val;
}

Rooms _$RoomsFromJson(Map<String, dynamic> json) => Rooms(
      json['RoomId'] as int?,
      json['RoomNumber'] as int?,
      json['RoomStatus'] as int?,
      json['CleaningStatus'] as int?,
      json['MaintenanceStatus'] as int?,
      json['MaintenanceNotes'] as String?,
      json['Sleeps'] as int?,
      json['Beds'] as int?,
      json['Rooms'] as int?,
    )
      ..guestName = json['GuestName'] as String?
      ..checkInDate = json['CheckInDate'] as int?
      ..checkoutDate = json['CheckoutDate'] as int?;

Map<String, dynamic> _$RoomsToJson(Rooms instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoomId', instance.roomId);
  writeNotNull('RoomNumber', instance.roomNumber);
  writeNotNull('RoomStatus', instance.roomStatus);
  writeNotNull('CleaningStatus', instance.cleaningStatus);
  writeNotNull('MaintenanceStatus', instance.maintenanceStatus);
  writeNotNull('MaintenanceNotes', instance.maintenanceNotes);
  writeNotNull('GuestName', instance.guestName);
  writeNotNull('CheckInDate', instance.checkInDate);
  writeNotNull('CheckoutDate', instance.checkoutDate);
  writeNotNull('Sleeps', instance.sleeps);
  writeNotNull('Beds', instance.beds);
  writeNotNull('Rooms', instance.rooms);
  return val;
}
