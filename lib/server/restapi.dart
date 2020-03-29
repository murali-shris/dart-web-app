library product.server;

import 'package:rpc/rpc.dart';

import '../common/messages.dart';

// This class defines the interface that the server provides.
@ApiClass(version: 'v1')
class ProductsApi {
  final Map<int, Product> productMap = {};

  ProductsApi() {
    var product_1 = new Product.create(1, 'iphone', 20000);
    var product_2 = new Product.create(2, 'pixel', 15000) ;
    productMap[1] = product_1;
    productMap[2] = product_2;
  }

  // Returns a list of products
  @ApiMethod(path: 'products')
  List<Product> listProducts() {
    return productMap.values.toList();
  }

  @ApiMethod(path: 'products/get/{_id}')
  Product getProduct(int _id) {
    var product = productMap[_id];
    if (product == null) {
      throw new InternalServerError('No product found for id!');
    }
    return product;
  }
}