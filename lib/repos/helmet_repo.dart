import 'dart:ui';

import '../presentation/home_screen/models/item_model.dart';

class WatchesRepository {

  List<Color> colors = [
    const Color(0xffe93f56),
    const Color(0xfff1dbb7),
    const Color(0xffefefef),
    const Color(0xff76340b),
    const Color(0xffd76f19),
    const Color(0xff2c3a5f),
    const Color(0xffefefef),
  ];

  // Persistent list for cart items
  final List<ItemModel> _cartItems = [];

  List<ItemModel> getWatches() {
    return [
      ItemModel(imageUrl: 'assets/images/png/1.png', name: 'OCEAN MASTER', color: colors[0], availableCount: 50, itemCode: 'WT-1234-BK', price: 2560, isLiked: false, count: 1,),
      ItemModel(imageUrl: 'assets/images/png/2.png', name: 'STELLAR CLASSIC', color: colors[1], availableCount: 20, itemCode: 'WT-5678-WH',price: 1890, isLiked: false,count: 1,),
      ItemModel(imageUrl: 'assets/images/png/3.png', name: 'GALAXY PRO', color: colors[2], availableCount: 35, itemCode: 'WT-9101-BL',price: 2000, isLiked: false,count: 1,),
      ItemModel(imageUrl: 'assets/images/png/5.png', name: 'MOUNTAIN EXPEDITION', color: colors[4], availableCount: 40, itemCode: 'WT-3344-GR',price: 2160, isLiked: false,count: 1,),
      ItemModel(imageUrl: 'assets/images/png/4.png', name: 'SUNSET LIMITED', color: colors[3], availableCount: 10, itemCode: 'WT-1122-OR',price: 1060, isLiked: false,count: 1,),
      ItemModel(imageUrl: 'assets/images/png/6.png', name: 'MIDNIGHT SERIE', color: colors[5], availableCount: 15, itemCode: 'WT-5566-PL',price: 900, isLiked: false,count: 1,),
      ItemModel(imageUrl: 'assets/images/png/7.png', name: 'URBAN EDGE', color: colors[6], availableCount: 25, itemCode: 'WT-7788-BL',price: 1300, isLiked: false,count: 1,),
    ];
  }

  List<ItemModel> getCartWatches() {
    return List.unmodifiable(_cartItems);
  }

  void addToCart(ItemModel item) {
    if (!_cartItems.contains(item)) {
      _cartItems.add(item);
    }
  }

  void removeFromCart(ItemModel item) {
    _cartItems.remove(item);
  }

  void updateWatch(ItemModel updatedItem) {
    final index = getWatches().indexWhere((item) => item.itemCode == updatedItem.itemCode);
    if (index != -1) {
      getWatches()[index] = updatedItem;
    }
  }
}
