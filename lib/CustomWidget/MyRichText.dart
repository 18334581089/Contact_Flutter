import 'package:flutter/material.dart';

class MyRichText extends StatefulWidget {
  MyRichText({
    Key key,
    this.text, // 文本字符串
    this.linkStyle, // url链接样式
  }) : super(key: key);

  final String text;
  final TextStyle linkStyle;

  @override
  _MyRichTextState createState() => _MyRichTextState();
}

class _MyRichTextState extends State<MyRichText> {
  TextSpan _textSpan;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _textSpan,
    );
  }

  TextSpan parseText(String text) {
    // 耗时操作：解析文本字符串，构建出TextSpan。
    // 省略具体实现。
    this.setState(() {
      _textSpan =
          TextSpan(text: text + '编译后', style: TextStyle(color: Colors.blue));
    });
    return TextSpan(text: text + '编译后', style: TextStyle(color: Colors.blue));
  }

  @override
  void initState() {
    _textSpan = parseText(widget.text);
    super.initState();
  }

// 防止: 在text发生变化时，parseText没有重新执行，导致_textSpan任然是旧的解析值
  @override
  void didUpdateWidget(MyRichText oldWidget) {
    if (widget.text != oldWidget.text) {
      _textSpan = parseText(widget.text);
    }
    super.didUpdateWidget(oldWidget);
  }
}

class MyRichTextRoute extends StatefulWidget {
  @override
  _MyRichTextRoutee createState() => new _MyRichTextRoutee();
}

class _MyRichTextRoutee extends State<MyRichTextRoute> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            Text('文字内容'),
            MyRichText(text: '文字内容'),
          ],
        ),
      ),
    );
  }
}
