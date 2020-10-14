class IUser {
  final String F_PERSON_ID;
  final String F_PERSON;
  final String F_USERNAME;
  final String F_PASSWORD;

  IUser(this.F_PERSON_ID, this.F_PERSON, this.F_USERNAME, this.F_PASSWORD);

IUser.fromJson(Map<String, dynamic> json)
: F_PERSON_ID = json['F_PERSON_ID'],
F_PERSON = json['F_PERSON'],
F_USERNAME = json['F_USERNAME'],
F_PASSWORD = json['F_PASSWORD']
;

Map<String, dynamic> toJson() =>
    {
      'F_PERSON_ID ': F_PERSON_ID ,
      'F_PERSON':F_PERSON,
      'F_USERNAME':F_USERNAME,
      'F_PASSWORD':F_PASSWORD,
    };

}

//{"F_PASSWORD":"hello","F_PERSON":"Victor","F_PERSON_ID":"AHQJCAXPKNL","F_USERNAME":"Victor"}]