// To parse this JSON data, do
//
//     final logisticEntry = logisticEntryFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'logistic_entry.freezed.dart';
part 'logistic_entry.g.dart';

LogisticEntry logisticEntryFromJson(String str) => LogisticEntry.fromJson(json.decode(str));

String logisticEntryToJson(LogisticEntry data) => json.encode(data.toJson());

@freezed
class LogisticEntry with _$LogisticEntry {
    const factory LogisticEntry({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "customName")
        required String customName,
        @JsonKey(name: "address")
        required String address,
        @JsonKey(name: "type")
        required String type,
        @JsonKey(name: "licensePlate")
        required String licensePlate,
        @JsonKey(name: "status")
        required String status,
        @JsonKey(name: "cargoWeight")
        required String cargoWeight,
        @JsonKey(name: "VehicleWeight")
        required String vehicleWeight,
        @JsonKey(name: "GoodsWeight")
        required String goodsWeight,
        @JsonKey(name: "vehicleWeighingDate")
        required DateTime vehicleWeighingDate,
        @JsonKey(name: "verifiedWeighingDate")
        required DateTime verifiedWeighingDate,
        @JsonKey(name: "VehicleWeighingImage")
        String? vehicleWeighingImage,
    }) = _LogisticEntry;

    factory LogisticEntry.fromJson(Map<String, dynamic> json) => _$LogisticEntryFromJson(json);
}
