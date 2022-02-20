class OrderModel {
  bool? success;
  int? responseCode;
  String? message;
  Data? data;

  OrderModel({this.success, this.responseCode, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseCode = json['response_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? clientId;
  String? serviceId;
  String? subCategoryId;
  String? date;
  String? time;
  String? address;
  String? lat;
  String? long;
  String? notes;
  String? paymentTypeId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.clientId,
        this.serviceId,
        this.subCategoryId,
        this.date,
        this.time,
        this.address,
        this.lat,
        this.long,
        this.notes,
        this.paymentTypeId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    serviceId = json['service_id'];
    subCategoryId = json['sub_category_id'];
    date = json['date'];
    time = json['time'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    notes = json['notes'];
    paymentTypeId = json['payment_type_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['service_id'] = this.serviceId;
    data['sub_category_id'] = this.subCategoryId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['notes'] = this.notes;
    data['payment_type_id'] = this.paymentTypeId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
