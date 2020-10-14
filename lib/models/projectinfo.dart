class ProjectInfo {
final String F_PROJECT_ID;
final String F_PROJECT_NAME;
final String F_PROJECT_CODE;

ProjectInfo(this.F_PROJECT_ID ,this.F_PROJECT_NAME, this.F_PROJECT_CODE);


ProjectInfo.fromJson(Map<String, dynamic> json)
: F_PROJECT_ID = json['F_PROJECT_ID'],
      F_PROJECT_NAME = json['F_PROJECT_NAME'],
      F_PROJECT_CODE = json['F_PROJECT_CODE']
;

Map<String, dynamic> toJson() =>
    {
      'F_PROJECT_ID': F_PROJECT_ID,
      'F_PROJECT_NAME':F_PROJECT_NAME,
      'F_PROJECT_CODE':F_PROJECT_CODE,
    };

}