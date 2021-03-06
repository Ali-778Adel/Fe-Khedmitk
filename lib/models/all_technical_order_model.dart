class AllTechnicalOrdersModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  AllTechnicalOrdersModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  AllTechnicalOrdersModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  int? clientId;
  int? technicalId;
  int? subCategoryId;
  int? serviceId;
  int? orderTypeId;
  int? paymentTypeId;
  String? address;
  String? lat;
  String? long;
  Null? attachment;
  String? notes;
  String? total;
  String? commission;
  String? paymentStatus;
  String? date;
  String? time;
  String? createdAt;
  String? updatedAt;
  Null? fees;
  Service? service;
  Payment? payment;
  OrderType? orderType;
  Client? client;
  List<Null>? images;

  Data(
      {this.id,
        this.clientId,
        this.technicalId,
        this.subCategoryId,
        this.serviceId,
        this.orderTypeId,
        this.paymentTypeId,
        this.address,
        this.lat,
        this.long,
        this.attachment,
        this.notes,
        this.total,
        this.commission,
        this.paymentStatus,
        this.date,
        this.time,
        this.createdAt,
        this.updatedAt,
        this.fees,
        this.service,
        this.payment,
        this.orderType,
        this.client,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    technicalId = json['technical_id'];
    subCategoryId = json['sub_category_id'];
    serviceId = json['service_id'];
    orderTypeId = json['order_type_id'];
    paymentTypeId = json['payment_type_id'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    attachment = json['attachment'];
    notes = json['notes'];
    total = json['total'];
    commission = json['commission'];
    paymentStatus = json['payment_status'];
    date = json['date'];
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fees = json['fees'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    payment =
    json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    orderType = json['order_type'] != null
        ? new OrderType.fromJson(json['order_type'])
        : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    // if (json['images'] != null) {
    //   images = <Null>[];
    //   json['images'].forEach((v) {
    //     images!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_id'] = this.clientId;
    data['technical_id'] = this.technicalId;
    data['sub_category_id'] = this.subCategoryId;
    data['service_id'] = this.serviceId;
    data['order_type_id'] = this.orderTypeId;
    data['payment_type_id'] = this.paymentTypeId;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['attachment'] = this.attachment;
    data['notes'] = this.notes;
    data['total'] = this.total;
    data['commission'] = this.commission;
    data['payment_status'] = this.paymentStatus;
    data['date'] = this.date;
    data['time'] = this.time;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['fees'] = this.fees;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    if (this.orderType != null) {
      data['order_type'] = this.orderType!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Service {
  int? id;
  int? subCategoryId;
  String? name;
  String? nameAr;
  int? active;
  String? image;
  Null? createdAt;
  String? updatedAt;

  Service(
      {this.id,
        this.subCategoryId,
        this.name,
        this.nameAr,
        this.active,
        this.image,
        this.createdAt,
        this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    active = json['active'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_category_id'] = this.subCategoryId;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['active'] = this.active;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Payment {
  int? id;
  String? name;
  String? nameAr;
  int? active;
  Null? createdAt;
  Null? updatedAt;

  Payment(
      {this.id,
        this.name,
        this.nameAr,
        this.active,
        this.createdAt,
        this.updatedAt});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OrderType {
  int? id;
  String? type;
  String? createdAt;
  String? updatedAt;

  OrderType({this.id, this.type, this.createdAt, this.updatedAt});

  OrderType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? type;
  Null? image;
  int? status;
  Null? description;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null? deviceToken;
  int? rate;

  Client(
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

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    image = json['image'];
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