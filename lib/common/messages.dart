library product.messages;

// This class is used to send data back and forth between the
// client and server. It is automatically serialized and
// deserialized by the RPC package.
class Product {
  int id;
  String name;
  double price;

  // A message class must have a default constructor taking no
  // arguments.
  Product();

  // It is fine to have other named constructors.
  Product.create(id, String name, double price) {
    this.id = id;
    this.name = name;
    this.price = price;
  }

  @override
  String toString() => id.toString() + ':' + name +':' + price.toString();
}