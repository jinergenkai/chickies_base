// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    String orderId;
    Customer customer;
    List<Item> items;
    double total;
    String status;

    Order({
        required this.orderId,
        required this.customer,
        required this.items,
        required this.total,
        required this.status,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        customer: Customer.fromJson(json["customer"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        total: json["total"]?.toDouble(),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "customer": customer.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "total": total,
        "status": status,
    };
}

class Customer {
    String name;
    String email;
    Address address;

    Customer({
        required this.name,
        required this.email,
        required this.address,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "address": address.toJson(),
    };
}

class Address {
    String street;
    String city;
    String state;
    String zipCode;
    String country;

    Address({
        required this.street,
        required this.city,
        required this.state,
        required this.zipCode,
        required this.country,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "country": country,
    };
}

class Item {
    String productId;
    String name;
    int quantity;
    double price;

    Item({
        required this.productId,
        required this.name,
        required this.quantity,
        required this.price,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "quantity": quantity,
        "price": price,
    };
}
