#### 这是我的第一个flutter项目,我想通过项目实战来学习这一门技术,项目实战的地址(https://book.flutterchina.club/);
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
- 下载安装flutter, android studio,
- 配置插件
- 在 android studio 和 vscode 分别使用flutter创建一个空项目

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