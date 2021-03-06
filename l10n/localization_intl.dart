import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import '../l10n-arb/messages_all.dart'; // 先注释,为了防止报错无法启动项目
// messages_all.dart"文件是通过intl_translation工具从arb文件生成的代码
// 第一次运行生成命令之前，此文件不存在

class DemoLocalizations {
  static initializeMessages(String localeName) {} // 为了防止报错无法启动项目写的,没有任何作用

  static Future<DemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    // initializeMessages()方法和"messages_all.dart"文件一样，是同时生成的。
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new DemoLocalizations();
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }
}

//Locale代理类
class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    // 和上一节示例代码不同，这里我们直接调用DemoLocalizations.load()即可
    return DemoLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
