// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistic_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogisticEntryImpl _$$LogisticEntryImplFromJson(Map<String, dynamic> json) =>
    _$LogisticEntryImpl(
      id: (json['id'] as num?)?.toInt(),
      customerName: json['customerName'] as String?,
      address: json['address'] as String?,
      type: json['type'] as String?,
      licensePlate: json['licensePlate'] as String?,
      status: json['status'] as String?,
      cargoWeight: json['cargoWeight'] as String?,
      vehicleWeight: json['VehicleWeight'] as String?,
      goodsWeight: json['GoodsWeight'] as String?,
      vehicleWeighingDate: json['vehicleWeighingDate'] == null
          ? null
          : DateTime.parse(json['vehicleWeighingDate'] as String),
      verifiedWeighingDate: json['verifiedWeighingDate'] == null
          ? null
          : DateTime.parse(json['verifiedWeighingDate'] as String),
      vehicleWeighingImage: json['vehicleWeighingImage'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$LogisticEntryImplToJson(_$LogisticEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerName': instance.customerName,
      'address': instance.address,
      'type': instance.type,
      'licensePlate': instance.licensePlate,
      'status': instance.status,
      'cargoWeight': instance.cargoWeight,
      'VehicleWeight': instance.vehicleWeight,
      'GoodsWeight': instance.goodsWeight,
      'vehicleWeighingDate': instance.vehicleWeighingDate?.toIso8601String(),
      'verifiedWeighingDate': instance.verifiedWeighingDate?.toIso8601String(),
      'vehicleWeighingImage': instance.vehicleWeighingImage,
      'note': instance.note,
    };
