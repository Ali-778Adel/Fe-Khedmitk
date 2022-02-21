class GetOffersDealModel {
  bool? success;
  int? responseCode;
  String? message;
  List<DataOfferDeal>? data;

  GetOffersDealModel(
      {this.success, this.responseCode, this.message, this.data});

  GetOffersDealModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseCode = json['response_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataOfferDeal>[];
      json['data'].forEach((v) {
        data!.add(new DataOfferDeal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataOfferDeal {
  int? id;
  int? orderId;
  int? technicalId;
  String? total;
  int? accepted;
  String? createdAt;
  String? updatedAt;
  Technical? technical;

  DataOfferDeal(
      {this.id,
        this.orderId,
        this.technicalId,
        this.total,
        this.accepted,
        this.createdAt,
        this.updatedAt,
        this.technical});

  DataOfferDeal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    technicalId = json['technical_id'];
    total = json['total'];
    accepted = json['accepted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    technical = json['technical'] != null
        ? new Technical.fromJson(json['technical'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['technical_id'] = this.technicalId;
    data['total'] = this.total;
    data['accepted'] = this.accepted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.technical != null) {
      data['technical'] = this.technical!.toJson();
    }
    return data;
  }
}

class Technical {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? type;
  String? image;
  int? status;
  String? description;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null? deviceToken;
  int? rate;

  Technical(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.type,
        this.image,
        this.status,
        this.description,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.deviceToken,
        this.rate});

  Technical.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    image = json['image']==null ? null :json['image'];
    status = json['status'];
    description = json['description'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deviceToken = json['device_token'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['image'] = this.image;
    data['status'] = this.status;
    data['description'] = this.description;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['device_token'] = this.deviceToken;
    data['rate'] = this.rate;
    return data;
  }
}
