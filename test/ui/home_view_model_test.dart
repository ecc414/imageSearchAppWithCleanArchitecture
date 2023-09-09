import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';

void main() {
  test('Stream should work', () async{

    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch("apple");

    final result = fakeData.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.photos, result);

  });
}

class FakePhotoApiRepository extends PhotoAPIRepository{
  @override
  Future<List<Photo>> fetch(String query) async{
    Future.delayed(const Duration(milliseconds: 500));
    return fakeData.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeData = [
  {
    "id": 634572,
    "pageURL": "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL": "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL": "https://pixabay.com/get/ge96276a00e0b4f1d1599636c10ea6a07387d3a228ac6300c8b288881f4615f8bdb07bcd338e1e21e180d9824a3dac8c8_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL": "https://pixabay.com/get/gfb182d67ce70cbc2722c75235e946c794a77e765ea1da0221e8cd9302ec18b0917b2f328c7d0cfbd97ce765c28fcb34561b1cb5d5135c4c117334402081c97fe_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 496791,
    "downloads": 295179,
    "collections": 1286,
    "likes": 2373,
    "comments": 196,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL": "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL": "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL": "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL": "https://pixabay.com/get/g45ad59a481f31886827c936b9082d88355f0ffe18b539b5b336bd09168ef65efc683bed3ab14904b18a0165a418aa41ab04d049af1fba884ecfdeab343462067_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL": "https://pixabay.com/get/gd69b31f1653e5ec966dc3d4185b618dea3dd40c4a049bb6df42f47d5c305538ebce388399ac47411b32fbd2009e46553bc1fb50fae2cd0bf5a4e3ea2a7b78c71_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 717423,
    "downloads": 525294,
    "collections": 1397,
    "likes": 1051,
    "comments": 280,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
];