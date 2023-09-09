import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/model/photo.dart';

abstract class PhotoAPIRepository {
  Future<Result<List<Photo>>> fetch (String query);
}