import '../models/item_model.dart';

abstract class WatchState {}

class WatchInitial extends WatchState {}

class WatchLoaded extends WatchState {
  final List<ItemModel> watches;
  final List<ItemModel> cartWatches;
  final int currentIndex;

  WatchLoaded({required this.watches, required this.currentIndex,required this.cartWatches});
}
