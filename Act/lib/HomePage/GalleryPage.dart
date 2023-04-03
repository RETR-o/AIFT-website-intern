import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'NavBarButton.dart';

double collapsableHeight = 0.0;

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {





  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Size ss = MediaQuery.of(context).size;
    return Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20),
            child: const AutoSizeText(
              "Gallery",
              minFontSize: 40,
              maxFontSize: 70,
              style: TextStyle(fontSize: 70),
              maxLines: 1,
            ),
          ),


          SizedBox(
            height: 700,
            width: ss.width,
            child: Padding(
              padding:
                  EdgeInsets.only( top: 50, bottom: 50),
              child: ImageSlideshow(
                imageUrls: [
                  'https://picsum.photos/600/400?random=1',
                  'https://picsum.photos/600/400?random=2',
                  'https://picsum.photos/600/400?random=3',
                  'https://picsum.photos/600/400?random=4',
                  'https://picsum.photos/600/400?random=5',
                ],
              ),
            ),
          ),],);
  }
}



class ImageSlideshow extends StatefulWidget {
  final List<String> imageUrls;

  ImageSlideshow({required this.imageUrls});

  @override
  _ImageSlideshowState createState() => _ImageSlideshowState();
}

class _ImageSlideshowState extends State<ImageSlideshow> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size ss = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: widget.imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    widget.imageUrls[index],
                    fit: BoxFit.cover,
                  );
                },
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          _controller.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8 ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imageUrls.length,
            (int index) {
              return GestureDetector(
                onTap: () {
                  _controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(widget.imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                    border: _currentPage == index
                        ? Border.all(
                            color: Theme.of(context).accentColor,
                            width: 2,
                          )
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
