class LikeRates {
  List<LikeRate> likeRates;

  LikeRates(this.likeRates);

  int count() {
    return likeRates.length;
  }
}

class LikeRate {
  String fieldName;
  String? fieldNickName;
  double rate;

  LikeRate(this.fieldName, this.rate);
}