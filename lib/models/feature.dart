
class IFeature {
  final String F_FEATURE_ID;
  final String F_UNIT_ID;
  final String F_FEATURE;
  final int F_DATE_BEGIN;
  final int F_DATE_END;
  final String F_FEATURE_TYPE;
  final String F_BEGIN_PERIOD;
  final String F_END_PERIOD;
  final bool F_REJECTED;
  final String F_Z_BOTTOM;
  final String F_Z_TOP;
  final String F_FEATURE_DEPTH;
  final String F_FEATURE_CONSERVATION;
  final String F_CONTROL;
  final String F_REMARK;
  final String F_RECORDER;
  final int F_RECORD_TIME;
  final String F_PROJECT_ID;

  int changed = 0;
  int inserted = 0;

  IFeature(
      this.F_FEATURE_ID,
      this.F_UNIT_ID,
      this.F_FEATURE,
      this.F_DATE_BEGIN,
      this.F_DATE_END,
      this.F_FEATURE_TYPE,
      this.F_BEGIN_PERIOD,
      this.F_END_PERIOD,
      this.F_REJECTED,
      this.F_Z_BOTTOM,
      this.F_Z_TOP,
      this.F_FEATURE_DEPTH,
      this.F_FEATURE_CONSERVATION,
      this.F_CONTROL,
      this.F_REMARK,
      this.F_RECORDER,
      this.F_RECORD_TIME,
      this.F_PROJECT_ID);



  IFeature.fromJson(Map<String, dynamic> json)
      : F_FEATURE_ID = json['F_FEATURE_ID'],
        F_UNIT_ID = json['F_UNIT_ID'],
        F_FEATURE = json['F_FEATURE'],
        F_DATE_BEGIN = json['F_DATE_BEGIN'] as int,
        F_DATE_END = json['F_END_DATE'] as int,
        F_FEATURE_TYPE = json['F_FEATURE_TYPE'],
        F_BEGIN_PERIOD = json['F_BEGIN_PERIOD'],
        F_END_PERIOD = json['F_END_PERIOD'],
        F_REJECTED = json['F_REJECTED'] == "true" ? true : false,
        F_Z_BOTTOM = json['F_Z_BOTTOM'],
        F_Z_TOP = json['F_Z_TOP'],
        F_FEATURE_DEPTH = json['F_FEATURE_DEPTH'],
        F_FEATURE_CONSERVATION = json['F_FEATURE_CONSERVATION'],
        F_CONTROL = json['F_CONTROL'],
        F_REMARK = json['F_REMARK'],
        F_RECORDER = json['F_RECORDER'],
        F_RECORD_TIME = json['F_RECORD_TIME'] as int,
        F_PROJECT_ID = json['F_PROJECT_ID'];

  // TODO mapping  Map<String, dynamic> toJson() =>
}
