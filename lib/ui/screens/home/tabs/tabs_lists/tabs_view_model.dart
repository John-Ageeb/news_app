import 'package:flutter/material.dart';

import '../../../../../data/apis_manager.dart';
import '../../../../../data/model/sources_response.dart';

class TabsViewModel extends ChangeNotifier {
  BaseApiState sourcesApiState = BaseLoadingState();

  getSources(String categoryId) async {
    try {
      sourcesApiState = BaseLoadingState();
      notifyListeners();
      List<Source> sources =
          (await ApisManager.getSources(categoryId)).sources!;
      sourcesApiState = BaseSuccessState(sources);

      notifyListeners();
    } catch (e) {
      sourcesApiState = BaseErrorState(e.toString());

      notifyListeners();
    }
  }
}

abstract class BaseApiState {}

class BaseLoadingState extends BaseApiState {}

class BaseSuccessState<T> extends BaseApiState {
  T data; // to be generic fro all type of data
  BaseSuccessState(this.data);
}

class BaseErrorState extends BaseApiState {
  String errorMassage;

  BaseErrorState(this.errorMassage);
}
