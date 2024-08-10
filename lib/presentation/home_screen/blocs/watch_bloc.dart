import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repos/helmet_repo.dart';
import 'watch_event.dart';
import 'watch_state.dart';

class WatchBloc extends Bloc<WatchEvent, WatchState> {
  final WatchesRepository watchRepository;
  int currentIndex = 0;
  PageController pageController =PageController();

  WatchBloc(this.watchRepository) : super(WatchInitial()) {

    on<LoadWatch>((event, emit) async {
      final watches = watchRepository.getWatches();
      final cartWatches = watchRepository.getCartWatches();
      emit(WatchLoaded(
        watches: watches,
        currentIndex: currentIndex,
        cartWatches: cartWatches,
      ));
    });

    on<OnItemUpdate>((event, emit) {
      if (state is WatchLoaded) {
        final watches = (state as WatchLoaded).watches;
        final index = event.index;
        if (index >= 0 && index < watches.length) {
          final item = watches[index];
          final updatedItem = item.copyWith(
            imageUrl: event.updatedAttributes['imageUrl'] as String? ?? item.imageUrl,
            name: event.updatedAttributes['name'] as String? ?? item.name,
            color: event.updatedAttributes['color'] as Color? ?? item.color,
            availableCount: event.updatedAttributes['availableCount'] as int? ?? item.availableCount,
            count: event.updatedAttributes['count'] as int? ?? item.count,
            itemCode: event.updatedAttributes['itemCode'] as String? ?? item.itemCode,
            price: event.updatedAttributes['price'] as double? ?? item.price,
            isLiked: event.updatedAttributes['isLiked'] as bool? ?? item.isLiked,
          );
          watches[index] = updatedItem;
          watchRepository.updateWatch(updatedItem);
          emit(WatchLoaded(
            watches: List.from(watches),
            currentIndex: currentIndex,
            cartWatches: (state as WatchLoaded).cartWatches,
          ));
        }
      }
    });

    on<UpdateCurrentIndex>((event, emit) {
      currentIndex = event.index;
      if (state is WatchLoaded) {
        emit(WatchLoaded(
          watches: (state as WatchLoaded).watches,
          currentIndex: currentIndex,
          cartWatches: (state as WatchLoaded).cartWatches,
        ));
      }
    });
  }
}
