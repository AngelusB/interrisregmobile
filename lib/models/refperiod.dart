class IRefPeriod{
  final String F_PERIOD;
  final String F_DESCRIPTION;
  IRefPeriod(this.F_PERIOD ,this.F_DESCRIPTION);
  IRefPeriod.fromJson(Map<String, dynamic> json)
      :  F_PERIOD = json['F_PERIOD'],
        F_DESCRIPTION = json['F_DESCRIPTION'];
}