// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'order.freezed.dart';
part 'order.g.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

@freezed
class Order with _$Order {
    const factory Order({
        @JsonKey(name: "order_id")
        required String orderId,
        @JsonKey(name: "customer")
        required Customer customer,
        @JsonKey(name: "items")
        required List<Item> items,
        @JsonKey(name: "total")
        required double total,
        @JsonKey(name: "status")
        required String status,
    }) = _Order;

    factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class Customer with _$Customer {
    const factory Customer({
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "email")
        required String email,
        @JsonKey(name: "address")
        required Address address,
    }) = _Customer;

    factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
}

@freezed
class Address with _$Address {
    const factory Address({
        @JsonKey(name: "street")
        required String street,
        @JsonKey(name: "city")
        required String city,
        @JsonKey(name: "state")
        required String state,
        @JsonKey(name: "zip_code")
        required String zipCode,
        @JsonKey(name: "country")
        required String country,
    }) = _Address;

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class Item with _$Item {
    const factory Item({
        @JsonKey(name: "product_id")
        required String productId,
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "quantity")
        required int quantity,
        @JsonKey(name: "price")
        required double price,
    }) = _Item;

    factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
