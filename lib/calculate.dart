import 'dart:math' show cos, sqrt, asin;

/// 2点間の距離を使い作成して良いかを判定する関数
bool shouldCreateByTwoPoint(
    double lat1, double lon1, double lat2, double lon2) {
  final calcResult = calculateDistance(lat1, lon1, lat2, lon2);
  if (calcResult <= 1.000) {
    return true;
  }
  return false;
}

/// 2点間の距離を計算する関数
double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const p = 0.017453292519943295;
  const c = cos;
  final a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
