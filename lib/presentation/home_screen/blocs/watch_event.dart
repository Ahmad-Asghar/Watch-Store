abstract class WatchEvent {}

class LoadWatch extends WatchEvent {}

class UpdateCurrentIndex extends WatchEvent {
  final int index;

  UpdateCurrentIndex(this.index);
}

class OnItemUpdate extends WatchEvent {
  final int index;
  final Map<String, dynamic> updatedAttributes;

   OnItemUpdate(this.index, this.updatedAttributes);

  List<Object> get props => [index, updatedAttributes];
}


