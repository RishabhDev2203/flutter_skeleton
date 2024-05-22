// To parse this JSON data, do
//
//     final rankingDto = rankingDtoFromJson(jsonString);

import 'dart:convert';

RankingDto rankingDtoFromJson(String str) => RankingDto.fromJson(json.decode(str));

String rankingDtoToJson(RankingDto data) => json.encode(data.toJson());

class RankingDto {
  int? statusCode;
  ResponseData? responseData;

  RankingDto({
    this.statusCode,
    this.responseData,
  });

  factory RankingDto.fromJson(Map<String, dynamic> json) => RankingDto(
    statusCode: json["statusCode"],
    responseData: json["responseData"] == null ? null : ResponseData.fromJson(json["responseData"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "responseData": responseData?.toJson(),
  };
}

class ResponseData {
  String? message;
  Result? result;

  ResponseData({
    this.message,
    this.result,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    message: json["message"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result?.toJson(),
  };
}

class Result {
  List<Team>? odiTeams;
  List<Team>? testTeams;
  List<Team>? t20Teams;
  List<OdiAllRounder>? odiBatsman;
  List<OdiAllRounder>? odiBowler;
  List<OdiAllRounder>? odiAllRounder;
  List<OdiAllRounder>? testBatsman;
  List<OdiAllRounder>? testBowler;
  List<OdiAllRounder>? testAllRounder;
  List<OdiAllRounder>? t20Batsman;
  List<OdiAllRounder>? t20Bowler;
  List<OdiAllRounder>? t20AllRounder;

  Result({
    this.odiTeams,
    this.testTeams,
    this.t20Teams,
    this.odiBatsman,
    this.odiBowler,
    this.odiAllRounder,
    this.testBatsman,
    this.testBowler,
    this.testAllRounder,
    this.t20Batsman,
    this.t20Bowler,
    this.t20AllRounder,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    odiTeams: json["odiTeams"] == null ? [] : List<Team>.from(json["odiTeams"]!.map((x) => Team.fromJson(x))),
    testTeams: json["testTeams"] == null ? [] : List<Team>.from(json["testTeams"]!.map((x) => Team.fromJson(x))),
    t20Teams: json["t20Teams"] == null ? [] : List<Team>.from(json["t20Teams"]!.map((x) => Team.fromJson(x))),
    odiBatsman: json["odiBatsman"] == null ? [] : List<OdiAllRounder>.from(json["odiBatsman"]!.map((x) => OdiAllRounder.fromJson(x))),
    odiBowler: json["odiBowler"] == null ? [] : List<OdiAllRounder>.from(json["odiBowler"]!.map((x) => OdiAllRounder.fromJson(x))),
    odiAllRounder: json["odiAllRounder"] == null ? [] : List<OdiAllRounder>.from(json["odiAllRounder"]!.map((x) => OdiAllRounder.fromJson(x))),
    testBatsman: json["testBatsman"] == null ? [] : List<OdiAllRounder>.from(json["testBatsman"]!.map((x) => OdiAllRounder.fromJson(x))),
    testBowler: json["testBowler"] == null ? [] : List<OdiAllRounder>.from(json["testBowler"]!.map((x) => OdiAllRounder.fromJson(x))),
    testAllRounder: json["testAllRounder"] == null ? [] : List<OdiAllRounder>.from(json["testAllRounder"]!.map((x) => OdiAllRounder.fromJson(x))),
    t20Batsman: json["t20Batsman"] == null ? [] : List<OdiAllRounder>.from(json["t20Batsman"]!.map((x) => OdiAllRounder.fromJson(x))),
    t20Bowler: json["t20Bowler"] == null ? [] : List<OdiAllRounder>.from(json["t20Bowler"]!.map((x) => OdiAllRounder.fromJson(x))),
    t20AllRounder: json["t20AllRounder"] == null ? [] : List<OdiAllRounder>.from(json["t20AllRounder"]!.map((x) => OdiAllRounder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "odiTeams": odiTeams == null ? [] : List<dynamic>.from(odiTeams!.map((x) => x.toJson())),
    "testTeams": testTeams == null ? [] : List<dynamic>.from(testTeams!.map((x) => x.toJson())),
    "t20Teams": t20Teams == null ? [] : List<dynamic>.from(t20Teams!.map((x) => x.toJson())),
    "odiBatsman": odiBatsman == null ? [] : List<dynamic>.from(odiBatsman!.map((x) => x.toJson())),
    "odiBowler": odiBowler == null ? [] : List<dynamic>.from(odiBowler!.map((x) => x.toJson())),
    "odiAllRounder": odiAllRounder == null ? [] : List<dynamic>.from(odiAllRounder!.map((x) => x.toJson())),
    "testBatsman": testBatsman == null ? [] : List<dynamic>.from(testBatsman!.map((x) => x.toJson())),
    "testBowler": testBowler == null ? [] : List<dynamic>.from(testBowler!.map((x) => x.toJson())),
    "testAllRounder": testAllRounder == null ? [] : List<dynamic>.from(testAllRounder!.map((x) => x.toJson())),
    "t20Batsman": t20Batsman == null ? [] : List<dynamic>.from(t20Batsman!.map((x) => x.toJson())),
    "t20Bowler": t20Bowler == null ? [] : List<dynamic>.from(t20Bowler!.map((x) => x.toJson())),
    "t20AllRounder": t20AllRounder == null ? [] : List<dynamic>.from(t20AllRounder!.map((x) => x.toJson())),
  };
}

class OdiAllRounder {
  String? playerName;
  int? position;
  int? points;
  String? team;
  int? matchType;
  int? playerType;
  int? status;

  OdiAllRounder({
    this.playerName,
    this.position,
    this.points,
    this.team,
    this.matchType,
    this.playerType,
    this.status,
  });

  factory OdiAllRounder.fromJson(Map<String, dynamic> json) => OdiAllRounder(
    playerName: json["player_name"],
    position: json["position"],
    points: json["points"],
    team: json["team"],
    matchType: json["match_type"],
    playerType: json["player_type"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "player_name": playerName,
    "position": position,
    "points": points,
    "team": team,
    "match_type": matchType,
    "player_type": playerType,
    "status": status,
  };
}

class Team {
  String? teamName;
  int? position;
  int? points;
  int? rating;
  int? matches;
  int? matchType;
  int? status;

  Team({
    this.teamName,
    this.position,
    this.points,
    this.rating,
    this.matches,
    this.matchType,
    this.status,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamName: json["team_name"],
    position: json["position"],
    points: json["points"],
    rating: json["rating"],
    matches: json["matches"],
    matchType: json["match_type"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "team_name": teamName,
    "position": position,
    "points": points,
    "rating": rating,
    "matches": matches,
    "match_type": matchType,
    "status": status,
  };
}
