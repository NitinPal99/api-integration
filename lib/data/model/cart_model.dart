class CartModel {
  List<Carts>? carts;
  int? total;
  int? skip;
  int? limit;

  CartModel({this.carts, this.total, this.skip, this.limit});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['carts'] != null) {
      json['carts'].forEach((v) {
        carts?.add(Carts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.carts != null) {
      data['carts'] = this.carts?.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Carts {
  int? id;
  List<Products>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Carts(
      {this.id,
      this.products,
      this.total,
      this.discountedTotal,
      this.userId,
      this.totalProducts,
      this.totalQuantity});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products?.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['discountedTotal'] = this.discountedTotal;
    data['userId'] = this.userId;
    data['totalProducts'] = this.totalProducts;
    data['totalQuantity'] = this.totalQuantity;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedTotal;
  String? thumbnail;

  Products(
      {this.id,
      this.title,
      this.price,
      this.quantity,
      this.total,
      this.discountPercentage,
      this.discountedTotal,
      this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    discountPercentage = json['discountPercentage'];
    discountedTotal = json['discountedTotal'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['discountPercentage'] = this.discountPercentage;
    data['discountedTotal'] = this.discountedTotal;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
