class TechnicalProfileDataModel {
  bool? success;
  int? responseCode;
  String? message;
  Data? data;
  int? totalSuccessOrders;

  TechnicalProfileDataModel(
      {this.success,
        this.responseCode,
        this.message,
        this.data,
        this.totalSuccessOrders});

  TechnicalProfileDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseCode = json['response_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    totalSuccessOrders = json['total_success_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['total_success_orders'] = this.totalSuccessOrders;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  Null? image;
  String? phone;
  String? description;
  int? type;
  int? status;
  int? rate;
  UserAddress? userAddress;
  UserService? userService;
  List<Null>? images;

  Data(
      {this.id,
        this.name,
        this.email,
        this.image,
        this.phone,
        this.description,
        this.type,
        this.status,
        this.rate,
        this.userAddress,
        this.userService,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    description = json['description'];
    type = json['type'];
    status = json['status'];
    rate = json['rate'];
    userAddress = json['user_address'] != null
        ? new UserAddress.fromJson(json['user_address'])
        : null;
    userService = json['user_service'] != null
        ? new UserService.fromJson(json['user_service'])
        : null;
    // if (json['images'] != null) {
    //   images = <Null>[];
    //   json['images'].forEach((v) {
    //     images!.add(Ico);
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['description'] = this.description;
    data['type'] = this.type;
    data['status'] = this.status;
    data['rate'] = this.rate;
    if (this.userAddress != null) {
      data['user_address'] = this.userAddress!.toJson();
    }
    if (this.userService != null) {
      data['user_service'] = this.userService!.toJson();
    }
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class UserAddress {
  int? userId;
  int? areaId;
  Null? lat;
  Null? long;
  Area? area;

  UserAddress({this.userId, this.areaId, this.lat, this.long, this.area});

  UserAddress.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    areaId = json['area_id'];
    lat = json['lat'];
    long = json['long'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['area_id'] = this.areaId;
    data['lat'] = this.lat;
    data['long'] = this.long;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    return data;
  }
}

class Area {
  int? id;
  String? name;
  String? nameAr;

  Area({this.id, this.name, this.nameAr});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    return data;
  }
}

class UserService {
  int? userId;
  int? subCategoryId;
  Area? subCategory;

  UserService({this.userId, this.subCategoryId, this.subCategory});

  UserService.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    subCategoryId = json['sub_category_id'];
    subCategory = json['sub_category'] != null
        ? new Area.fromJson(json['sub_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['sub_category_id'] = this.subCategoryId;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    return data;
  }
}