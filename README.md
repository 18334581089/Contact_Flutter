
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