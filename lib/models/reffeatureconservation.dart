class IRefFeatureConservation {
  final String F_FEATURE_CONSERVATION;
  final String F_DESCRIPTION;
  IRefFeatureConservation(this.F_FEATURE_CONSERVATION, this.F_DESCRIPTION);
  IRefFeatureConservation.fromJson(Map<String, dynamic> json)
      :  F_FEATURE_CONSERVATION  = json['F_FEATURE_CONSERVATION'],
        F_DESCRIPTION = json['F_DESCRIPTION'];
}