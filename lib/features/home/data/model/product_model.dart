class ProductModel{
  String? image;
  String? name;
  String? price;
  ProductModel.fromJson(Map<String,dynamic>json){
    image=json['image'];
    name=json['name'];
    price=json['price'];
  }
}