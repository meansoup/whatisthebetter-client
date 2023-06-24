class LikeRates {
  List<LikeRate> likeRates;

  LikeRates(this.likeRates);

  int count() {
    return likeRates.length;
  }
}

class LikeRate {
  String fieldName;
  double rate;

  LikeRate(this.fieldName, this.rate);
}