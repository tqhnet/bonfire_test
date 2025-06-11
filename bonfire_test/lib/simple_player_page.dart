import 'package:bonfire/bonfire.dart';
import 'package:bonfire_test/human.dart';
import 'package:bonfire_test/melee_enemy.dart';
// import 'package:example/pages/player/simple/human.dart';
import 'package:flutter/widgets.dart';

class SimplePlayerPage extends StatelessWidget {
  const SimplePlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tileSize = 32.0;
    return BonfireWidget(
      map: WorldMapByTiled(
        // WorldMapReader.fromAsset('tiled/punnyworld/simple_map.tmj'),
        WorldMapReader.fromAsset('assets/images/tiled/test/test2.tmj'),
        forceTileSize: Vector2.all(tileSize),
      ),
      playerControllers: [
        Keyboard(),
      ],
      components: [MeleeEnemy(
        position: Vector2(tileSize * 10, tileSize * 10),
      ),
      MeleeEnemy(
        position: Vector2(tileSize * 12, tileSize * 10),
      )
      ],
      player: HumanPlayer(
        position: Vector2(tileSize * 7, tileSize * 6),
      ),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, tileSize, 16),
      ),
      backgroundColor: const Color(0xff20a0b4),
    );
  }
}
