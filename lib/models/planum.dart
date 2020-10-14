class IPlanum {
  final String F_PLANUM_ID;
  final String F_UNIT_ID;
  final String F_PLANUM;
  final String F_REMARK;
  final String F_RECORDER;
  final int F_RECORD_TIME;
  final String F_PROJECT_ID;
  final String F_PLANUM_TYPE;
  final String F_BEGIN_DATE;
  final String F_END_DATE;

  int changed = 0;
  int inserted = 0;

  IPlanum(
      this.F_PLANUM_ID,
      this.F_UNIT_ID,
      this.F_PLANUM,
      this.F_REMARK,
      this.F_RECORDER,
      this.F_RECORD_TIME,
      this.F_PROJECT_ID,
      this.F_PLANUM_TYPE,
      this.F_BEGIN_DATE,
      this.F_END_DATE);

  IPlanum.fromJson(Map<String, dynamic> json)
      : F_PLANUM_ID = json['F_PLANUM_ID'],
        F_UNIT_ID = json['F_UNIT_ID'],
        F_PLANUM = json['F_PLANUM'],
        F_REMARK = json['F_REMARK'],
        F_RECORDER = json['F_RECORDER'],
        F_RECORD_TIME = json['F_RECORD_TIME'] as int,
        F_PROJECT_ID = json['F_PROJECT_ID'],
        F_PLANUM_TYPE = json['F_PLANUM_TYPE'],
        F_BEGIN_DATE = json['F_BEGIN_DATE'],
        F_END_DATE = json['F_END_DATE'];

  Map<String, dynamic> toJson() => {
        'F_PLANUM_ID': F_PLANUM_ID,
        'F_UNIT_ID ': F_UNIT_ID,
        'F_PLANUM': F_PLANUM,
        'F_REMARK': F_REMARK,
        'F_RECORD_TIME': F_RECORD_TIME,
        'F_RECORDER': F_RECORDER,
        'F_PROJECT_ID': F_PROJECT_ID,
        'F_PLANUM_TYPE': F_PLANUM_TYPE,
        'F_BEGIN_DATE': F_BEGIN_DATE,
        'F_END_DATE': F_END_DATE,
      };
}
