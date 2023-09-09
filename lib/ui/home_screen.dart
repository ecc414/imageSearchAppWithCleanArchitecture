import 'package:flutter/material.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';
import 'package:image_search/ui/widget/photo_widget.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //옛날 코드
    //final viewModel = Provider.of<HomeViewModel>(context);
    //요즘은 context의 확장 기능 이용
    //final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색 앱'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),),
                ),
                suffixIcon: IconButton(onPressed: () async{
                  context.read<HomeViewModel>().fetch(_controller.text);
                  // final photos = await photoProvider.api.fetch(_controller.text);
                  // setState((){
                  //   _photos = photos;
                  // });
                }, icon: const Icon(Icons.search),
                )
              ),
            ),
          ),
          Consumer<HomeViewModel>(builder: (_, viewModel, __) => Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              itemCount: viewModel.photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final photo = viewModel.photos[index];
                return PhotoWidget(photo: photo);
              },
            ),
          ),),
        ],
      ),
    );
  }
}
