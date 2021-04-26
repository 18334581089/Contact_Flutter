import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIcon {
  static const IconData icon1 =
      const IconData(59079, fontFamily: 'myIcon', matchTextDirection: true);
  static const IconData icon2 =
      const IconData(59080, fontFamily: 'myIcon', matchTextDirection: true);
  static const IconData icon3 =
      const IconData(59981, fontFamily: 'myIcon', matchTextDirection: true);
  static const IconData icon4 =
      const IconData(59082, fontFamily: 'myIcon', matchTextDirection: true);
}

class baseWidgetIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('base widget icon'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("\uE914 \uE000 \uE90D",
                style: TextStyle(
                    fontFamily: "MaterialIcons",
                    fontSize: 30,
                    color: Colors.green)),
            Text('使用图标就像使用文本一样，但是这种方式需要我们提供每个图标的码点'),
            Text('所以 IconData 和 Icon就是可以直接使用icon不需要码点'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.accessible,
                  color: Colors.green,
                ),
                Icon(
                  Icons.error,
                  color: Colors.green,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  MyIcon.icon1,
                  color: Colors.green,
                ),
                Icon(
                  MyIcon.icon2,
                  color: Colors.green,
                ),
                Icon(
                  MyIcon.icon3,
                  color: Colors.green,
                ),
                Icon(
                  MyIcon.icon4,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
