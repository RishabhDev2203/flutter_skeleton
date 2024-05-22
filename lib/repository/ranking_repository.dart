import 'dart:convert';
import 'package:flutter/services.dart';
import '../dto/ranking_dto.dart';

class RankingRepository {
  RankingDto? rankingDto;

  Future<RankingDto?> getRankingData() async {
    var data = await rootBundle.loadString("assets/flutter.json");
    var  response = json.decode(data);
    rankingDto = RankingDto.fromJson(response);
    return rankingDto;
  }
}
