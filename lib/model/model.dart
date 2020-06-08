// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


Apartment welcomeFromJson(String str) => Apartment.fromJson(json.decode(str));

String welcomeToJson(Apartment data) => json.encode(data.toJson());

class Apartment {
    Apartment({
        this.json,
    });

    List<Json> json;

    factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        json: List<Json>.from(json["json"].map((x) => Json.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "json": List<dynamic>.from(json.map((x) => x.toJson())),
    };
}

class Json {
    Json({
        this.productImagePath,
        this.rentRange,
        this.amenities,
        this.rules,
        this.policies,
        this.id,
        this.propType,
        this.buildingName,
        this.flatDetails,
        this.streetDetails,
        this.city,
        this.pinCode,
        this.landmark,
        this.bedNo,
        this.balconyNo,
        this.bathroomNo,
        this.description,
        this.furnishedStatus,
        this.availableFor,
        this.similarRoom,
        this.advance,
        this.cotNo,
        this.agentId,
        this.totalTenantsPres,
        this.totalTenantsReq,
        this.v,
    });

    ProductImagePath productImagePath;
    RentRange rentRange;
    List<String> amenities;
    List<String> rules;
    List<String> policies;
    String id;
    String propType;
    String buildingName;
    String flatDetails;
    String streetDetails;
    String city;
    int pinCode;
    String landmark;
    int bedNo;
    int balconyNo;
    int bathroomNo;
    String description;
    String furnishedStatus;
    String availableFor;
    int similarRoom;
    int advance;
    int cotNo;
    String agentId;
    int totalTenantsPres;
    int totalTenantsReq;
    int v;

    factory Json.fromJson(Map<String, dynamic> json) => Json(
        productImagePath: ProductImagePath.fromJson(json["productImagePath"]),
        rentRange: RentRange.fromJson(json["rentRange"]),
        amenities: List<String>.from(json["amenities"].map((x) => x)),
        rules: List<String>.from(json["rules"].map((x) => x)),
        policies: List<String>.from(json["policies"].map((x) => x)),
        id: json["_id"],
        propType: json["propType"],
        buildingName: json["buildingName"],
        flatDetails: json["flatDetails"],
        streetDetails: json["streetDetails"],
        city: json["city"],
        pinCode: json["pinCode"],
        landmark: json["landmark"],
        bedNo: json["bedNo"],
        balconyNo: json["balconyNo"],
        bathroomNo: json["bathroomNo"],
        description: json["description"],
        furnishedStatus: json["furnishedStatus"],
        availableFor: json["availableFor"],
        similarRoom: json["similarRoom"],
        advance: json["advance"],
        cotNo: json["cotNo"],
        agentId: json["agentID"],
        totalTenantsPres: json["totalTenantsPres"],
        totalTenantsReq: json["totalTenantsReq"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "productImagePath": productImagePath.toJson(),
        "rentRange": rentRange.toJson(),
        "amenities": List<dynamic>.from(amenities.map((x) => x)),
        "rules": List<dynamic>.from(rules.map((x) => x)),
        "policies": List<dynamic>.from(policies.map((x) => x)),
        "_id": id,
        "propType": propType,
        "buildingName": buildingName,
        "flatDetails": flatDetails,
        "streetDetails": streetDetails,
        "city": city,
        "pinCode": pinCode,
        "landmark": landmark,
        "bedNo": bedNo,
        "balconyNo": balconyNo,
        "bathroomNo": bathroomNo,
        "description": description,
        "furnishedStatus": furnishedStatus,
        "availableFor": availableFor,
        "similarRoom": similarRoom,
        "advance": advance,
        "cotNo": cotNo,
        "agentID": agentId,
        "totalTenantsPres": totalTenantsPres,
        "totalTenantsReq": totalTenantsReq,
        "__v": v,
    };
}

class ProductImagePath {
    ProductImagePath({
        this.bedroom,
        this.other,
        this.exteriorView,
        this.livingRoom,
        this.kitchen,
        this.floorPlan,
        this.location,
    });

    List<dynamic> bedroom;
    List<dynamic> other;
    String exteriorView;
    String livingRoom;
    dynamic kitchen;
    dynamic floorPlan;
    String location;

    factory ProductImagePath.fromJson(Map<String, dynamic> json) => ProductImagePath(
        bedroom: List<dynamic>.from(json["bedroom"].map((x) => x)),
        other: json["other"] == null ? null : List<dynamic>.from(json["other"].map((x) => x)),
        exteriorView: json["exteriorView"],
        livingRoom: json["livingRoom"] == null ? null : json["livingRoom"],
        kitchen: json["kitchen"],
        floorPlan: json["floorPlan"],
        location: json["location"] == null ? null : json["location"],
    );

    Map<String, dynamic> toJson() => {
        "bedroom": List<dynamic>.from(bedroom.map((x) => x)),
        "other": other == null ? null : List<dynamic>.from(other.map((x) => x)),
        "exteriorView": exteriorView,
        "livingRoom": livingRoom == null ? null : livingRoom,
        "kitchen": kitchen,
        "floorPlan": floorPlan,
        "location": location == null ? null : location,
    };
}

class RentRange {
    RentRange({
        this.daily,
        this.monthly,
    });

    List<dynamic> daily;
    List<dynamic> monthly;

    factory RentRange.fromJson(Map<String, dynamic> json) => RentRange(
        daily: List<dynamic>.from(json["daily"].map((x) => x)),
        monthly: List<dynamic>.from(json["monthly"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "daily": List<dynamic>.from(daily.map((x) => x)),
        "monthly": List<dynamic>.from(monthly.map((x) => x)),
    };
}
