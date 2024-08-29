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
