class TeamSelectionPlayers{
  int? playerID;
  String? sportsDataID;
  String? status;
  int? teamID;
  String? team;
  int? jersey;
  String? positionCategory;
  String? position;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? birthCity;
  String? birthState;
  String? birthCountry;
  int? globalTeamID;
  int? height;
  int? weight;

  TeamSelectionPlayers(
      {this.playerID,
        this.sportsDataID,
        this.status,
        this.teamID,
        this.team,
        this.jersey,
        this.positionCategory,
        this.position,
        this.firstName,
        this.lastName,
        this.birthDate,
        this.birthCity,
        this.birthState,
        this.birthCountry,
        this.globalTeamID,
        this.height,
        this.weight});

  TeamSelectionPlayers.fromJson(Map<String, dynamic> json) {
    playerID = json['PlayerID'];
    sportsDataID = json['SportsDataID'];
    status = json['Status'];
    teamID = json['TeamID'];
    team = json['Team'];
    jersey = json['Jersey'];
    positionCategory = json['PositionCategory'];
    position = json['Position'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    birthDate = json['BirthDate'];
    birthCity = json['BirthCity'];
    birthState = json['BirthState'];
    birthCountry = json['BirthCountry'];
    globalTeamID = json['GlobalTeamID'];
    height = json['Height'];
    weight = json['Weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PlayerID'] = this.playerID;
    data['SportsDataID'] = this.sportsDataID;
    data['Status'] = this.status;
    data['TeamID'] = this.teamID;
    data['Team'] = this.team;
    data['Jersey'] = this.jersey;
    data['PositionCategory'] = this.positionCategory;
    data['Position'] = this.position;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['BirthDate'] = this.birthDate;
    data['BirthCity'] = this.birthCity;
    data['BirthState'] = this.birthState;
    data['BirthCountry'] = this.birthCountry;
    data['GlobalTeamID'] = this.globalTeamID;
    data['Height'] = this.height;
    data['Weight'] = this.weight;
    return data;
  }
}