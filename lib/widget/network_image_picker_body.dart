import 'package:chat_app/repo/image_repository.dart';
import 'package:flutter/material.dart';

import '../models/image_model.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final Function(String) onImageSelected;
  NetworkImagePickerBody({super.key, required this.onImageSelected});
  final ImageRepository _imageRepository = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: FutureBuilder(
          future: _imageRepository.getNetworkImages(),
          builder:
              (
                BuildContext context,
                AsyncSnapshot<List<PixelFormImage>> snapshot,
              ) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      mainAxisExtent: MediaQuery.of(context).size.width * 0.5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          onImageSelected(snapshot.data![index].urlFullSize);
                        },
                        child: Image.network(snapshot.data![index].urlFullSize),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('This is the error: ${snapshot.error}'),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
        ),
      ),
    );
  }
}
