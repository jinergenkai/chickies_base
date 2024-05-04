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
        int id,
        @JsonKey(name: "customName")
        String customName,
        @JsonKey(name: "address")
        String address,
        @JsonKey(name: "type")
        String type,
        @JsonKey(name: "licensePlate")
        String licensePlate,
        @JsonKey(name: "status")
        String status,
        @JsonKey(name: "cargoWeight")
        String cargoWeight,
        @JsonKey(name: "VehicleWeight")
        String vehicleWeight,
        @JsonKey(name: "GoodsWeight")
        String goodsWeight,
        @JsonKey(name: "vehicleWeighingDate")
        DateTime vehicleWeighingDate,
        @JsonKey(name: "verifiedWeighingDate")
        DateTime verifiedWeighingDate,
        @JsonKey(name: "VehicleWeighingImage")
        String vehicleWeighingImage,
    }) = _LogisticEntry;

    factory LogisticEntry.fromJson(Map<String, dynamic> json) => _$LogisticEntryFromJson(json);
}
