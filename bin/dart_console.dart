import 'package:dart_console/player.dart' as player;
import 'dart:convert';
import 'dart:io' show File;

void main(List<String> arguments) {
  String content =
      File.fromUri(Uri.parse('./assets/players.json')).readAsStringSync();

  List playerJsonList = jsonDecode(content)['players'] as List;

  List<player.Player> playerList = playerJsonList
      .map((playerJson) => player.Player.fromJson(playerJson))
      .toList();

  for (player.Player currentPlayer in playerList) {
    currentPlayer.display();
  }

  print(
      "Long Range Battle: ${playerList[0].name} vs ${playerList[1].name} - ${playerList[0].battle(playerList[1], player.Player.battleLongRange) ? "WIN" : "LOSE"}");
  print(
      "Mid Range Battle: ${playerList[0].name} vs ${playerList[1].name} - ${playerList[0].battle(playerList[1], player.Player.battleMidRange) ? "WIN" : "LOSE"}");
  print(
      "Drive Battle: ${playerList[0].name} vs ${playerList[1].name} - ${playerList[0].battle(playerList[1], player.Player.battleDrive) ? "WIN" : "LOSE"}");
  //print(content);
}
