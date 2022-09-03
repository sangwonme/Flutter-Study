import 'package:api_mvvm_tutorial/model/store.dart';
import 'package:api_mvvm_tutorial/repository/location.dart';
import 'package:api_mvvm_tutorial/repository/store_repository.dart';
import 'package:flutter/foundation.dart';

class StoreModel with ChangeNotifier{
  List<Store> stores = [];
  var isLoading = false;

  final _storeRepository = StoreRepository();
  final _locationRepository = LocationRepository();

  StoreModel(){
    fetch();
  }

  Future fetch() async {
    isLoading = true;
    notifyListeners();

    stores = await _storeRepository.fetch();
    isLoading = false;
    notifyListeners();
  }
}