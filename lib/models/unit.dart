class IUnit {

  final String F_UNIT_ID;
  final String F_UNIT;
  final String F_REMARK;
  final String F_RECORDER;
  final int F_RECORD_TIME;
  final String F_PROJECT_ID;
  int changed = 0;
  int inserted = 0;

  IUnit(this.F_UNIT_ID,
      this.F_UNIT,
      this.F_REMARK,
      this.F_RECORDER,
      this.F_RECORD_TIME,
      this.F_PROJECT_ID);



  IUnit.fromJson(Map<String, dynamic> json)
      : F_UNIT_ID = json['F_UNIT_ID'],
        F_UNIT = json['F_UNIT'],
        F_REMARK = json['F_REMARK'],
        F_RECORDER = json['F_RECORDER'],
        F_RECORD_TIME= json['F_RECORD_TIME'] as int,
        F_PROJECT_ID= json['F_PROJECT_ID'];

  Map<String, dynamic> toJson() =>
      {
        'F_UNIT_ID ': F_UNIT_ID,
        'F_UNIT': F_UNIT,
        'F_REMARK': F_REMARK,
        'F_RECORD_TIME': F_RECORD_TIME,
        'F_RECORDER': F_RECORDER,
        'F_PROJECT_ID': F_PROJECT_ID,
      };

}