import 'package:shared_preferences/shared_preferences.dart';

class SessionData {
  static List<String> favList = [];
  static Future<void> setDataSession({required String title}) async {
    if (!favList.contains(title)) {
      favList.add(title);
      SharedPreferences spObj = await SharedPreferences.getInstance();
      spObj.setStringList("favs_articles", favList);
      await getDataSession();
    }
  }

  static Future<void> removeDataSession({required String title}) async {
    if (favList.contains(title)) {
      favList.remove(title);
      SharedPreferences spObj = await SharedPreferences.getInstance();
      spObj.setStringList("favs_articles", favList);
      await getDataSession();
    }
  }

  static Future<void> getDataSession() async {
    SharedPreferences spObj = await SharedPreferences.getInstance();
    favList = spObj.getStringList("favs_articles") ?? [];
  }
}
