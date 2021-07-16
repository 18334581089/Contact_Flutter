import 'package:flutter/material.dart';

class ImageInternalTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyImage(
            imageProvider: NetworkImage(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            ),
          )
        ],
      ),
    );
  }
}

class MyImage extends StatefulWidget {
  const MyImage({
    Key key,
    @required this.imageProvider,
  })  : assert(imageProvider != null),
        super(key: key);

  final ImageProvider imageProvider;

  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
// 流程如下：
// 1 通过imageProvider.resolve方法可以得到一个ImageStream（图片数据流），然后监听ImageStream的变化。当图片数据源发生变化时，ImageStream会触发相应的事件，而本例中我们只设置了图片成功的监听器_updateImage，而_updateImage中只更新了_imageInfo。值得注意的是，如果是静态图，ImageStream只会触发一次时间，如果是动态图，则会触发多次事件，每一次都会有一个解码后的图片帧。
// 2 _imageInfo 更新后会rebuild，此时会创建一个RawImage Widget。RawImage最终会通过RenderImage来将图片绘制在屏幕上。如果继续跟进RenderImage类，我们会发现RenderImage的paint 方法中调用了paintImage方法，而paintImage方法中通过Canvas的drawImageRect(…)、drawImageNine(...)等方法来完成最终的绘制。
// 3 最终的绘制由RawImage来完成。
  ImageStream _imageStream;
  ImageInfo _imageInfo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 依赖改变时，图片的配置信息可能会发生改变
    _getImage();
  }

  @override
  void didUpdateWidget(MyImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageProvider != oldWidget.imageProvider) _getImage();
  }

  void _getImage() {
    final ImageStream oldImageStream = _imageStream;
    // 调用imageProvider.resolve方法，获得ImageStream。
    _imageStream =
        widget.imageProvider.resolve(createLocalImageConfiguration(context));
    //判断新旧ImageStream是否相同，如果不同，则需要调整流的监听器
    if (_imageStream.key != oldImageStream?.key) {
      final ImageStreamListener listener = ImageStreamListener(_updateImage);
      oldImageStream?.removeListener(listener);
      _imageStream.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      // Trigger a build whenever the image changes.
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    _imageStream.removeListener(ImageStreamListener(_updateImage));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawImage(
      image: _imageInfo?.image, // this is a dart:ui Image object
      scale: _imageInfo?.scale ?? 1.0,
    );
  }
}
