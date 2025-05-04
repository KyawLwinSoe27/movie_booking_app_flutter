class BannerModel {
  final String? url;

  BannerModel({this.url});

  // From JSON factory method
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      url: json['url'] as String?,
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
