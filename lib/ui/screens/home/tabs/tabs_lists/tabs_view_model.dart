import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/apis_manager.dart';
import '../../../../../data/model/sources_response.dart';
import '../../../../base/base_api_state.dart';

class TabsViewModel extends Cubit<TabsViewModelState> {
  TabsViewModel() : super(TabsViewModelState.intial());

  getSources(String categoryId) async {
    try {
      emit(TabsViewModelState(BaseLoadingState()));
      List<Source> sources =
          (await ApisManager.getSources(categoryId)).sources!;
      emit(TabsViewModelState(BaseSuccessState(sources)));
    } catch (e) {
      emit(TabsViewModelState(BaseErrorState(e.toString())));
    }
  }
}

class TabsViewModelState {
  late BaseApiState sourcesApiState;

  TabsViewModelState(this.sourcesApiState);

  TabsViewModelState.intial() {
    sourcesApiState = BaseLoadingState();
  }
}
