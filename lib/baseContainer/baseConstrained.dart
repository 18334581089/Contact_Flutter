import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseConstrained extends StatelessWidget {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('限制大小的盒子'),
      ),
      body: Column(
        children: [
          Text('ConstrainedBox.constraints 对子组件额外约束'),
          Text('constraints: BoxConstraints类用来设置限制(另外它还可以通过便捷函数设置限制'),
          Text('父元素: ConstrainedBox(minHeight: 50)'),
          Text('子元素: Container(height: 5)'),
          Text('父元素生效了'),
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: double.infinity, // 宽度尽可能大
                minHeight: 50.0 // 最小高度为50像素
                ),
            child: Container(
                height: 5.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                )),
          ),
          Text('SizeBox, '),
          Text('SizeBox 可以转化为 constrainedBox 的写法,他俩返回的是同一个对象'),
          SizedBox(
            width: 80.0,
            height: 80.0,
            child: redBox,
          ),
          Text('多个限制时, 会获取最大的那个值,保证不冲突'),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 45,
              minWidth: 45,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 90,
                minWidth: 10,
              ),
              child: redBox,
            ),
          ),
          Text('UnconstrainedBox 让子元素不受父元素的限制'),
          Text('下面的代码如果去掉 UnconstrainedBox 会继承最外层的宽高(增大一倍)'),
          Text('unconstrainedBox并不是真的把父元素限制去掉了,而是让父元素的限制不影响子元素的布局'),
          Text('所以,加上UnconstrainedBox  盒子宽高再加上边距依然是最外层的限制'),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 50, minHeight: 100),
            child: UnconstrainedBox(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 50, minWidth: 25),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Container(
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
