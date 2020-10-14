class IRefFeatureType {
  final String F_FEATURE_TYPE;
  final String F_DESCRIPTION;
  IRefFeatureType(this.F_FEATURE_TYPE, this.F_DESCRIPTION);
  IRefFeatureType.fromJson(Map<String, dynamic> json)
      :  F_FEATURE_TYPE = json['F_FEATURE_TYPE'],
        F_DESCRIPTION = json['F_DESCRIPTION'];
}