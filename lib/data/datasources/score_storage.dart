import 'package:shared_preferences/shared_preferences.dart';

class ScoreStorage {
  static const String wonKey = "won";
  static const String lostKey = "lost";

  Future<Map<String, int>> loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "won": prefs.getInt(wonKey) ?? 0,
      "lost": prefs.getInt(lostKey) ?? 0,
    };
  }

  Future<void> saveScores(int won, int lost) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(wonKey, won);
    await prefs.setInt(lostKey, lost);
  }

  Future<void> resetScores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(wonKey, 0);
    await prefs.setInt(lostKey, 0);
  }
}
