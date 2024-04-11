// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckInGuestReq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckInGuestReq _$CheckInGuestReqFromJson(Map<String, dynamic> json) =>
    CheckInGuestReq(
      json['RoomId'] as int?,
      json['GuestName'] as String?,
      (json['CheckInDate'] as num?)?.toDouble(),
      json['CheckoutDate'] as int?,
    );

Map<String, dynamic> _$CheckInGuestReqToJson(CheckInGuestReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoomId', instance.roomId);
  writeNotNull('GuestName', instance.guestName);
  writeNotNull('CheckInDate', instance.checkInDate);
  writeNotNull('CheckoutDate', instance.checkoutDate);
  return val;
}
