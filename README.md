
#### 这是我的第一个flutter项目,我想通过项目实战来学习这一门技术,资料的地址(https://book.flutterchina.club/);
# flutter_app_vscode

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

#### 3/11
(https://flutterchina.club/setup-windows/)
- 下载安装flutter, android studio,
- 配置插件
- 在 android studio 和 vscode 分别使用flutter创建一个空项目
1. 
使用镜像:(添加用户环境变量,flutter官方为中国开启的临时镜像,写在电脑的:系统属性>高级>用户环境变量里面)
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

#### 3/12
- 简单学习dart语言
> 声明变量
> 函数
> 异步
- 以上全部只是看了一遍

#### 3/13
- dart 官网 教程一个简单的dart程序

#### 3/14
- 小目标，先把dart的语法接着看一部份（生成一次commit）

#### 3/15
- (昨天没看,今天多看些!!!)
- 异步

#### 3/16
- 看书
- dart 和java 和 js
> JavaScript无疑是动态化支持最好的脚本语言
> Dart既能进行服务端脚本、APP开发、web开发
- 开始flutter计数器(创建flutter项目时默认的一个组件)
> 看动代码

#### 3/17
- 计数器(看懂代码)
> 简单理解
- 路由

#### 3/18
- 实现路由传参
> 目前还没完全看懂

#### 3/19
- yaml (的简单了解)

#### 3/20
- route完善
- 路由传值
> mainResolve 引入routerTestRoute widget,
> push 到 tipRoute (携带test参数)
> tip返回routerTestRoute 携带 参数 (如果点击tip的左上角返回按钮返回,则会返回null)
> 上面是非命名路由,
- 命名路由
> 路由表:注册路由(起名字)
> `Map<String, WidgetBuilder> routes`
> map数据
> key是string类型, 表示路由名称
> widgetBuilder是路由的回调函数
> 注册路由表
> MyApp类中添加routes属性
``` 
routes: {
  "new_page": (content) => NewRoute()
}
```
> 表示首页home 的路由
`"/": (context) => MyHomePage(title: 'flutter Demo Home Page')`
> 通过命名路由打开新页面
> 方法 Navigator.pushName
`Future pushNamed(BuildContext context, String routeName,{Object arguments})`
> 命名路由传参
> 通过settings对象注册参数
```
(context) {
  return TipRoute(text: ModalRoute.of(context).settings.arguments);
}
```
> 也可以通过settings对象获取参数(原本是)
`var args=ModalRoute.of(context).settings.arguments;`
> 路由钩子
> onGenerateRoute : 
> MaterailApp的属性 ,和routes同级
> 在routes中没有注册,但被navigator.pushNamed调用时会触发
> 

#### 3/22
- 接着包管理资料
> pub仓库实例  添加 english_words 包
> 把english_words  添加到依赖包管理列表
1. 修改yaml
```
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^0.1.0
  # 新添加的依赖
  english_words: ^3.1.3
```
2. 控制台: flutter packages get
> 如果在 android studio 编辑器,可以单继yaml右上角的package get,获取最新依赖
> 如果在 vs,yaml修改后自动更新
3. 页面引入
> `import 'package:english_words/english_words.dart';`
4. 页面中创建组件并使用
> ` new WordPair.random().toString()` 
> 返回一个随机字符串

#### 3/23
- 依赖本地包
```
dependencies:
	pkg1:
        path: ../../code/pkg1
```
- 依赖git(包位于Git存储库的根目录中)
```
dependencies:
  pkg1:
    git:
      url: git://github.com/xxx/pkg1.git
```
#### 3/24
- assets
> flutte 分为 code 和 assets 两部分
- 通过yaml配置flutter assets
```
flutter: 
  assets:
    - assets/my_icon.png
    - assets/background.png
```
- variant
> asset 变体
> flutter 的 assets 在构建过程中
> 会在相邻子目录中查找具有相同名称的任何文件
> 例入: 配置`assets/background.png`,构建时也会包含`assets/dark/background.png`

#### 3/27
- 目前看variant 貌似没什么用(将来有用)
- 加载 assets
> 主流两种方法加载assets(文字和图片)
> > 1 rootBundle 对象, 每一个flutter 都有一个rootBundle对象,可以获取主资源包.
`package:flutter/services.dart`
> > 当前方法会暴露一个rootBundle对象
> > 2 DefaultAssetsBundle 对象, 通过它获取AssetsBundle
> > 推荐第二种(好像是有响应关系的)
> 常见用法
> > 在组件运行上下文中使用 `DefaultAssetBundle.of()`间接加载assets
> > 在组件上下文之外使用rootBundle
> 加载图片
> > AssetImage 
> > 可以根据设备像素比例引入对应的图片尺寸
> > (满足上述条件: 目录配置倍数分辨率图片)
> > 1 
```
 new DecorationImage(
    image: new AssetImage('xxx.png'),
  ),
```
返回一个ImageProvider不是widget,所以用DecorationImage
> > 2 `Image.asset('xxx.png')`,返回的是一个图片widget
> 其他
> >　依赖包的资源　（给AssetImage配置package参数)
> > > 注意：包在使用本身的资源时也应该加上package参数来获取。
> 加载非flutter应用资源(上面的都是flutter启动后才能用)
> >　举例：　app图标,app启动图
> > 设置APP图标
> > > [Android开发人员指南](https://developer.android.com/guide/practices/ui_guidelines/icon_design_launcher.html#size)
- 调试(总算该看点能看懂的了)
> dart 分析器
> > `flutter analyze`, 一个静态代码检查工具, 测试你的代码, (intellij 会自动启用)
> > 不知道vs 现在这个插件有没有analyze检测
> dart Observatory 单步调试和分析器
> > 需要配置
> debugger() 声明
> > 使用上面的调试工具,代码里面写这个就可以插入断点,
> > 需要先引入`import 'dart: developer';`
> > 设置条件断点 `debugger(when: offset > 30.0);`
> 还有:  print, debugPrint, flutter logs, 调试动画,调试性能, 
> > debugPrint: 把当前组件状态转存dump(debugDumpApp: 转存widget树的状态)

> 异常捕捉
> > 捕捉之前先看dart的运行机制
![dart运行]](https://book.flutterchina.club/assets/img/2-12.eb7484c9.png)
> > > app执行 先执行microtask(微任务),在执行event (事件队列)
> > > (flutter 可以通过Future.microtask(…)向微任务中添加事件)
> > > 在事件循环中，当某个任务发生异常并没有被捕获时，程序并不会退出，而直接导致的结果是当前任务的后续代码就不会被执行了，也就是说一个任务中的异常是不会影响其它任务执行的。
> > flutter 框架捕捉错误方法
> > > try catch finally
> > > flutter 默认
```
catch (e, stack) {
  // 有异常时则弹出错误提示  
  built = ErrorWidget.builder(_debugReportException('building $this', e, stack));
}
```
> > > 自定义捕捉错误
```
FlutterError.onError = (FlutterErrorDetails details) {
  reportError(details);
};
```
> > flutter 框架不捕捉的错误处理(空对象异常,flutter执行异常)
> > > 同步
> > > 通过try
> > > 异步
> > > runZoned
> > > 理解: 类似沙箱, 影响降低
> > 下面是组件
#### 3/28
周日了，加了一个学flutter的新手，已经关注 名字叫 toknowmore

#### 3/29
- 组件
- widget
> 不是页面展示的组件, 是一个配置数据
> > 1 屏幕显示的是 类 `element`. widget树生成element树(广义:widget树 是 ui树)
> > 2 一个widget可以对应  个element
> widget 抽象类
> > 继承`DiagnosticableTree` 用来 提供调试信息
> > key,性能优化(是否复用组件,canUpdate方法用来判断)
> > createElement()
> statelessWidget 继承widget
> > widget的构造函数参数应使用命名参数，命名参数中的必要参数要添加@required标注，这样有利于静态代码分析器进行检查
> > context : build方法有一个context参数，它是BuildContext类的一个实例,表示当前widget在widget树中的上下文
> StatefulWidget 继承 widget
> > 重写了父类的createElement()方法
> > 添加新的方法,createState()
> statefullWidget对应一个state类
> > widget构建时可以同步获取
> > 在widget生命周期中可以改变,并调用setState() 通知框架重新执行build
> > 属性1widget:表示与该state绑定的widget,属性2context:同statelessWidget的context
> 写一个组件,研究state声明周期
> > `CounterWidget`

#### 3/31
- 复习state声明周期
- widget获取state对象
> 通过context获取
```
  // 查找父级最近的Scaffold对应的ScaffoldState对象
  ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
  //调用ScaffoldState的showSnackBar来弹出SnackBar
  _state.showSnackBar(
    SnackBar(
      content: Text("我是SnackBar"),
    ),
  );
```
> 通过of直接获取
```
// 直接通过of静态方法来获取ScaffoldState 
ScaffoldState _state=Scaffold.of(context); 
```
> 通过GlobalKey
```
//定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
static GlobalKey<ScaffoldState> _globalKey= GlobalKey();
```

#### 3/32
- 操作: 在widget中获取state
> 看不懂Builder
> 点击时,showSnackBar会弹出一个窗口显示文字
> 通过of
> > 提供of方法表示表示可以通过of获取(scaffold组件默认提供了of)
> > 没有提供of方法表示没有不可以返回父级state

- flutter 内置组件库
> Text, 带样式的文本 
> Row, Coulmn, 类似web中的flexbox布局
> Stack, 取代线性布局: 类似与web中的绝对定位盒子(配合Positioned)
> Container, 矩形视觉元素: 可以装饰一个BoxDecoration(如背景,边框,阴影),也可以设置margin,padding 

- widget组件库(Material和Cupertino)
> 1 内部都引入flutter/widgets.dart,所以使用这俩组件时,不需在引入
> 2 不同域web开发,不需要担心引入两个组件库,导致安装包变大,dart只会编译你使用了哪些代码

#### 4/2
- 同react和vue 的状态管理
> 1 如果是用户数据,由父组件管理 (选中状态,滑块位置)
> 2 如果是外观数据,由当前组件管理 (颜色,动画)
> 3 如果出现不同组件使用同一数据, 由他俩的父元素管理
- 简单组件 `TapboxAState`
> 自己管理自己状态的组件

#### 4/3
- 父管子组件 `ParentWidget`
> 组件名字都得是驼峰,首字母都得大写
- 父子分别管组件 `ParentWidgetC`
> flutter DouBan : 学习他的lib文件结构
> 创建文件夹划分模块(状态管理:`statusManagement`)
> > import 语法中的 `package: + 项目名称` 表示lib文件夹下
> > (项目名称在pubspec文件)
> 发现了:　dart语言中的`()`,可以写属性
> > `Container( child: new Text('...tip...'),)`
> > decoration,用来写样式的 , 赋值 用 new BoxDecoration

#### 4/4
- 先把状态组件放在一块

#### 4/5
> > 需要安装Android 4.1（API level 16）或更高版本的Android设备
> > 在您的设备上启用 开发人员选项 和 USB调试 。详细说明可在Android文档中找到。
> > 使用USB将手机插入电脑。如果您的设备出现提示，请授权您的计算机访问您的设备。
> > 在终端中，运行 flutter devices 命令以验证Flutter识别您连接的Android设备。
> > 运行启动您的应用程序 flutter run。

#### 4/6
- 看了一篇文，
- 原生的还是原生的，但是学起来是有难度的，
- flutter 相当于js的vue， 扩展，
- ---
- 我本来对它很有期待，
- 现在有一点怀疑了。
- ---
- 会用对我来说应该更加重要

#### 4/7
- 我为了准备面试，学了目前能学到的所有东西

#### 4/9 看文档
通过全局状态管理器, 处理相距较远的组件通信
1 全局事件总线, app组件的initState方法中订阅语言改变的事件
2 使用状态管理包, Provider,Redux

#### 4/14
由于基础的git操作失误,错失了这几天的commit日志,虽然,没改啥.
基础还是有点差劲

#### 4/16
ssi: 服务器端渲染,
可以选择reactssi框架,搭建项目

#### 4/18
一个作业帮的小哥，93年，4年前端，20k以上，年轻，帅气，又是一个比我厉害的人
理论：每天早上一小时，写flutter或者react 

#### 4/19
- 基础组件Text

#### 4/20
- 基础组件Text (2)
> TextSpan
- 文字算是看完了,最后的引入文字文件不是很理解,其他的应该问题不大

#### 4/24
- 基础组件 按钮
- 昨天的字体引入有问题: 导致无法运行程序
> 字体先不管,提交了一个issue继续写按钮的

#### 4/25
- 图片和icon
> ImageProvider 是一个抽象类,
> 就是定义了图片获取接口(load)
> image
> >　包括
> > AssetsImage: 定义从assets加载图片
> > NetworkImage: 定义从network加载图片
> > 使用image的属性
> > `SingleChildScrollView`,这玩意可以实现滚动
> > `EdgeInsets`,`SizedBox`,`BoxFit`, 这些widget相当于见过了
> 对 child 使用 .map 和 toList 也是见过了(就是把数组里面的每一个部件进行过滤和加工处理)
> > 类型判断`A is B`
> > 注意:
> > flutter 缓存图片数量最大1000,图片内存最大100m
> icon
> >　[查看所有的icons](https://material.io/tools/icons/)
> > 使用map的时候的问题(baseWidgetImg的49行注释)

#### 4/26
> icon
> > 使用meaterialIcons
> > `MainAxisAlignment`
> > 使用引入字体(ttf格式)
> > 无法引入字体文件并使用(原因是因为,修改了pubspec文件需要重新启动项目,而且控制台已经报错了)

#### 4/27
> 表单中switch和checkbox
> > Switch 和 Checkbox 都继承StatefulWidget,但是他们本身不会保存状态,父级来管理
> > `No Material widget found Switch widgets require a Material widget ancestor`使用switch需要再material的scaffold组件下使用
> 下一个,表单的控制焦点

#### 4/29
> 表单: 空值焦点
> > FocusNode 和 FocusScopeNode来控制焦点
> > `autofocus: true`, 一个页面中同时两个默认获取焦点,第一个获取到
> > `FocusNode.unfocus`: 失去焦点
> > `FocusScope.of(context)` 来获取Widget树中默认的FocusScopeNode
> 主题色: 按钮和输入框的默认颜色就是主题色中的hintColor

#### 4/30
> 继续按钮
> > 昨天　的　Theme　是个组件．．．理解上还有点问题
> > theme 将主题应用于字类
> >　1 描述排版, 颜色
> >　2 全局theme,MaterialApp 创建(可以局部使用)
> > ***问题:　如何实现表单域的滚动效果***
> > 没有解决这个问题
> 往下 form

#### 5/1 (劳动节)
- form
> > `Expanded`, 类似于column,row,flex 用来展示多个组件集合的组件
> > > 封装Spacer组件(根据指定比例占位)
```
  Spacer(
    flex: 1,
  ),
```
```
class Spacer extends StatelessWidget {
  const Spacer({Key key, this.flex = 1})
    : assert(flex != null),
      assert(flex > 0),
      super(key: key);
  
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: const SizedBox.shrink(),
    );
  }
}
```
> > ***问题: 不知道为什么按钮沾满了个剩余高度.***
> > 理解`使用 Builder`: 使用builder的目的是改变当前context.(初步理解)
- 进度指示器

#### 5/2
- 布局
> > flutter布局简介
> >　根据是否包含字节点把widget分成了三类(布局类组件都是有子组件的)
> >　LeafRenderObjectWidget,SingleChildRenderObjectWidget,MultiChildRenderObjectWidget
> > 1 布局类组件就是直接或间接包含MultiChildRenderObjectWidget的widget
> > 2 一般都有children用域接受widget
> > 3 继承关系: widget > RenderObjectWidget > (上面三类)
> > RenderObjectWidget 定义了创建更新 RenderObject的方法
- 线性布局: row 和 column

#### 5/3
- 接着说线性布局
> > row , column
> > ***问题: 使用column嵌套子级 时会默认沾满高度,但是我的没有,***
> > 如果column嵌套column ,并且想让子级column高度占满column使用Expanded组件
- 下面时弹性布局
> > flex , Expanded
> > `因为Row和Column都继承自Flex`
> > `Spacer创建一个可调整的空间隔，可用于调整Flex容器（如行或列）中窗口小部件之间的间距。(包装好的Expanded)`
> > 和示例有点差别

#### 5/4
- 流式布局(超出)
> > `Wrap`
> > 除了超出显示范围 Wrap会折行以外,其他行为基本相同
> > *runAlignment不知道效果*
> > `Flow`
> > 自定义布局和性能要求高的情况(性能好,灵活)
> > 比wrap复杂,必须指定父组件大小.

#### 5/5
- 层叠布局
> > `stack positioned`
> > 相当于position: relative和position: absolute
- 对齐,align
> > `FlutterLogo`
> > `Alingnment`
> > 1 布局时: Alingnment 会以矩形的中心点作为坐标原点,
> > 理解: 数值 和 静态常量得写法
> > > `Alignment(-1.0, -1.0)` = `Alignment.topLeft` 表示左顶点,
> > > `Alignment(1.0, -1.0)` = `Alignment.topRight` 表示右顶点
> > 2 坐标转换公式 布局
> > `(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)`
> > >　上面得 `childWidth　childHeight` 表示子元素宽高
> > > 上面两个式子算出来的时子元素实际偏移量(相对于左上角)
> > `FractionalOffset`
> > 这个和alignment一样都是用来定位的,区别在于: 他是用左上角来定位(和web一样)
> > 坐标转换公式: `(FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)`
- 对比(align和stack)
1. 定位参考体系不同
2. Stack可以有多个子元素
3. (相当于web里面的 text-align和position 的区别)
- `Center`组件
> > 继承了`Align` 对齐方式确定（Alignment.center）
> > `DecoratedBox`: 可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等

#### 5/6
- 容器类组件(竟然还挺快的)
> > `padding`
> > 尺寸限制类组件
> > > `ConstrainedBox、SizedBox、UnconstrainedBox、AspectRatio`

#### 5/7
- 容器组件
> > `SizeBox`
> > 多个父元素尺寸限制
> > `UnconstrainedBox`


#### 5/8
- 装饰组件
> > `DecoratedBox`
```
decoration: BoxDecoration(
  Color color, //颜色
  DecorationImage image,//图片
  BoxBorder border, //边框
  BorderRadiusGeometry borderRadius, //圆角
  List<BoxShadow> boxShadow, //阴影,可以指定多个
  Gradient gradient, //渐变
  BlendMode backgroundBlendMode, //背景混合模式
  BoxShape shape = BoxShape.rectangle, //形状
)
```
> > `LinearGradient` 用域定义线性渐变的类(还有其他定义渐变的类)
- 变换组件
> > `transForm`

#### 5/9
- `RotatendBox`
- `Container`
> > 本身不具备RendeObject,
> > 可以装饰变化限制
> > 因为: 他集合了很多其他组件功能: decoratedBox,constrainedBox,trnasform,padding,align
> > 设置宽高: constraints 或者 width/height, 后者优先
> > 设置背景: color 和 decoration,(只能设置一个)
- ***Flutter Gallery是Flutter官方提供的Flutter Demo，源码位于flutter源码中的examples目录下，笔者强烈建议用户将Flutter Gallery示例跑起来，它是一个很全面的Flutter示例应用，是非常好的参考Demo，也是笔者学习Flutter的第一手资料。***
> > `Could not find a command named "channer".
> > flutter多写一个t
> > > Setting "enable-windows-desktop" value to "true".
> > > 
> > > You may need to restart any open editors for them to read new settings.
***控制台报错: Unexpected child "deferred-components" found under "flutter".***

#### 5/10
- github user 1: Jun Shi Yan
- github user 1: 李泽鹏

```
@DhavalRKansara Your Flutter is on the stable channel. As mentioned previously, the gallery runs off the master channel, to which you can switch with

flutter channel master
flutter upgrade
```

#### 5/11
- gallery
> > 无法执行
> > 命令: `flutter channel`	列表或开关Flutter通道。
> > 命令: `flutter create .`	创建一个新的Flutter项目。
> > 命令: `flutter upgrade`	升级你的Flutter副本。
> 重新执行master 和 upgrade,执行`flutter upgrade` 自动执行一次`flutter doctor`,出现错误:  **Please install the "Desktop development with C++" workload, including all of its default components**
> 下面是根据博客上的文章执行的: 安装`visual studio` (它和vscode的区分查看: https://www.zhihu.com/question/384334551)
1. 打开网站下载
2. 打开安装包,点确认
3. 点击添加负荷
4. 选中:` "Desktop development with C++"`
5. 选中: `Windows 10 SDK (10.0.17763.0)`(Windows 10 SDK (10.0.17763.0) ，需要下载的是10.0.17763.0这个版本的)
6. 选择下载路径,点击安装
7. 执行flutter doctor
> > ***这个问题和昨天的问题有关联,具体内容查看(https://zhuanlan.zhihu.com/p/91686888)***


#### 5/12
- gallery
- 首先重新执行 `flutter doctor`
> 其他: 如何查看flutter 版本并切换1 `查看flutter --version` 2 `flutter versioin` 3 `flutter versioin vxxx`(版本号)
- 然后执行 `flutter channel stable`
- 然后执行 `flutter upgrade `
> 报错 ***unable to access 'https://github.com/flutter/flutter.git/'***
> 应该是网络问题导致的,重新来一次(如果不行就配置代理,这个回头在学)
- 然后`to run the app on Windows:`,执行: `flutter config --enable-windows-desktop`
- 然后执行`flutter create .`
> 报错: 还是`Unexpected child "deferred-components" found under "flutter"`(也就是说,我通过下载安装上面c++那个软件并没有用 或者 我使用错误)
> 没有解决, 忽略直接run(还是报错)
> 晚上看
> 答案就放在那,我解决不了问题(问)
> 问群里
```
如果你的电脑没有在开发者模式，使用插件会出错。 你可以在设置-->更新和安全-->开发者选项里设置

Building with plugins requires symlink support. Please enable Developer Mode in your system settings
```
- 重新 clone
- 失败
- 决定随缘,不写了

#### 5/13
- marterial 
> > 组件名称:	解释
> > AppBar:	一个导航栏骨架
> > MyDrawer:	抽屉菜单
> > BottomNavigationBar:	底部导航栏
> > FloatingActionButton:	漂浮按钮

(看react native 官网)
(
  1. 文档的交互示例,组件类型(函数和class),提示
  2. 核心组件和原生组件(该看这个了)
  3. 
)

#### 5/14
- `Tab`
```
Tab({
  Key key,
  this.text, // 菜单文本
  this.icon, // 菜单图标
  this.child, // 自定义组件样式
})
```
> > 使用任何图片都需要在yaml文件先引入

#### 5/15
- 解决了浮动按钮,嵌到底部的问题
- 裁剪
```
剪裁Widget	作用
  ClipOval  子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
  ClipRRect  将子组件剪裁为圆角矩形
  ClipRect  剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
```
> 'CustomClipper' 'clip'

#### 5/15
1. react 能干什么：
  用js访问移动平台的api
  实现外观和行为，通过react ui 组件
2. 基本概念
  a. 视图： react ui的最小组成部分， 相当于flutter的widget，或者html的标签
  b. 原生组件：react native 编写的应用和原生的一样，实质是对系统原生组件的封装（react native会把组件自动转换为系统的原生组件）（系统的原生组件：android的Kotlin或java编写视图，ios的swift或objective-c编写视图）。
  c. 核心组件：基础/常用的原生组件。
3. 和react一样的api
  react components > react native components > core/native/community(第三方组件)
  所以，接下来就是react的基础（组件，jsx，自定义组件，prop，state）
  另外：jsx中传递一个 JS 对象值的时候，就必须用到两层括号：{{width: 200, height: 200}}。
  另外：React.Fragment是抽象类，相当于小程序的block，写法`<> </>``<React.Fragment key={item.id}></React.Fragment>`
***暂停，使用检视阅读先读一次***
-检视阅读开始
1：跳过不过的 2：重点看主要的
a. 环境 ：译注：请注意！！！国内用户必须必须必须有稳定的代理软件，否则在下载、安装、配置过程中会不断遭遇链接超时或断开，无法进行开发工作。某些代理软件可能只提供浏览器的代理功能，或只针对特定网站代理等等，请自行研究配置或更换其他软件。总之如果报错中出现有网址，那么 99% 就是无法正常连接网络。
全部看标题看了一遍，感觉，把这个看完，了解了react native 开发之前的所有理论知识，除了配置环境的时候可以实际操作一下，大部分都是需要自己理解的。不过，看完知道了这是一个大的领域，蛋蛋android和ios就是两个完全不同的世界。目前看来，会比flutter更好开发一些，但是我看的官网，所以理解起来可能不像实战书那么熟。决定还是先看文档。


#### 5/18
- 可滚动组件
> > 默认超出会报错
> > 可滚动组件直接或间接包含一个scrollable组件
> > `scrollable`
> > > axisDirection属性:滚动方向
> > > physics属性:决定响应用户操作方式，接受scrollPhysics类型对象(包括ClampingScrollPhysics,和,bouncingScrollPhysics)
> > > controller: 控制位置和监听事件,接受ScrollController类型对象
> > `scrollbar`
> > > 给可滚动组件加滚动条
> > > 会在ios平台自动切换成`CupertinoScrollbar`(ios滚动条风格)
> > `sliver`
> > > 只构建出现在当前视口的子组件一种性能优化(视口: ViewProt,当前widget的实际显示区域)
> > > `SingleChildScrollView`不支持sliver
- `singleChildScrollView`

- react native: 入门组件
> `TextInput`
> > 注意 react 中的 onChange 对应的是 rn 中的 onChangeText
> > 具有“动态状态”的最简单的组件
> `ScrollView`
> > 所有组件都会被渲染,不进行sliver,不适合长列表
> > 再android和ios都有个子的区别
> `flatList`
> > 长列表: 立即渲染所有元素，而是优先渲染屏幕上可见的元素
> `secionList`
> > 长列表: 需要分组的数据

- react native: 针对不同平台的处理
> 方法一: `Platform`模块
**适用于平常代码中解决不同平台的少量代码冲突**
> > `Platform.OS`返回ios或这android
```
import { Platform, StyleSheet } from 'react-native';
const styles = StyleSheet.create({
  height: Platform.OS === 'ios' ? 200 : 100
});
```
> > `Platform.Select()`直接返回设定的value值
```
import { Platform, StyleSheet } from 'react-native'
const styles = StyleSheet.create({
  container: {
    flex: 1,
    ...Platform.select({
      ios: {
        backgroundColor: 'red'
      },
      android: {
        backgroundColor: 'blue
      }
    })
  }
})
```
*接受任何合法类型的参数,包括组件*
> > `Platform.Version`, 返回android和ios的当前版本
> > > 在 Android 上，Version属性是一个数字
> > > 在 iOS 上,返回当前系统版本的字符串,比如可能是"10.3"。

> 方法二: 特定平台扩展名
**适用于:不同平台代码放在不同的文件里时**
> > 目录下有俩文件
```
BigButton.ios.js
BigButton.andorid.js
```
> > 引入时会根据不同平台引入对应的后缀
```
import BigButton from './BigButton';
```
***明天就是环境搭建***

#### 5/19
***23:00***
在家没法运行flutter，
先把native看一遍（环境配置）
- 明确环境
1. 区分开发平台
2. 区分目标平台（在哪个平台使用）
**想从一个平台转移另一个平台，查看官方进行对应的环境搭建就好（部分区别）**

- 明确依赖
1. node，JDK，android studio
(android studio 是一个编译器，开发android应用的。开发时需要使用他提供的工具和环境)
（node版本大于12）
（JDK 是对java基础环境和相应开发平台标准和工具包的封装，安装版本必须是1.8,也称8版本）

***不能使用淘宝镜像（cnpm）***

（yarn是脸书替代npm的工具，可以加速node的下载，官方推荐使用yarn代替npm）

#### 5/20
- (工作上使用taro  又熟练了一波)
- 开始搭建rn环境
- 本机已经安装android studio,(然后跟着官网走)
- 以下是`Android 开发环境`
1. 安装 Android Studio(注意 安装 Android sdk, Android sdk platform, Android virtual device)
2. 安装 Android SDK (找官网,再配置中找到并且安装指定版本)
3. 配置 ANDROID_HOME 环境变量
4. 把一些工具目录添加到环境变量 Path
- 以下开始创建项目
1. `npx react-native init AwesomeTSProject --template react-native-template-typescript`使用ts模板创建rn项目
(如果没有安装 react-native 会先安装这个)
2. 接下来就是在 `react native` 的项目里面操作

#### 5/24
- 继续flutter组件学习
- `ListView`
- ListView 的 `默认构造函数`
> 指的是直接使用`ListView({children: list})`
> 通过这样的方式  list 中的所有widget都会提前全部渲染,(也就是不支持sliver)
- ListView 的 builder
> > > 滚动组件普遍规律: 构造函数构建的可滚动组件通常就是支持基于Sliver的懒加载模型的，反之则不支持
- ListView 的 `separated`
> separated和builder的区别就是,多了个`separatorBuilder`,根据条件控制列表的每一项
***问题: 无法使用word_pair构造出组件,baseScroll4无法渲染***

#### 5/27
- 上次报错原因: `listTile`必须包在`material`组件下
> 学习上拉组件
1. `initState`
> > 使用主题颜色借鉴: `Theme.of(context).primaryColor`
> > 为什么叫做状态: 针对于组件,组件的当前的状态就是组件的state
> > 不使用箭头函数的stateFulWidget的createState方法
```
@override
State<StatefulWidget> createState() {
  return ScrollHomePageState();
}
```
> > 找到了
> > > initState() 方法是在创建 State 对象后要调用的第一个方法，常常用做于初始化一些数据
> > 有点像钩子函数,类似的方法还有:didChangeDependencies() (initState() 方法执行完毕后执行的第二个方法)
> > Widget: 部件, context: 当前Widget创建的element对象, state: element的状态
2. 下次接着看吧(先看懂再说)

#### 5/29
- 只想更新应用依赖的包(`pubspec.yaml` 中的依赖)
> `flutter packages get` 或者 `flutter pub get`
- 如果想看命令行命令, 输入 xxx -h 自己就可以看到
> 实验 `flutter run`
> > 执行后会有选择执行环境,然后会自动拉起设备
> > 好处: 1 看到了命令
> > > 应该和vscode启动的顶部菜单是一致的功能
> > 坏处: 好像vs code 并没有打开 app运行的状态(底部的黄条,以及 顶部的功能菜单)
> > 坏处: 无法自动更新
- `f1` 
> 看到常用的flutter命令
> 输入`launch emulator`比较设备
- 继续学习无限滚动组件
> `Divider`
> > 分割线组件
> `Future.delayed(Duration(seconds: 2))`
> > 相当于web里面的`setTimeout`
> `generateWordPairs` 
> >　english_words中的一个方法
> >　用来模拟数据
> `CircularProgressIndicator`
> > 之前写过,是一个圆形进度条.可以用来做加载中的 icon
- 滚动组件 添加固定表头
> **使用文档中的内容,控制台会报错,原因不详(并且会打开一个文件)**
> > 可能原因: 外层嵌套了`Column`所以会报错,直接放在`scaffold`的body没有报错
> > 应该是因为我复制错了代码,文档中也说会出错,需要设置
> 复制文档中的实例实现了顶部固定,底部滚动的效果
> > 实现原理是,`Expanded`和`Column`(解决了适配不同屏幕的效果)
> > 也可以公国material中的`sizeBox`来对高度进行计算,保证高度适配(没有第一个方法好)

#### 5/30
- `GridView`
> 和listview大部分参数一样
> 唯一需要关注的参数gridDelegate(设置子组件如何排列)
> > 值为: `SliverGridDelegate`类,flutter提供了两个子类,
> > `SliverGridDelegateWithFixedCrossAxisCount`和`SliverGridDelegateWithMaxCrossAxisExtent`
> `GridView.count`可以用来替换GridView+SliverGridDelegateWithFixedCrossAxisCount的情况
> `GridView.extent`可以用来替换GridView+SliverGridDelegateWithMaxCrossAxisExtent的情况
> `GridView.builder`用来显示异步的子项情况,或子项较多的时候

#### 6/2
- 证实,无法再Column中使用gridview
- `GridView.Builder`的示例
1.  接受两个参数 
> > `gridDelegate` 和 `itemBuilder`
- `CustomScrollView`自定义滚动组件
1. 滚动模型
> > Sliver版的可滚动组件,不包含滚动模型
> > 非Sliver版的可滚动组件,包含滚动模型
2. `Material`也是一个widget,可以作为根组件返回
> > 属性 `child`
3. `CustomScrollView`
> `slivers`属性,设置一个数组
**CustomScrollView的子组件必须都是Sliver。**
> > `SliverAppBar`相当于`AppBar`,前者可以集成到`CustomScrollView`(实现头部伸缩的效果)
> > `SliverPadding`sliver 增加padding
> > `SliverGrid`组件网格
> > `SliverFixedExtentList` 组件列表

#### 6/3
- 学习`CustomScrollView`组件
1. `Image.asset`的 fit属性,指定图片在容器的分配方式,值为`BoxFit`
> > `BoxFit` 常见的有: scaleDown,contain,cover
2. `SliverGrid` 构建一个网格组列表
> > 属性`gridDelegate` 和`GridDelegate`一样
> > 属性`delegate` 设置每一个子项的widget,参数(值为`SliverChildBuilderDelegate`)
3. `SliverFixedExtentList` 构建一个列表(值为`SliverChildBuilderDelegate`)
- scroll 监听
1. `ScrollController`
> `offset`可滚动组件当前位置
> `jumpTo``animateTo`两个方法跳转指定位置
2. `ScrollController`间接继承自`Listenable`
> 也就是说可以使用`assListener`方法
> 示例
> > 为了避免内存泄露，需要调用_controller.dispose
> > `super.dispose` 放在最后调用
```
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

#### 6/5
- 滚动页面位置恢复
1. `PageStorage`
> > 用来保存页面相关数据的组件
> > 里面的widget  可以通过指定不同的`pageStorageKey`来存储各自的数据和状态
> > > 每次滚动结束,都会把`offset`存储在`PageStorage`中
> > > 重新创建时恢复`offset`
> > > 判断`keepScrollOffset`的值,有救使用,没有就用`initialScrollOffset`
2. `ScrollPosition`
> 用来保存可滚动组件的滚动位置
> animateTo() 和 jumpTo() 用来控制跳转位置的方法
> 执行过程
> > 先会调用ScrollController
> > (“注册位置”)可滚动组件会调用attach()方法
> 组件销毁时
> > 会调用ScrollController的detach()方法
> > 将其ScrollPosition对象从ScrollController的positions属性中移除
3. `NotificationListener`
> 可以用来监听（类似冒泡）
> > 和`scrollController`的区别
> > controller 只能监听关联的组件,notification 可以让所有父级醉驾案监听
> >　controller 只能获取当前滚动位置信息, notification 可以额外获取viewPort的一些信息
> 示例
> 学习示例内容
> 太困了,学了一半

#### 6/6
- `ScrollNotification` 类
1. `metrics` 属性, 值为 `SrollMetrics`(包含当前ViewPort的滚动位置等信息)
> >　理解 ViewPort的含义,当前设备可视窗口信息
> > 包括
> > > `pixels`: 当前滚动位置,
> > > `maxScrollExtent`: 最大可滚动长度,
> > > `extentBefore`: 划出ViewPort的顶部的长度(划出屏幕上方的列表长度),
> > > `extentInside`: ViewPort内部长度(屏幕中显示的列表长度),
> > > `extentAfter`: 没有滑入ViewPort部分的长度(列表底部没显示区域的长度),
> > > `atEdge`: 是否滚动到了边界(顶部或者底部)
***目前问题很多,一个滚动没有想到会有那么多不懂得地方,感觉有点复杂,现在调整一下心态.现在得主要目的是了解,识别.所以示例明白怎么写的就好,不看和官方文档以外得部分***
- 功能性组件
- 导航返回拦截
1. `WillPopScope`
> 使用场景: 防误触判断,eg:用户在某一个时间段内点击两次时，才会认为用户是要退出
> 属性
> > onWillPop: 回调函数,返回一个Futrue对象,如果futrue最终值是false,则不出栈(不返回)
> 示例
> 返回时有打印,但是没有返回上个页面,原因不详

#### 6/7  
***开始早上来了,先学习,在游戏得习惯***
- 数据共享(类似stare,redux)
1. 能实现组件跨级传递数据
2. `InheritedWidget` 父组件传递子组件, `Notification` 子组件传递父组件
3. `didChangeDependencies` 子组件的回调, 当父组件的属性发生变化,会调用这个函数
4. 示例:
> 报错未处理(代码没有复制完)

#### 6/8
接着把示例搞定
> 搞定

#### 6/10
- 看懂,跨级传递数据(类似props)
1. ***单独拿出来会报错?***
> 自己没有写`import`
2. **RaisedButton按钮被废弃,使用`ElevatedButton`来代替**
3. `ShareDataWidget extends InheritedWidget` 
> 父组件继承`InheritedWidget`
> 父组件必须定义`updateShouldNotify`决定是否更新状态
> 子组件要定义`didChangeDependencies`
> 子组件要定义 必须使用 父组件 中的共享数据 访问:`ShareDataWidget.of(context)`
- 场景2: 父组件数据改变,触发子组件build, 不触发 `didChangeDependencies`
1. 父组件 `getElementForInheritedWidgetOfExactType`
> > `dependOnInheritedWidgetOfExactType`注册了依赖关系,`getElementForInheritedWidgetOfExactType`不会
- 重点预告
> > 现在只要调用_InheritedWidgetTestRouteState的setState()方法，所有子节点都会被重新build，这很没必要
> > 下一节我们将通过实现一个Provider Widget 来演示如何缓存，以及如何利用InheritedWidget 来实现Flutter全局状态共享。

#### 6/11
- 跨组件共享(Provider)
1. 一般的原则是：如果状态是组件私有的，则应该由组件自己管理；如果状态要跨组件共享，则该状态应该由各个组件共同的父元素来管理
2. 使用全局事件总线EventBus(观察者模式)(类似 vue Bus)
```
enum Event{
  login,
  ... //省略其它事件
}
```
```
bus.emit(Event.login);
```
```
void onLoginChanged(e){
  //登录状态变化处理逻辑
}

@override
void initState() {
  //订阅登录状态改变事件
  bus.on(Event.login,onLogin);
  super.initState();
}

@override
void dispose() {
  //取消订阅
  bus.off(Event.login,onLogin);
  super.dispose();
}
```
> > (观察者模式)缺点：
> > 必须显式定义各种事件，不好管理
> > 订阅者必须需显式注册状态改变回调，也必须在组件销毁时手动去解绑回调以避免内存泄露。
3. 利用`InheritedWidget`自动更新子组件特性，我们可以将需要跨组件共享的状态保存在`InheritedWidget`中，然后在子组件中引用`InheritedWidget`即可，Flutter社区著名的`Provider`包正是基于这个思想实现的一套跨组件状态共享解决方案
- 示例
1. 定义一个通用的`InheritedProvider`类，它继承自`InheritedWidget`
> 问题一:通知数据变化,通过 eventBus方式,来进行事件通知
> 通过flutter 的 `ChangeNotifier`,继承`Listenable`,也可以实现(发布订阅)
```
class ChangeNotifier implements Listenable {
  List listeners=[];
  @override
  void addListener(VoidCallback listener) {
     //添加监听器
     listeners.add(listener);
  }
  @override
  void removeListener(VoidCallback listener) {
    //移除监听器
    listeners.remove(listener);
  }
  
  void notifyListeners() {
    //通知所有监听器，触发监听器回调 
    listeners.forEach((item)=>item());
  }
}
```
> 通过调用`addListener()`和`removeListener()`来添加、移除监听器（订阅者）；
> 通过调用`notifyListeners()` 可以触发所有监听器回调。
2. `ChangeNotifierProvider`
***编译报错***

#### 6/12
2. `_typeOf` 报错,原因不明,
> 重新看一次文档
> 除了 `_typeOf`其他的报错已经解决,还是因为没有理解他们之间的关系,直接自己写的有问题
3. 使用上面的方法,实现 跨组件传递
> 示例
> 目的: 显示购物车中所有商品总价
> > 1 组件 `UnmodifiableListView`
> > 一种禁止修改的ListView，比如电商app购物车里面的物品是禁止修改的。
> > 不能变更List的话，尽量使用unmodifiableListView有助提高编程习惯。
> > 2 `CartModel extends ChangeNotifier`
> > 3 `Builder` (第一次记录在 454行,这次通过老孟flutter进行理解)
```
Builder(
  builder: (BuildContext context){
    return Container();
  },
)
```
> > builder 可以更加解决scaffold的body获取不到 context的问题(扩展了context)
4. 如果我们将ChangeNotifierProvider放在整个应用的Widget树的根上，
> > 那么整个APP就可以共享购物车的数据了，这时ChangeNotifierProvider的优势将会非常明显
5. 优化1
> > 封装`Consumer`组件
> > 解决1: 依赖CartModel很多时，这样的代码将很冗余
> > 解决2: 语义将会很明确
> > > 使用`Consumer`会报错
***报错原因没有找到***
优化2
> > `listen`
> > 可以实现
> > 数据便哈按钮本身没有变化，不重新build的

#### 6/14
- 颜色和主题
1. `Color`类
> 色值转换和亮度
> 将rgba值`#xxxxxx`类型转换为 flutter 中的Color类
2. 示例,导航变色
> 知识一,
> > 创建一个类,构造函数中的对象可以添加组件调用时的参数(这个类似 react)

#### 6/15
- 回顾昨天
1. `Color` 构造函数,传入8位十六进制直接使用
2. `Color` 如果传入6位十六进制,透明度位00
3. `int.parse(_color2, radix: 16)` 可以将颜色(字符串类型)转换为数字类型
4. `0x` 开头的数字表示16进制
5. 修改透明度方法
> > `0x00FFFFFF | 0xFF000000` 把前两位替换成`FF`(透明度)
> > `Color.withAlpha` 方法,传入十进制alpha数值(相当于修改透明度) 
6. `color.computeLuminance()` 方法返回当前颜色一个亮度值(0-1之间)
- `MaterialColor`
1. 实现颜色的类: 包含一种颜色的10个级别的渐变色
2. 通过"[]"运算符的索引值来代表颜色的深度
3. MaterialColor的默认值为索引等于500的颜色(Colors.blue 相当于 设置Colors.blue[500])
- `Theme`
1. 定义主题数据
2. `ThemeData` 用于保存是Material 组件库的主题数据
> > 子组件通过Theme.of方法来获取当前的ThemeData
> > 有些是不能自定义的，如导航栏高度，ThemeData只包含了可自定义部分。
```
ThemeData({
  Brightness brightness, //深色还是浅色
  MaterialColor primarySwatch, //主题颜色样本，见下面介绍
  Color primaryColor, //主色，决定导航栏颜色
  Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。
  Color cardColor, //卡片颜色
  Color dividerColor, //分割线颜色
  ButtonThemeData buttonTheme, //按钮主题
  Color cursorColor, //输入框光标颜色
  Color dialogBackgroundColor,//对话框背景颜色
  String fontFamily, //文字字体
  TextTheme textTheme,// 字体主题，包括标题、body等文字样式
  IconThemeData iconTheme, // Icon的默认样式
  TargetPlatform platform, //指定平台，应用特定平台控件风格
  ...
})
```
3. 路由换肤示例
> > 示例完成
> > 悬浮按钮没有实现变色
4. 实例中实现了 不使用父组件的样式(第二行的黑色)

- async
1. `FutureBuilder`
```
FutureBuilder({
  this.future,
  this.initialData,
  @required this.builder,
})
```
> `future` 以来的Future,通产是一个异步操作
> `initialData` 初始数据,用户设置默认数据
> `builder` Widget构建器
> 实例, 进入页面2秒后返回一个字符串显示
> `ConnectionState`
> > 一个枚举类,四个状态
> > > none,// 当前没有异步任务，比如[FutureBuilder]的[future]为null时
> > > waiting,// 异步任务处于等待状态。
> > > active,// Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态(active只在StreamBuilder中才会出现。)
> > > done,// 异步任务已经终止.
2. `StreamBuilder`
> 接受多个异步操作结果
> 常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等


#### 6/15
- 对话框
1. `AlertDialog`
```
const AlertDialog({
  this.title, //对话框标题组件
  this.content, // 对话框内容组件
  this.actions, // 对话框操作按钮组
})
```
2. `showDialog()`
> 返回一个Future值,(点击弹窗的按钮可以设置返回值)
```
Future<T> showDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true, //点击遮罩时是否关闭它
  WidgetBuilder builder, // 对话框UI的builder(AlertDialog)
})
```
3. `SimpleDialog`
> 展示一个列表,用户选择

4. `Dialog`
> `showDialog` 和 `SimpleDialog` 的父级
> `showDialog` 和 `SimpleDialog` 都使用了 `IntrinsicWidth` 来通过子组件的实际高度调整自身尺寸,所以无法延迟加载模型
> `Dialog`可以实现延迟加载模型
> > 不是特别理解,但是可以明白他俩的区别,`dialog` 更偏向于动态的多条弹窗数据
> MySimple2
5. showDialog 方法中的builder用来返回一个弹窗,上面已经说了三种
> 可以不返回上面三个,可以返回别的.
> 实例dialog2>UnconstrainedBox

#### 6/16
- 对话框打开动画和遮罩
1. 前面说的都是material 的方法, flutter自己也有dialog方法
> `showGeneralDialog`
> `showDialog`正是基于`showGeneralDialog`的封装
> `showDialog`默认打开对话框是一个Fade的动画,我们可以自己定义`showGeneralDialog`的`showCustomDialog`方法,来设置动画
2. 实例`showCustomDialog`
> `transitionBuilder` 设置打开的动画
- 弹窗管理状态
1. 弹窗中需要通过状态动态显示数据,并且传给页面组件
```
setState(() {
  //更新复选框状态
  withTree = !withTree;
});
```
> 问题: context 不一样,
> 产生原因:
> > 1 setState方法只会针对当前context的子树重新build,对话框不是再父组件中构建的是通过showDialog单独构建的
> > 2 showDialog是通过路由创建的,修改父级的状态不会影响下一个路由
> 解决方法
> > 1 单独抽离出StatefulWidget
> > > 单独封装一个checkbox 并且继承 StatefulWidget 组件,自己修改状态
> > 2 使用StatefulBuilder方法
> > 3 精妙的解法

- 弹窗中管理状态
1. 实例1, 错误写法
> 打开弹窗,点击选中,没有效果
2. 实例2, 单独抽离checkbox
> 重新封装一层checkbox,context作为参数传进去
3. 实例3, 使用StateBuilder方法
> 使用builder 方法简化了一下2方法
4. 实例4, 最好的方法
> setData调用时,调用_element.markNeedsBuild(),页面才会重构
> > markNeedsBuild 方法标记当前element为 dirty,由此实现重构
> > 如果我们能标记为dirty,自然就能实现重构
> > context实际上就是Element对象的引用, 所以接下来

#### 6/17
- 其他对话框
1. `showModalBottomSheet`
> 底部对话框
> 实例 5
2. `showBottomSheet`
> 底部弹出整个页面的弹窗
> 实例 5
> ***PersistentBottomSheetController***
> 报错: 不知道怎么使用这个弹窗无法弹出内容,调用方法时控制台会报错
3. `Loading`
> 通过showDialog+AlertDialog来自定义
> 实例 6
> showDialog中已经给对话框设置了宽度限制,所以不能直接修改宽度
> > 先 UnconstrainedBox 抵消宽度限制
> > 再使用 SizedBox
4. 日历弹窗
> 实例6
- Pointer Event: 原始指针事件处理(触摸事件)
1. 一次完整的事件分为三个阶段
> 手指按下、手指移动、和手指抬起(高级别的手势（如点击、双击、拖动等）都是基于这些原始事件的)
2. 过程: 事件会在组件树中向上冒泡
3. Flutter中没有机制取消或停止“冒泡”过程
- `Listener`
1. 监听原始触摸事件
> 使用示例
> `PointerDownEvent` `PointerMoveEvent` `PointerUpEvent` 都是 PointerEvent 的子类
> 常用的属性有:
> > position：它是鼠标相对于当对于全局坐标的偏移。
> > delta：两次指针移动事件（PointerMoveEvent）的距离。
> > pressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1。
> > orientation：指针移动方向，是一个角度值。
2.  Listener.behavior = HitTestBehavior.deferToChild,在命中测试期间如何表现
> behavior , 值为HitTestBehavior,枚举 分别是
> > deferToChild 子组件会一个接一个的进行命中测试
> > opaque 将当前组件当成不透明处理
> > translucent 当点击组件透明区域时，可以对自身边界内及底部可视区域都进行命中测试
3. 不想让某个子树响应PointerEvent
> IgnorePointer和AbsorbPointer
```
Listener(
  child: AbsorbPointer(
    child: Listener(
      child: Container(
        color: Colors.red,
        width: 200.0,
        height: 100.0,
      ),
      onPointerDown: (event)=>print("in"),
    ),
  ),
  onPointerDown: (event)=>print("up"),
)
```
> 如果将AbsorbPointer换成IgnorePointer，那么两个都不会输出。

#### 6/18
- `behavior`
> 这个属性不是特别理解
- 手势
1. `GestureDetector`
> 实例1 点击,双击,长按
> > onTop 延迟200毫秒,如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。
> 实例2 拖动,滑动

#### 6/19
2. `GestureRecognizer`
> 是一个抽象类,一个手势的识别器对应一个GestureRecognizer的字类
> gestureDetector 内部是使用一个或多个GestureRecognizer来识别各种手势的
> 实例
3. `GestureDetector` 的 child 属性是一个widget组件,所以,如果不是widget组件,就无法使用`GestureDetector`来绑定手势事件,
> `GestureDetector`内部是使用一个或多个`GestureRecognizer`来识别各种手势的,所以,可以用`GestureRecognizer`来尝试不是widget的情况
>　实例中使用了TextSpan的 recognizer属性,可以是一个 `TapGestureRecognizer()`
> > 使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）。
- 手势竞争与冲突
1. 场景: 同时监听水平和垂直方向,斜着拖动
> 取决于第一次移动时两个轴上的位移分量
> 实例 `BothDirectionTestRoute`
> > 组件 `CircleAvatar`, `Positioned`
> > 属性 `onVerticalDragUpdate`, `onHorizontalDragUpdate`
2. 解决冲突
> 当 有一个widget 可以左右拖动，现在我们也想检测在它上面手指按下和抬起的事件
> 不能写在`GestureDetector`里面(会发现 并没有答应 down和up)
> 通过 `Listener`来见同(打印了down1和up1)
> > 手势冲突只是手势级别的，而手势是对原始指针的语义化的识别，
> > 所以在遇到复杂的冲突场景时，都可以通过Listener直接识别原始指针事件来解决冲突。

- 番外读物
0. 原生开发
> 程序稳定后的必走之路

|  优点   | 缺点  |
|  ----  | ----  |
| 速度快、性能高、稳定性强、用户体验好 | 前期开发费用高 |
| 可以访问手机所有功能 | 开发效率偏低 |
| 支持大量图形和动画 | 后期维护繁琐 |
| 可离线使用 | 上线时间无法固定 |

> 跨平台的特点

|  优点   | 缺点  |
|  ----  | ----  |
| 节省人力、开发成本 | 性能低于原生 |
| 节省开发时间 | 用户体验低于原生 |
| 多端的一致性 | 包体积变大 |
| 易上手 | 跨平台框架自身bug、缺陷 |
1. Web App 有以下缺点，使得它始终是 “主角的心，配角的命”
> a: 性能低，操作体验不好
> b: 无法调用原生 API，很多功能无法实现，
> c: 依赖于网络，网速慢时体验很差，并且没有离线功能，优化不好的话会消耗流量
> d: 只能做为一个临时的入口，用户留存率低
2. Hybrid App 采用原生和 Web 开发 App(还可以采用 HTML5 + 原生)
> 理解: 主要是用js和原生技术相互调用，可以初步实现跨平台使用的效果
> 实现: Hybrid App 的原生 UI 组件用来展示交互复杂和渲染要求高的界面，其他的可以给 HTML5 来展示。
> 适用: 对于需要快速试错、快速占领市场的团队来说，Hybrid App 是一个不错的选择
> 相关技术: Hybrid 相关的技术有很多，比如 PhoneGap、Cordova、Ionic、VasSonic 等等
3. 原生渲染
> **react native**
> 理解: 写react的代码,可以再ios和android执行
> 实现:  ios端: 在Objective-C 和 JavaScript 两端都保存了一份配置表，里面标记了所有 Objective-C 暴露给 JavaScript 的模块和方法, 当Objective-C 接收js传来的参数,调用对应的参数
> 特点:

|  优点   | 缺点  |
|  ----  | ----  |
| 复用了 React 的思想，有利于前端开发者涉足移动端。 | 做不到 Write once, Run everywhere |
| 能够利用 JavaScript 动态更新的特性，快速迭代。| 不能做到完全屏蔽 iOS 端或 Android 的细节 |
| 相比于原生平台，开发速度更快，相比于 Hybrid 框架，性能更好。| 由于 Objective-C 与 JavaScript 之间切换存在固定的时间开销，所以性能必定不及原生 |
> **weex**(阿里开发的轻量级的原生渲染解决方案,大公司的 KPI 产物)
> **uniapp**(小程序最早的开创者)
> 在2015年9月，DCloud推进微信团队开展小程序业务.微信团队经过分析，于2016年初决定上线小程序业务
> 理解: 在 App端内置了一个webview和一个基于 weex 改进的原生渲染引擎，提供了原生渲染能力。
> 用途: 
在App端：
a: 如果使用vue页面，则使用webview渲染
b: 如果使用nvue页面(native vue的缩写)，则使用原生渲染
4. 自渲染
> **flutter**
> Google 开源的 UI 工具包.支持移动、Web、桌面和嵌入式平台
> 特点1: **Dart** 语言来避免 JsBridge引起的性能问题
> 特点2: Flutter不使用OEM Widgets（或**DOM** WebViews），它提供了自己的 Widgets。
> 特点3: 高效率,开发快(模拟器运行**热重载**)
> 特点3: 高度一致,ios和android样式基本一样
5. 重点提醒: 
> 不管选择何种框架，前提还得对原生的开发环境以及开发模式有一定的了解，不然也是事倍功半。
> 并不是所有公司都能长期承担起原生App开发与维护的成本

- 事件总线
1. 跨页面事件通知(例如: 登陆时登录和注销来进行一些状态更新)
2. 实现一个简单的事件总线
> 示例: **EventBus**
3. Dart中实现单例模式的标准做法就是使用static变量+工厂构造函数的方式，
> 就可以保证new EventBus()始终返回都是同一个实例，读者应该理解并掌握这种方法。
> 关于组件之间状态共享也有一些专门的包如redux、以及前面介绍过的Provider。
- Notification
1. **通知冒泡**（Notification Bubbling)
> 每一个节点都可以分发通知，通知会沿着当前节点向上传递，
> 所有父节点都可以通过NotificationListener来监听通知
> 通知冒泡和触摸事件冒泡相似，但终止通知冒泡后，通知将不会再向上传递。
> 示例1: 滚动组件使用滚动通知

#### 6/21
> > NotificationListener的泛型引入可以限制监听的事件范围
> > onNotification函数返回布尔值,返回true阻断冒泡,返回false继续向上冒泡
2. 自定义通知
> dispatch原理刨析: Notification.dispatch 可以发起冒泡通知
> dispatch(context)中调用了当前context的visitAncestorElements方法，该方法会从当前Element开始向上遍历父级元素
> visitAncestorElements方法有一个遍历回调参数visitAncestor,会判断每一个遍历到的父级Widget是否是NotificationListener,如果是则调用NotificationListener的_dispatch方法
> 执行onNotification方法

- 动画
1. 动画实现的原理
> 在一段时间内，快速地多次改变UI外观
> 超过16FPS，就比较流畅了，超过32FPS就会非常的细腻平滑
> 超过32FPS，人眼基本上就感受不到差别了
> 理想情况下是可以实现60FPS的，这和原生应用能达到的帧率是基本是持平的
> 为了方便开发者创建动画，不同的UI系统对动画都进行了一些抽象
2. Animation
> addListener(), 监听每一帧变化
> addStatusListener(), 状态改变的监听器(开始、结束、正向或反向)
3. CurvedAnimation可以通过包装AnimationController和Curve生成一个新的动画对象
> 常见的Curves

|  Curves   | 描述  |
|  ----  | ----  |
|linear |	匀速的|
|decelerate |	匀减速|
|ease |	开始加速，后面减速|
|easeIn |	开始慢，后面快|
|easeOut |	开始快，后面慢|
|easeInOut | 开始慢，然后加速，最后再减速|
> 可以自定义 Curves
```
class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return math.sin(t * math.PI * 2);
  }
}
```

#### 6/22
- AnimationController
1. 控制动画
> forward(), stop(), reverse() // 表示启动,停止和反向
> 派生自Animation<double>，因此可以在需要Animation对象的任何地方使用
> 创建一个controller对象
```
final AnimationController controller = new AnimationController( 
 duration: const Duration(milliseconds: 2000), 
 lowerBound: 10.0,
 upperBound: 20.0,
 vsync: this
);
```
2. Ticker
> 其中,vsync是一个TickerProvider对象,用来创建Ticker
> Ticker就是通过SchedulerBinding来添加屏幕刷新回调
> 锁屏时,SchedulerBinding(每次屏幕刷新的回调)不会执行,所以不会执行ticker
3. Tween
> 定义从输入范围到输出范围的映射
- 动画实现
1. 简单实现
> 实例1 (线性放大)
> 实例1 (增加 Curve)
> 实例2 (AnimatedWidget简化)(AnimatedWidget类封装了调用setState()的细节，并允许我们将widget分离出来)
> 实例2 AnimatedBuilder 正是将渲染逻辑分离出来,
> 实例2 实现循环: 动画正向执行结束时反转动画

#### 6/23
- 自定义 路由切换 时的动画
1. `MaterialPageRoute`
> 它可以使用和平台风格一致的路由切换动画,如在iOS上会左右滑动切换，而在Android上会上下滑动切换
> `CupertinoPageRoute`是Cupertino组件库提供的iOS风格的路由切换组件，它实现的就是左右滑动切换。
> `PageRouteBuilder`来实现切换动画
2. 以渐隐渐入动画来实现路由过渡
> 实例 PageRouteBuilder
> `pageBuilder` 有一个属性animation,所以可以实现自定义动画过渡
> `PageRouteBuilder`其实只是PageRoute的一个包装，我们可以直接继承PageRoute类来实现自定义路由
> 实例 PageRouteBuilder > FadeRoute
> 实现: 在打开新路由时应用动画，而在返回时不使用动画
> 实例 PageRouteBuilder > FadeRoute > (修改部分)
- Hero动画(英雄 动画)
1. 指的是可以在两个页面(路由)之前都存在的动画
> 实现: Hero组件将要共享的widget包装起来，并提供一个相同的tag

#### 6/24
> `InkWell` 组件
> 组件在用户点击时出现“水波纹”效果
- 交织动画（Stagger Animation）
1. 由一个动画序列或重叠的动画组成
2. 注意以下几点：
> 要创建交织动画，需要使用多个动画对象（Animation）。
> 一个AnimationController控制所有的动画对象。
> 给每一个动画对象指定时间间隔（Interval）
3. 实例: 柱状图
> dart中extends、 implements、with的用法与区别
> 继承（关键字 extends）
> 混入  mixins （关键字 with）
> 接口实现（关键字 implements）
> 有前后顺序： 
> extens在前，mixins在中间，implements最后；
> extends 规则
子类会继承父类里面可见的属性和方法 但是不会继承构造函数
子类能复写父类的方法 getter和setter
子类重写超类的方法，要用@override
子类调用超类的方法，要用super
子类可以继承父类的非私有变量
> mixins 规则
作为mixins的类只能继承自Object，不能继承其他类
作为mixins的类不能有构造函数
一个类可以mixins多个mixins类
mixins绝不是继承，也不是接口，而是一种全新的特性
> implements 接口实现
(没有interface的,但是Flutter中的每个类都是一个隐式的接口,Flutter中:class 就是 interface)
- `AnimatedSwitcher`
1. 通常在切换(Tab切换、路由切换)时都会指定一个动画，以使切换过程显得平滑
> Flutter SDK组件库中已经提供了一些常用的切换组件，如PageView、TabView等，
> 但是，这些组件并不能覆盖全部的需求场景
2. AnimatedSwitcher 可以同时对其新、旧子元素添加显示、隐藏动画
> 实例 计数器
3. 实现原理
```
Widget _widget; //
void didUpdateWidget(AnimatedSwitcher oldWidget) {
  super.didUpdateWidget(oldWidget);
  // 检查新旧child是否发生变化(key和类型同时相等则返回true，认为没变化)
  if (Widget.canUpdate(widget.child, oldWidget.child)) {
    // child没变化，...
  } else {
    //child发生了变化，构建一个Stack来分别给新旧child执行动画
   _widget= Stack(
      alignment: Alignment.center,
      children:[
        //旧child应用FadeTransition
        FadeTransition(
         opacity: _controllerOldAnimation,
         child : oldWidget.child,
        ),
        //新child应用FadeTransition
        FadeTransition(
         opacity: _controllerNewAnimation,
         child : widget.child,
        ),
      ]
    );
    // 给旧child执行反向退场动画
    _controllerOldAnimation.reverse();
    //给新child执行正向入场动画
    _controllerNewAnimation.forward();
  }
}

//build方法
Widget build(BuildContext context){
  return _widget;
}
```
> 类似海有: AnimatedCrossFade
4. 高级用法
> 实例: MySlideTransition2
***无法实现实例***

#### 6/25
> 实例完成,因为没有写child元素
> > 记录错误: 
```
The relevant error-causing widget was
AnimatedSwitcher
lib\animation\MySlideTransition.dart:49
```
> > 应该是因为没有用child
- 自己封装一个切换动画(任意方向)
> 实例: SlideTransitionX

- 动画过渡组件
1. Widget属性发生变化时会执行过渡动画的组件
2. 特征: 就是它会在内部自管理AnimationController
> 所以: 自己封装一个`AnimationController`可以大大提升 过渡动画的易用性
> 实例: AnimatedDecoratedBox1: decoration属性发生变化时执行一个过渡动画
> ImplicitlyAnimatedWidget类, 用来封装动画
3. Flutter预置的动画过渡组件
> 实例: `AnimatedWidgetsTest`

#### 6/27
- 自定义组件
1. 场景
> flutter提供组件无法满足需求
> 为了共享代码,封装一些公用组件
2. 创建方式
> 通过组合其他组件
> 自绘
> 实现 RenderObject
3. 组合其他组件
> 适用: 自定义组件最简单的方法,优先考虑
> 例如: Container就是一个组合组件(由: DecoratedBox,ConstrainedBox,Transform,Padding,Align组成)
> 思想: 开发就是组合提供的组件实现不同布局
4. 自绘
> 适用: 无法通过现有组件实现需要的ui
> 例如: 实现一个圆形渐变的进度条
> 局限: CircularProgressIndicator的valueColor只支持执行旋转动画时变化Indicator的颜色
> 实现: 通过Flutter中提供的CustomPaint和Canvas来实现UI自绘。
5. RenderObject
> RenderObject是用来渲染文本和图片的,RenderObject.paint抽象方法
> paint方法第一个参数表示上下文(PaintingContext),
> PaintingContext.canvas 就是主要的绘制逻辑
> 区别于自绘(CustomPaint和Canvas),自绘只是为了方便开发者封装的一个代理类

|  组合   | 自绘/RenderObject(通过Canvas)  |
|  ----  | ----  |
| 简单 | 强大灵活，理论上可以实现任何外观的UI |
| 容易 | 必须了解Canvas API细节，并且得自己去实现绘制逻辑 |
- 自定义组件组合
1. 自定义渐变按钮
> 通过组合DecoratedBox和InkWell来实现
> 实例: GradientButton
> 理解代码

2. 抽离出单独的组件注意: 代码规范
> 如: 必要参数要用@required 标注
> 如: 可选参数在特定场景需要判空或设置默认值
> 如: 错误地使用组件时能够兼容或报错提示
> 如: 使用assert断言函数
> 如: 组件更新时是否需要同步状态

3. 增强TurnBox组件
> 功能: 1,任意角度来旋转其子节点;2,过渡动画;3,手动指定动画速度
> 实例: TurnBox

4. 富文本展示组件
> 实例: MyRichText
> 注意: 组件更新时是否需要同步状态
> RichText
> TextSpan: 需要设置属性，不设置无法显示文字

#### 6/28
- 自定义组件-自绘
1. 几乎所有的UI系统都会提供一个自绘UI的接口, Canvas,开发者可以根据api绘制各种图形
> flutter 提供了CustomPaint 结合画笔 CustomPainer 绘制图片
2. CustomPaint
> 如果CustomPaint有子节点
> 将子节点包裹在RepaintBoundary组件
> RepaintBoundary 子组件的绘制将独立于父组件的绘制
```
CustomPaint(
  size: Size(300, 300), //指定画布大小
  painter: MyPainter(),
  child: RepaintBoundary(child:...)), 
)
```
3. CustomPainter
`void paint(Canvas canvas, Size size);`
> Canvas：一个画布，包括各种绘制方法

|  1   | 1 |
|  ----  | ----  |
| API名称 |	功能 |
| drawLine |	画线 |
| drawPoint |	画点 |
| drawPath |	画路径 |
| drawImage |	画图像 |
| drawRect |	画矩形 |
| drawCircle |	画圆 |
| drawOval |	画椭圆 |
| drawArc | 画圆弧 |

> Size  绘制区域大小
4. 画笔Paint
```
var paint = Paint() //创建一个画笔并配置其属性
  ..isAntiAlias = true //是否抗锯齿
  ..style = PaintingStyle.fill //画笔样式：填充
  ..color=Color(0x77cdb175);//画笔颜色
```
5. 性能
> 绘制是比较昂贵的操作
> a: 利用好shouldRepaint返回值
> > 如果绘制依赖外部状态,改变则应返回true来重绘,反之相反
> 实例: CustomPaintRoute
> 实例: 圆形背景渐变进度条

#### 6/29
- 文件操作
1. 都是通过Dart IO库来操作文件的
> IO库包含了文件读写的相关类，它属于Dart语法标准的一部分
> Dart VM下的脚本还是Flutter,都是通过io库来进行操作的
2. 访问app目录
> PathProvider
> 这个插件提供一种平台透明（不分平台）访问设备常用位置
> 支持访问的位置有：

|  缓存(临时目录)   | 
|  ----  | 
|  getTemporaryDirectory()获取临时目录  |
| iOS上，这对应于NSTemporaryDirectory() 返回的值；
| Android上，这是getCacheDir() 返回的值  |

|  文档目录   | 
|  ----  | 
|  etApplicationDocumentsDirectory()来获取应用程序的文档目录 | 
|  只有自己可以访问的文件  | 
|  只有当应用程序被卸载时，系统才会清除该目录  | 
|  在iOS上，这对应于NSDocumentDirectory  | 
|  Android上，这是AppData目录。  | 

|  外部存储目录   | 
|  ----  | 
| getExternalStorageDirectory()来获取外部存储目录  |
| eg: sd卡，（ios不支持）  |


#### 6/30
- 昨天文件操作的补充
> dart io库的操作非常丰富，这里只是讲一些前端最基本的部分，具体自己了解
- HttpClient
1. HttpClient发起请求分为五步
> **第一步：** HttpClient httpClient = new HttpClient();
> **第二步：** HttpClientRequest request = await httpClient.getUrl(uri);
包含Query参数:
```
Uri uri=Uri(scheme: "https", host: "flutterchina.club", queryParameters: {
  "xx":"xx",
  "yy":"dd"
});
```
设置请求header:
`request.headers.add("user-agent", "test");`
携带请求体方法:
```
String payload="...";
request.add(utf8.encode(payload)); 
//request.addStream(_inputStream); //可以直接添加输入流
```
> **第三步：** HttpClientResponse response = await request.close();
返回对象： 
返回一个HttpClientResponse对象，它包含响应头（header）和响应流(响应体的Stream)
> **第四步：** 读取内容 String responseBody = await response.transform(utf8.decoder).join();
> **第五步：** httpClient.close();
关闭client后，通过该client发起的所有请求都会中止。
2. 实例： HttpTestRoute 
> 没有看效果
3. 常见配置参数

| 属性 |	含义 |
|  ----  |  ----  | 
| idleTimeout |	对应请求头中的keep-alive字段值，为了避免频繁建立连接，httpClient在请求结束后会保持连接一段时间，超过这个阈值后才会关闭连接。 |
| connectionTimeout |	和服务器建立连接的超时，如果超过这个值则会抛出SocketException异常。 |
| maxConnectionsPerHost |	同一个host，同时允许建立连接的最大数量。 |
| autoUncompress |	对应请求头中的Content-Encoding，如果设置为true，则请求头中Content-Encoding的值为当前HttpClient支持的压缩算法列表，目前只有"gzip" |
| userAgent |	对应请求头中的User-Agent字段。 |
> 通过HttpClient设置的对整个httpClient都生效，而通过HttpClientRequest设置的只对当前请求生效
4. 其他
> 证书校验其实就是提供一个badCertificateCallback回调
```
String PEM="XXXXX";//可以从文件读取
httpClient.badCertificateCallback=(X509Certificate cert, String host, int port){
  if(cert.pem==PEM){
    return true; //证书一致，则允许发送数据
  }
  return false;
};
```
> findProxy 代理
```
client.findProxy = (uri) {
  // 如果需要过滤uri，可以手动判断
  return "PROXY 192.168.1.2:8888";
};
 ```
如果不需要代理，返回"DIRECT"即可。
· APP开发中，很多时候我们需要抓包来调试
· 抓包软件(如charles)就是一个代理
· 可以将请求发送到我们的抓包软件，我们就可以在抓包软件中看到请求的数据了
> HTTP请求认证
· 用于保护非公开资源
· 如果Http服务器开启了认证，那么用户在发起请求时就需要携带用户凭据
· 如果你在浏览器中访问了启用Basic认证的资源时，浏览就会弹出一个登录框
Basic认证的基本过程
· 客户端发送http请求给服务器，服务器验证该用户是否已经登录验证过了
· 客户端得到响应码后，将用户名和密码进行base64编码（格式为用户名:密码），设置请求头Authorization，继续访问服务器验证用户凭据，如果通过就返回资源内容
· Flutter的HttpClient只支持Basic和Digest两种认证方式（前者只是简单的通过Base64编码（可逆），而后者会进行哈希运算相对来说安全一点点）
· 之外还有：Digest认证、Client认证、Form Based认证等
· 安全起见都应该在Https协议下
> Http认证的方法和属性
· addCredentials： 添加用户凭据

`httpClient.addCredentials(_uri, "admin", new HttpClientBasicCredentials("username","password"), );`
· authenticate： 当服务器需要用户凭据且该用户凭据未被添加时，httpClient会调用此回调,一般这个回调会调用addCredential()来动态添加用户凭证
```
httpClient.authenticate=(Uri url, String scheme, String realm) async{
  if(url.host=="xx.com" && realm=="admin"){
    httpClient.addCredentials(url,
      "admin",
      new HttpClientBasicCredentials("username","pwd"), 
    );
    return true;
  }
  return false;
};
```
· addCredentials()来添加全局凭证

#### 7/1
- Dio http库
1. Dart社区第三方http请求库
> 直接使用HttpClient发起网络请求是比较麻烦
> 涉及到文件上传/下载、Cookie管理等就会非常繁琐
2. 功能
> 支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时等
3. 配置
```
dependencies:
  dio: ^x.x.x #请使用pub上的最新版本
```
> 引入dio 的代码要放在dependencies二级

#### 7/2
- Http分块下载
1. 实例 downloadWithChunks
2. 概念
> HTTP分块下载，也就是断点续传下载，
> 根据HTTP1.1协议（RFC2616）中定义的HTTP头Range和Content-Range字段来控制的： 
> 客户端在HTTP请求头里面指明Range，即开始下载位置 
> 服务端在HTTP响应头里面返回Content-Range，告知下载其实点和范围
3. 好处
> 将文件分为若干个块，然后维护一个下载状态文件用以记录每一个块的状态，
> 这样即使在网络中断后，也可以恢复中断前的状态
4. 实际注意
> 分块大小多少合适？
> 下载到一半的块如何处理？
> 要不要维护一个任务队列？

#### 7/4
- WebSockets
1. 客户端与服务端实时通信而产生的技术
2. 
> [websocket.org提供的测试服务器](http://www.websocket.org/echo.html)
> 1: 连接到WebSocket服务器
> web_socket_channel 提供了 WebSocketChannel 
> 可以监听来自服务器的消息，又可以将消息发送到服务器的方法
> 2: 监听来自服务器的消息
```
new StreamBuilder(
  stream: widget.channel.stream,
  builder: (context, snapshot) {
    return new Text(snapshot.hasData ? '${snapshot.data}' : '');
  },
);
```
> 3:将数据发送到服务器
`channel.sink.add('Hello!');`
> 4:关闭WebSocket连接
`channel.sink.close();`
报错1
***Target of URI doesn't exist***
***表示有包没有配置的pubspec.yaml中***

报错2
***Insecure HTTP is not allowed by platform***
android端
AndroidManifest.xml 文件中修改为
```
<uses-permission android:name="android.permission.INTERNET" />
<application
  android:label="flutter_app_vscode"
  android:usesCleartextTraffic="true"
  android:icon="@mipmap/ic_launcher">
```
3. 扩展
> 1: 之前介绍的Http协议和WebSocket协议都属于应用层协议
> 就是说: 上面说到的http和websocket都是直接使用框架封装好的
> 2: 应用层协议的实现都是通过Socket API来实现的
> 3: 类似的应用层协议还有很多如：SMTP、FTP等
> 4: 高级编程语言中的Socket库其实都是对操作系统的socket API的一个封装
> 5: 如果我们需要 情况一: 自定义协议或者想直接来控制管理网络链接
> 情况二: 我们觉得自带的HttpClient不好用想重新实现一个
> 就需要使用Socket
4. 实例: 简单实现()
```
_request() async{
  //建立连接
  var socket=await Socket.connect("baidu.com", 80);
  //根据http协议，发送请求头
  socket.writeln("GET / HTTP/1.1");
  socket.writeln("Host:baidu.com");
  socket.writeln("Connection:close");
  socket.writeln();
  await socket.flush(); //发送
  //读取返回内容
  _response =await socket.transform(utf8.decoder).join();
  await socket.close();
}
```

- Json转Dart Model类
1. dart:convert中内置的JSON解码器json.decode() 来实现
```
//一个JSON格式的用户列表字符串
String jsonStr='[{"name":"Jack"},{"name":"Rose"}]';
//将JSON字符串转为Dart对象(此处是List)
List items=json.decode(jsonStr);
//输出第一个用户的姓名
print(items[0]["name"]);
```
2. 问题
> 由于json.decode()仅返回一个Map<String, dynamic>，
> 这意味着直到运行时我们才知道值的类型(类型安全、自动补全和最重要的编译时异常)
> 实例 dartModel

报错1
***Unexpected character***
原因可能是字符串格式有问题(这次是因为我多加了一个"")
3. 解决
> **“Json Model化”**
> 通过预定义一些与Json结构对应的Model类
> 在请求到数据后再动态根据数据创建出Model类的实例
> 帖子上看,说就是一个虚拟类
4. 实践
> 通过引入一个简单的模型类(Model class)- User
> 包括: User.fromJson构造函数,用来从一个map构造出一个 User实例 map structure
> 包括: toJson 方法,将 User 实例转化为一个map.
5. 官方的 **son_serializable package**
> 自动化的源代码生成器, 为我们自动处理JSON序列化, 生成JSON序列化模板
> 实例: dartModel2
报错
*** Target of URL hasn't been generated: 'user.g.dart'***
> 这些错误是完全正常的，这是因为Model类的生成代码还不存在。
> 为了解决这个问题，我们必须运行代码生成器来为我们生成序列化模板。
> 有两种运行代码生成器的方法：
> 1: 一次性生成
`flutter packages pub run build_runner build`
> 一个好的建议是将所有Model类放在一个单独的目录下，然后在该目录下执行命令。
> 2: 持续生成
> '_watcher_'
`flutter packages pub run build_runner watch`
> 在项目根目录下运行来启动_watcher_
> 只需启动一次观察器，然后它就会在后台运行，这是安全的。
6. 根据json生成模板
> 1. template.dart 模板的模板
> 2. mo.dart (脚本)它可以根据指定的JSON目录，遍历生成模板
> 如果JSON文件名以下划线“_”开始，则忽略此JSON文件。
> 复杂的JSON对象往往会出现嵌套，我们可以通过特殊标志来手动指定嵌套的对象
> 3. mo.sh (shell)将生成模板和生成model串起来
> 4. 至此，脚本写好了
> 5. 使用:
> 在根目录下新建一个json目录，然后把user.json移进去，
> 然后在lib目录下创建一个models目录，用于保存最终生成的Model类。
> 现在我们只需要一句命令即可生成Model类了:`./mo.sh`

#### 7/5
- 开发Package
1. 通过package可以创建共享的模块化代码
2. Package包括
> 1: pubspec.yaml
> 声明了Package的名称、版本、作者等的元数据文件
> 2: lib 文件夹
> 公开的(public)代码,最少应有一个dart文件
3. Package分类
> 1: Dart包,
> 包含Flutter的特定功能，对Flutter框架具有依赖性，这种包仅用于Flutter
> 2: 插件包,
> 插件包括原生代码
> 包含用Dart代码编写的API，以及针对Android（使用Java或Kotlin）和针对iOS（使用OC或Swift）平台的特定实现
***Flutter的Dart和Dart VM(组件集合)是不同***
- 开发
1. 创建dart 包
> 1: Android Studio：File>New>New Flutter Project 创建一个Package工程
> 2: --template=package 来执行 flutter create 命令来创建
> 两个方法都会生成
> lib/hello.dart：Package的Dart代码
> test/hello_test.dart：Package的单元测试代码。
> (hello是包的的名称,会根据创建时的名称自动生成)
2. 实现package
> 1: 纯Dart包，只需在主lib/<package name>.dart文件内或lib目录中的文件中添加功能即可 。
> 2: 要测试软件包，请在test目录中添加[unit tests](https://flutter.dev/docs/testing#unit-testing)
3. 导入包
`import 'package:utilities/utilities.dart';`
4. 生成文档
> 使用[https://github.com/dart-lang/dartdoc#dartdoc](),为包生成文档. 开发者需要做的就是遵守文档注释语法在代码中添加文档注释，最后使用dartdoc可以直接生成API文档（一个静态网站）
> 文档注释是使用三斜线"
5. 处理包的相互依赖
> 需要将该依赖包添加到pubspec.yaml文件的dependencies部分
```
dependencies:
  url_launcher: ^0.4.2
```
> 使用
`import 'package:url_launcher/url_launcher.dart'`
> android
`android/build.gradle`
```
android {
    // lines skipped
    dependencies {
        provided rootProject.findProject(":url_launcher")
    }
}
```
> 在android/src中使用
`import io.flutter.plugins.urllauncher.UrlLauncherPlugin`
> iOS
`ios/hello.podspec`
```
Pod::Spec.new do |s|
  # lines skipped
  s.dependency 'url_launcher'
```
> 在ios/Classes中使用
`#import "UrlLauncherPlugin.h"`
6. 冲突
> 假设我们想在我们的hello包中使用some_package和other_package
> 并且这两个包都依赖url_launcher，但是依赖的是url_launcher的不同的版本
> 避免这种情况的最好方法是在指定依赖关系时，程序包作者使用版本范围 (opens new window)而不是特定版本
7. 发布Package
> 发布之前，检查pubspec.yaml、README.md以及CHANGELOG.md文件，以确保其内容的完整性和正确性
> 查看是否准备ok
`flutter packages pub publish --dry-run`
> 发布
`flutter packages pub publish`
**代理**
`export all_proxy=socks5://127.0.0.1:1080`

####　7/5
- 插件开发: 平台通道简介
1. “平台特定”或“特定平台”
> **平台**指的就是Flutter应用程序运行的平台
> 完整的Flutter应用程序实际上包括原生代码和Flutter代码两部分
2. platform channel
> Flutter中提供了的一个平台通道
> 1: Flutter APP和原生平台进行通信
> 2: 调用平台能力,如: 蓝牙、相机、GPS等
> 3: lutter本身只是一个UI系统，它本身是无法提供一些系统能力
> 4: 是Flutter插件的底层基础设施
> 5: 灵活的系统(无论在Android上的Java或Kotlin代码中，还是iOS上的ObjectiveC或Swift代码中均可用)
3. 消息传递方式
> 1: 通过platform channel将消息发送到其宿主应用(原生应用)
> 2: 宿主监听平台通道，并接收该消息.
> 3: 然后调用该平台的API，并将响应(如果有数据是异步的)发送回客户端(应用程序的Flutter部分)
4. MethodChannel
> MethodChannel API 可以发送与方法调用相对应的消息
> 在宿主平台上(android 和 ios) 可以接收方法调用并返回结果
> 属于自定义编解码器,类似的还有BasicMessageChannel
5. 获取平台信息
> defaultTargetPlatform 用来获取平台信息
> 是一个枚举
> 使用
`if(defaultTargetPlatform==TargetPlatform.android){ // 是安卓系统，do something }`
> 其他用法
> 假如: 想让我们的APP在所有平台都表现一致
> 比如: 比如希望在所有平台路由切换动画都按照ios平台一致的左右滑动切换风格
> 可以通过显式指定debugDefaultTargetPlatformOverride全局变量的值来指定应用平台
```
debugDefaultTargetPlatformOverride=TargetPlatform.iOS;
print(defaultTargetPlatform); 
```
> 上述代码会输出TargetPlatform.iOS
> defaultTargetPlatform的值也会变为TargetPlatform.iOS

- 开发Flutter插件
1. 介绍
> 获取电池电量的插件
> 我们在Dart中通过getBatteryLevel 调用Android BatteryManager API和iOS device.batteryLevel API
2. 
> 1: 创建一个新的应用程序项目(之前讲的步骤)
> 2: 首先，我们构建通道
> 单个应用中使用的所有通道名称必须是唯一的; 我们建议在通道名称前加一个唯一的“域名前缀”
> 例如samples.flutter.io/battery
> main的state类中加入
`static const platform = const MethodChannel('samples.flutter.io/battery');`
> 接下来，我们调用通道上的方法，指定通过字符串标识符调用方法getBatteryLevel。 
> 该调用可能失败(平台不支持平台API，例如在模拟器中运行时)，
> 我们将invokeMethod调用包装在try-catch语句中。

#### 7/6
- 看懂开发flutter插件
1. 创建flutter应用
2. 创建Flutter平台客户端
> MethodChannel
> _getBatteryLevel
> RaisedButton
3. Android端API实现
复制官方代码无法启动项目

- 原生和Flutter之间如何共享图像的方法`Texture`和`PlatformView`
1. 以及如何在Flutter中嵌套原生组件
2. flutter局限
> 他的平台通道，消息传送不能覆盖所有的应用场景
> 摄像头拍照录视频（如果把图像每一帧都传递到flutter应用，代价非常大：内存和CPU的巨大消耗）
> Flutter提供了一种基于`Texture`的图片数据共享机制。
3. `Texture` 是一个gpu内存将要绘制的图像数据对象
> Flutter engine会将`Texture`的数据在内存中直接进行映射（而无需在原生和Flutter之间再进行数据传递）
> Flutter会给每一个`Texture`分配一个id，同时Flutter中提供了一个`Texture`组件
> `Texture` 组件正是通过textureId与`Texture`数据关联起来
> 整个流程
> 1: 图像数据先在原生部分缓存
> 2: Flutter部分再通过textureId和缓存关联
> 3: 绘制由Flutter完成
4. 如果我们开发插件
> textureId完全可以通过`MethodChannel`来传递。
5. 注意
> 原生摄像头捕获的图像发生变化时，`Texture` 组件会自动重绘，这不需要我们写任何Dart 代码去控制。
- Texture用法
1. Flutter官方提供的相机`camera`插件和视频播放`video_player`插件都是使用Texture来实现的，它们本身就是Texture非常好的示例
2. `camera`包自带的一个示例
> 1: 可以拍照，也可以拍视频，拍摄完成后可以保存；排号的视频可以播放预览。
> 2: 可以切换摄像头（前置摄像头、后置摄像头、其它）
> 3: 可以显示已经拍摄内容的预览图。
3. 看一下`camera`具体代码
> 1: 依赖`camera`插件的最新版
```
pubspec.yaml 
  camera: ^0.5.2+2
```
> 2: 在main方法中获取可用摄像头列表。
```
void main() async {
  // 获取可用摄像头列表，cameras为全局变量
  cameras = await availableCameras();
  runApp(MyApp());
}
```
> 3: 构建UI
> 4： 完整代码(camera.dart)
- `PlatformView` (平台组件)
> 1: 开发过程中需要使用一个原生组件
例如： webview
> 2: 将需要使用原生组件的页面全部用原生实现，在flutter中需要打开该页面时通过消息通道打开这个原生的页面
> 3: Flutter SDK中新增了AndroidView和UIKitView 两个组件，
> 这两个组件的主要功能就是将原生的Android组件和iOS组件嵌入到Flutter的组件树中,能让Flutter共享原生组件
> 4: 由于AndroidView和UIKitView 是和具体平台相关的，所以称它们为`PlatformView`
> 5: 使用Platform View
> 以Flutter官方提供的`webview_flutter`插件为例
> 1: 原生代码中注册要被Flutter嵌入的组件工厂
```
public static void registerWith(Registrar registrar) {
   registrar.platformViewRegistry().registerViewFactory("webview", 
   WebViewFactory(registrar.messenger()));
}
```
> 2: 在Flutter中使用
> 打开flutter中文首页
```
class PlatformViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://flutterchina.club",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
```
> 注意
> 用`PlatformView`的开销是非常大的，因此，如果一个原生组件用Flutter实现的难度不大时，我们应该首选Flutter实现。
- 多语言
1. Flutter SDK已经提供了一些组件和类来帮助我们实现国际化，下面我们来介绍一下Flutter中实现国际化的步骤
> 1: 下面举例`MaterialApp`类为入口的应用来说明如何支持国际化
> 2: 大多数应用程序都是通过`MaterialApp`为入口,`MaterialApp`实际上也是WidgetsApp的一个包装
> 3: 本地化的值和资源指我们针对不同语言准备的不同资源,资源一般是指文案（字符串）
> 4: 默认情况,仅提供美国英语本地化资源
> 要添加对其他语言的支持，应用程序须添加一个名为`flutter_localizations`的包依赖
> 还需要在`MaterialApp`中进行一些配置
2. 使用`flutter_localizations`包
> 1: 添加依赖
```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```
> 2: 下载`flutter_localizations`
> 3: 然后指定MaterialApp的`localizationsDelegates`和`supportedLocales`,
```
import 'package:flutter_localizations/flutter_localizations.dart';

new MaterialApp(
 localizationsDelegates: [
   // 本地化的代理类
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
 ],
 supportedLocales: [
    const Locale('en', 'US'), // 美国英语
    const Locale('zh', 'CN'), // 中文简体
    //其它Locales
  ],
  // ...
)
```
> 1: `localizationsDelegates` 列表中的元素是生成本地化值集合的工厂。
> 2: `GlobalMaterialLocalizations.delegate` 为Material 组件库提供的本地化的字符串和其他值，它可以使Material 组件支持多语言。 
> 3: `GlobalWidgetsLocalizations.delegate` 定义组件默认的文本方向，从左到右或从右到左，这是因为有些语言的阅读习惯并不是从左到右，比如如阿拉伯语就是从右向左的。
> 4: `supportedLocales` 也接收一个Locale数组，表示我们的应用支持的语言列表，在本例中我们的应用只支持美国英语和中文简体两种语言
3. 获取当前区域Locale
> Locale用来标识用户的语言环境的，它包括语言和国家两个标志如

`const Locale('zh', 'CN') `
> 获取应用的当前区域Locale

`Locale myLocale = Localizations.localeOf(context);`
4. 监听系统语言切换
> 切换语言这个过程是隐式完成的
> 可以通过`localeResolutionCallback`或`localeListResolutionCallback`回调来监听locale改变的事件
> `localeResolutionCallback`的回调函数签名：

`Locale Function(Locale locale, Iterable<Locale> supportedLocales)`
> 1: 参数locale的值为当前的当前的系统语言设置
> 2: `supportedLocales` 为当前应用支持的locale列表，是开发者在MaterialApp中通过`supportedLocales`属性注册的。
> 3: 返回值是一个Locale，此Locale为Flutter APP最终使用的Locale。通常在不支持的语言区域时返回一个默认的Locale。

> 使用`localeListResolutionCallback`方法
> 前者接收的是一个Locale列表，而后者接收的是单个Locale

`Locale Function(List<Locale> locales, Iterable<Locale> supportedLocales)`

5. Localization 组件
> 1: 前面提到的Localizations组件用于加载和查找应用当前语言下的本地化值或资源 
> 2: 通过`Localizations.of(context,type)` (opens new window)来引用这些对象
> 3: 如果设备的Locale区域设置发生更改，则Localizations 组件会自动加载新区域的Locale值，然后重新build使用（依赖）了它们的组件，
> 4: 大型应用程序中，不同模块或Package可能会与自己的本地化值捆绑在一起
> 5: Localizations.of()表达式会经常使用，所以MaterialLocalizations类提供了一个便捷方法

```
static MaterialLocalizations of(BuildContext context) {
  return Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
}

// 可以直接调用便捷方法
tooltip: MaterialLocalizations.of(context).backButtonTooltip,
```
> 6. flutter软件包中仅提供美国英语值的`MaterialLocalizations`和`WidgetsLocalizations`接口的实现

#### 7/7
1. 昨天的camera报错,
```
import 'package:camera/camera.dart';
List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}
```
> 重新添加依赖和 把mian文件修改成上面的代码没有报错了
> 参考的[cameras博客](https://blog.csdn.net/qq_39816031/article/details/104486122)

***camera有报错***
> pubspec 引入
```
video_player: ^0.10.11+1
path_provider: ^1.6.9
```
> 接下来尝试打开
> 电脑打开失败
***MissingPluginException (MissingPluginException(No implementation found for method availableCameras on channel plugins.flutter.io/camera))***
> 尝试手机打开
> 没有设备
> 注释了首页的
`  // cameras = await availableCameras();`
> 可以打开
2. 尝试国际化
> 没有想到使用的实际场景

- 实现Localizations
1. `GlobalMaterialLocalizations` 和 `GlobalWidgetsLocalizations` 只是Material组件库的本地化实现，
> 想要让自己的布局支持多语言，那么就需要实现在即的Localizations
2. 开始
> 1: 实现 `Localizations` 类
> `Localizations`类 实现提供了本地化值
> 示例 Localizations
> 2: 实现 `Delegate` 类
> `Delegate`类 在Locale改变时加载新的Locale资源
> `Delegate`类需要继承自LocalizationsDelegate类
> 它有一个load方法
> 示例 Delegate
> shouldReload 方法返回值决定,build时,是否调用load方法重新加载Locale资源
> 一版返回false就好
> 而且,每当Locale改变时Flutter都会再调用load方法加载新的Locale
> 3: 添加多语言支持
> 先注册DemoLocalizationsDelegate类
> 在MaterialApp或WidgetsApp的localizationsDelegates列表中添加
> Delegate实例即可完成注册
> 再通过DemoLocalizations.of(context)来动态获取当前Locale文本
> 接下来我们可以在Widget中使用Locale值
> 示例 (在main文件中添加)
```
return Scaffold(
  appBar: AppBar(
    //使用Locale title  
    title: Text(DemoLocalizations.of(context).title),
  ),
  ... //省略无关代码
)
```
> 当在美国英语和中文简体之间切换系统语言时，APP的标题会自动切换
3. 问题
> 1: 如果我们要支持的语言不是两种而是8种甚至20几种时
> 如果为每个文本属性都要分别去判断到底是哪种Locale从而获取相应语言的文本
> 将会是一件非常复杂的事
> 2: 通常情况下翻译人员并不是开发人员
> 能否可以将翻译单独保存为一个arb文件交由翻译人员去翻译
> 翻译好之后开发人员再通过工具将arb文件转为代码
4. 可以通过Dart intl包来实现这些




































- Intl 的总结
1. 第二步和第一步只在第一次需要，开发的主要工作在第三步
2. 最后两步命令，可以放在shell脚本里面（完成第三步或者完成arb文件翻译后执行）
> 创建intl.sh 文件
> 执行`chmod +x intl.sh`(chmod +x xxx.sh: 表示为xxx文件增加可执行权限)
> 然后就可以执行`./intl.sh`了

- 国际化的常见问题
1. 默认的Locale不是中文简体：
> 非大陆行货渠道买的一些Android和iOS设备，会出现的情况
> 为了防止设备获取的Locale与实际的地区不一致
> app都必须提供一个手动选择语言的入口
2. 对应用标题进行国际化
> MaterialApp有一个title属性来指定APP的标题
> 问题在于： 无法在构建MaterialApp时通过Localizations.of来获取本地化资源
```
MaterialApp(
  title: DemoLocalizations.of(context).title, //不能正常工作！
  localizationsDelegates: [
    // 本地化的代理类
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    DemoLocalizationsDelegate() // 设置Delegate
  ],
);
```
> 1: Localizations.of会从当前的context沿着widget树向顶部查找DemoLocalizations
> 2: 但是实际上DemoLocalizations是在当前context的子树中的
> DemoLocalizations.of(context)会返回null
> 3: 解决办法
> 设置一个onGenerateTitle回调
```
MaterialApp(
  onGenerateTitle: (context){
    // 此时context在Localizations的子树中
    return DemoLocalizations.of(context).title;
  },
  localizationsDelegates: [
    DemoLocalizationsDelegate(),
    ...
  ],
);
```
> 为英语系的国家指定同一个locale
> 1: 提供一种英语（如美国英语）供所有英语系国家使用
> 可以在前面介绍的localeListResolutionCallback中来做兼容：
```
localeListResolutionCallback:
    (List<Locale> locales, Iterable<Locale> supportedLocales) {
  // 判断当前locale是否为英语系国家，如果是直接返回Locale('en', 'US')     
}
```

- 触碰到核心
1. UI系统的含义
> 1: 基于一个平台(操作系统)
> 2: 在该平台实现GUI的一个系统
2. 注意
> 1: 各个平台**UI系统的原理**是相通的
> 2: 无论是Android还是iOS，他们将一个用户界面展示到屏幕的流程是相似的

3: UI系统的原理
> 1: ***屏幕显示图像的基本原理***
> **显示器**
> 显示器由一个个物理显示单元(物理像素点)组成
> 显示器成相原理: 在不同的物理像素点上显示不同的颜色构成完整的图像
> **位色**
> 位色： 是显示器的一个重要指标
> 位色指： 一个像素点能发出的所有颜色总数是2的几次方
> 例如：1600万即2的24次方，称为24位色
> **刷新频率**
> 显示画面 就是： 以固定的频率刷新
> 刷新需要从GPU获取数据
> 每次刷新： 显示器会发出一个垂直同步信号，用来同步CPU、GPU和显示器的
> CPU、GPU和显示器的协作方式: CPU将计算好的显示内容提交给 GPU,GPU渲染后放入帧缓冲区,视频控制器按照同步信号从帧缓冲区取帧数据,并且传递给显示器显示
> (CPU主要用于基本数学和逻辑计算,GPU的主要作用就是确定最终输送给显示器的各个像素点的色值)
> 例如： 一部手机屏幕的刷新频率是 60Hz，就是屏幕就会一秒内发出 60次这样的信号
2: ***操作系统绘制API***
> a： 图形计算和绘制是由相应的硬件来完成
> b： 直接操作硬件的指令通常都会有操作系统屏蔽
> c： 操作系统提供一些封装后的API,供操作系统之上的应用调用
> d:  操作系统提供的API往往比较基础,直接调用比较复杂和低效的,需要了解API的很多细节
> e:  几乎所有关于开发GUI程序的编程语言都会在操作系统之上再封装一层（操作系统原生API封装在一个编程框架和模型中，然后定义一种简单的开发规则来开发GUI应用程序）
> f: **我们所说的“UI”系统,就是指这个**
> g: 

| ui系统 | 被封装的系统 |
|  ----  |  ----  | 
| Android SDK(中：UI描述文件XML+Java操作DOM) |	Android操作系统 |
| UIKit  |	ios操作系统 |
> 3: ***Flutter UI系统***
> Flutter的原理
> a: 使用同一种编程语言开发
> b: 不同操作系统API抽象一个的中间层(Dart API)
> c: 在打包编译时再使用相应的中间层代码
> d: 底层使用OpenGL这种跨平台的绘制库（OpenGL只是操作系统API的一个封装库，相当于直接调用操作系统API）
> 4: ***组合和响应式***
> Flutter UI系统对应用开发者定义的开发标准就是： 组合和响应式
> 理解： Flutter中，一切都是Widget，一个UI界面通过组合其它Widget来实现
> 理解： UI要发生变化时，不去直接修改DOM，而是通过更新状态，让Flutter UI系统来根据新的状态来重新构建UI