import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_player_model.dart';
import 'my_player_model2.dart';
import 'my_team_modal.dart';

class UniversalController extends GetxController {
  List<MyTeamModel> teams = [];
  List<MyPlayerModel1> players1 = [];
  List<MyPlayerModel2> playersStatistics = [];

//These Methods Will Be Implemented Properly
//Calling APIs And Filling Above Lists

// void fetchTeamList() async {
//   print('FETCH');
//   teams = await ApiService.fetchTeams();
// }
// void fetchPlayerList() async {
//   print('FETCH Player1');
//   players1 = await ApiService.fetchPlayers();
//
//   print('first firstName ' '${players1[0].firstName}');
//   print('first height ' '${players1[0].height}');
//   print('first team ' '${players1[0].team}');
//   print('first teamId ' '${players1[0].teamId}');
//   print('first lastName ' '${players1[0].lastName}');
//   print('first position ' '${players1[0].position}');
//   print('first birthCity ' '${players1[0].birthCity}');
//   print('first birthState ' '${players1[0].birthState}');
//   print('first birthCountry ' '${players1[0].birthCountry}');
//   print('first birthDate ' '${players1[0].birthDate}');
//   print('first college ' '${players1[0].college}');
//   print('first depthChartOrder ' '${players1[0].depthChartOrder}');
//   print('first draftKingsName ' '${players1[0].draftKingsName}');
//   print('first experience ' '${players1[0].experience}');
//   print('first fanDuelName ' '${players1[0].fanDuelName}');
//   print('first fanDuelPlayerId ' '${players1[0].fanDuelPlayerId}');
//   print('first fantasyAlarmPlayerId ' '${players1[0].fantasyAlarmPlayerId}');
//   print('first fantasyDraftName ' '${players1[0].fantasyDraftName}');
//   print('first fantasyDraftPlayerId ' '${players1[0].fantasyDraftPlayerId}');
//   print('first draftKingsPlayerId ' '${players1[0].draftKingsPlayerId}');
//   print('first globalTeamId ' '${players1[0].globalTeamId}');
//   print('first highSchool ' '${players1[0].highSchool}');
//   print('first injuryBodyPart ' '${players1[0].injuryBodyPart}');
//   print('first injuryNotes ' '${players1[0].injuryNotes}');
//   print('first injuryStartDate ' '${players1[0].injuryStartDate}');
//   print('first injuryStatus ' '${players1[0].injuryStatus}');
//   print('first jersey ' '${players1[0].jersey}');
//   print('first nbaDotComPlayerId ' '${players1[0].nbaDotComPlayerId}');
//   print('first photoUrl ' '${players1[0].photoUrl}');
//   print('first playerId ' '${players1[0].playerId}');
//   print('first positionCategory ' '${players1[0].positionCategory}');
//   print('first rotoWirePlayerId ' '${players1[0].rotoWirePlayerId}');
//   print('first salary ' '${players1[0].salary}');
//   print('first sportRadarPlayerId ' '${players1[0].sportRadarPlayerId}');
//   print('first sportsDataId ' '${players1[0].sportsDataId}');
//   print('first rotoworldPlayerId ' '${players1[0].rotoworldPlayerId}');
//   print('first sportsDirectPlayerId ' '${players1[0].sportsDirectPlayerId}');
//   print('first statsPlayerId ' '${players1[0].statsPlayerId}');
//   print('first status ' '${players1[0].status}');
//   print('first usaTodayHeadshotNoBackgroundUpdated ' '${players1[0].usaTodayHeadshotNoBackgroundUpdated}');
//   print('first usaTodayHeadshotNoBackgroundUrl ' '${players1[0].usaTodayHeadshotNoBackgroundUrl}');
//   print('first usaTodayPlayerId ' '${players1[0].usaTodayPlayerId}');
//   print('first usaTodayHeadshotUrl ' '${players1[0].usaTodayHeadshotUrl}');
//   print('first usaTodayHeadshotUpdated ' '${players1[0].usaTodayHeadshotUpdated}');
//   print('first weight ' '${players1[0].weight}');
//   print('first xmlTeamPlayerId ' '${players1[0].xmlTeamPlayerId}');
//   print('first yahooName ' '${players1[0].yahooName}');
//   print('first yahooPlayerId ' '${players1[0].yahooPlayerId}');
// }
// void fetchPlayerStatistics() async {
//   print('FETCH Player1');
//   playersStatistics = await ApiService.fetchPlayerStatistics();
//
//   print('playerId' '${playersStatistics[0].playerId}');
//   print('globalTeamId' '${playersStatistics[0].globalTeamId}');
//   print('position' '${playersStatistics[0].position}');
//   print('teamId' '${playersStatistics[0].teamId}');
//   print('team' '${playersStatistics[0].team}');
//   print('name' '${playersStatistics[0].name}');
//   print('assists' '${playersStatistics[0].assists}');
//   print('assistsPercentage' '${playersStatistics[0].assistsPercentage}');
//   print('blockedShots' '${playersStatistics[0].blockedShots}');
//   print('blocksPercentage' '${playersStatistics[0].blocksPercentage}');
//   print('defensiveRebounds' '${playersStatistics[0].defensiveRebounds}');
//   print('defensiveReboundsPercentage' '${playersStatistics[0].defensiveReboundsPercentage}');
//   print('doubleDoubles' '${playersStatistics[0].doubleDoubles}');
//   print('effectiveFieldGoalsPercentage' '${playersStatistics[0].effectiveFieldGoalsPercentage}');
//   print('fantasyPoints' '${playersStatistics[0].fantasyPoints}');
//   print('fantasyPointsDraftKings' '${playersStatistics[0].fantasyPointsDraftKings}');
//   print('fantasyPointsFantasyDraft' '${playersStatistics[0].fantasyPointsFantasyDraft}');
//   print('fantasyPointsFanDuel' '${playersStatistics[0].fantasyPointsFanDuel}');
//   print('fantasyPointsYahoo' '${playersStatistics[0].fantasyPointsYahoo}');
//   print('fieldGoalsAttempted' '${playersStatistics[0].fieldGoalsAttempted}');
//   print('fieldGoalsMade' '${playersStatistics[0].fieldGoalsMade}');
//   print('fieldGoalsPercentage' '${playersStatistics[0].fieldGoalsPercentage}');
//   print('freeThrowsAttempted' '${playersStatistics[0].freeThrowsAttempted}');
//   print('freeThrowsMade' '${playersStatistics[0].freeThrowsMade}');
//   print('freeThrowsPercentage' '${playersStatistics[0].freeThrowsPercentage}');
//   print('games' '${playersStatistics[0].games}');
//   print('isClosed' '${playersStatistics[0].isClosed}');
//   print('lineupConfirmed' '${playersStatistics[0].lineupConfirmed}');
//   print('lineupStatus' '${playersStatistics[0].lineupStatus}');
//   print('minutes' '${playersStatistics[0].minutes}');
//   print('offensiveRebounds' '${playersStatistics[0].offensiveRebounds}');
//   print('offensiveReboundsPercentage' '${playersStatistics[0].offensiveReboundsPercentage}');
//   print('personalFouls' '${playersStatistics[0].personalFouls}');
//   print('playerEfficiencyRating' '${playersStatistics[0].playerEfficiencyRating}');
//   print('plusMinus' '${playersStatistics[0].plusMinus}');
//   print('points' '${playersStatistics[0].points}');
//   print('rebounds' '${playersStatistics[0].rebounds}');
//   print('season' '${playersStatistics[0].season}');
//   print('seasonType' '${playersStatistics[0].seasonType}');
//   print('seconds' '${playersStatistics[0].seconds}');
//   print('started' '${playersStatistics[0].started}');
//   print('statId' '${playersStatistics[0].statId}');
//   print('steals' '${playersStatistics[0].steals}');
//   print('stealsPercentage' '${playersStatistics[0].stealsPercentage}');
//   print('threePointersAttempted' '${playersStatistics[0].threePointersAttempted}');
//   print('threePointersMade' '${playersStatistics[0].threePointersMade}');
//   print('threePointersPercentage' '${playersStatistics[0].threePointersPercentage}');
//   print('totalReboundsPercentage' '${playersStatistics[0].totalReboundsPercentage}');
//   print('tripleDoubles' '${playersStatistics[0].tripleDoubles}');
//   print('trueShootingAttempts' '${playersStatistics[0].trueShootingAttempts}');
//   print('trueShootingPercentage' '${playersStatistics[0].trueShootingPercentage}');
//   print('turnovers' '${playersStatistics[0].turnovers}');
//   print('turnOversPercentage' '${playersStatistics[0].turnOversPercentage}');
//   print('twoPointersAttempted' '${playersStatistics[0].twoPointersAttempted}');
//   print('twoPointersMade' '${playersStatistics[0].twoPointersMade}');
//   print('twoPointersPercentage' '${playersStatistics[0].twoPointersPercentage}');
//   print('updated' '${playersStatistics[0].updated}');
//   print('usageRatePercentage' '${playersStatistics[0].usageRatePercentage}');
// }
}
