import 'package:flutter/material.dart';

import '../../../../../data/apis_manager.dart';
import '../../../../../data/model/sources_response.dart';
import '../../../../base/base_api_state.dart';

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
