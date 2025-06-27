import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [];
  int totalPrice = 0;

  ShoppingMall() {
    products = [
      Product('shirt', 45000),
      Product('one-piece', 30000),
      Product('short sleeved T-shirt', 35000),
      Product('shorts', 38000),
      Product('socks', 5000),
    ];
  }

  void showProducts() {
    print('\n 판매 중인 상품 목록:');
    for (var product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  void addToCart(String name, String quantityInput) {
    try {
      Product selected = products.firstWhere((p) => p.name == name);

      int? quantity = int.tryParse(quantityInput);
      if (quantity == null) {
        print('입력값이 올바르지 않아요 !');
        return;
      }

      if (quantity <= 0) {
        print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
        return;
      }

      totalPrice += selected.price * quantity;
      print('장바구니에 상품이 담겼어요 !');
    } catch (e) {
      print('입력값이 올바르지 않아요 !');
    }
  }

  void showTotal() {
    print('장바구니에 ${totalPrice}원 어치를 담으셨네요 !');
  }
}

void main() {
  ShoppingMall mall = ShoppingMall();
  bool running = true;

  while (running) {
    print('\n=====  콘솔 쇼핑몰 =====');
    print('1. 상품 목록 보기');
    print('2. 상품 장바구니에 담기');
    print('3. 장바구니 총 가격 보기');
    print('4. 프로그램 종료');
    stdout.write('원하는 기능 번호 입력: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        stdout.write('상품 이름을 입력하세요: ');
        String? name = stdin.readLineSync();

        stdout.write('상품 개수를 입력하세요: ');
        String? quantity = stdin.readLineSync();

        if (name != null && quantity != null) {
          mall.addToCart(name.trim(), quantity.trim());
        } else {
          print('입력값이 올바르지 않아요 !');
        }
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
        running = false;
        break;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
