//Result라는 객체를 만들 수 없게 추상 클래스로 만듦
//봉인 클래스, sealed class
//Success, Error 등 클래스들이 Result 안에서 생성되는 형태이다
//Dart의 enum은 데이터를 같이 저장하는 것이 어려우므로 봉인 클래스 형태 사용
abstract class Result<T>{
  factory Result.success(T data) = Success;
  factory Result.error(String message) = Error;
}

class Success<T> implements Result<T> {
  final T data;

  Success(this.data);
}

class Error<T> implements Result<T> {
  final String message;

  Error(this.message);
}