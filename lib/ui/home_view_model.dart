import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';

class HomeViewModel with ChangeNotifier{
  final PhotoAPIRepository repository;

  // final StreamController<List<Photo>> _controller = StreamController()..add([]);
  // Stream<List<Photo>> get stream => _controller.stream;

  List<Photo> _photos = [];

  //이렇게 reference기반으로 _photo자체의 수정을 막아도 .add 나 .clear 같은 메소드들은 적용 가능하다. 그래서 UnmodifiableListView를 사용한다
  //코드상에서 잡아내진 않지만 런타임에 에러를 발생시킨다
  //List<Photo> get photos => _photos;
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async{
    final result = await repository.fetch(query);
    //_controller.add(result);
    //_photos = result;
    //notifyListeners();
  }

}