import 'dart:async';
import 'package:bonfire/bonfire.dart';
import 'package:bonfire_test/RotatingRedSquares.dart';
import 'package:bonfire_test/shared/person_sprite_sheet1.dart';
import 'package:flutter/material.dart';

// 玩家
class HumanPlayer extends SimplePlayer with BlockMovementCollision {
  late TextPaint _textPaint;
  final String text = 'MeleeEnemy';
  final double width1 = 32;
  HumanPlayer({
    required super.position,
  }) : super(
          animation: PersonSpritesheet().simpleAnimation(),
          size: Vector2.all(32),
          speed: 32,
        );

  @override
  Future<void> onLoad() async {
    size = Vector2.all(width1);
    /// Adds rectangle collision
    add(
      RectangleHitbox(
        size: size / 2,
        position: size / 4,
      ),
    );

    // 添加旋转方块（现在会正确跟随玩家）
    add(RotatingRedSquares(
      parent: this,
      squareCount: 10,
      radius: width1/2, // 半径
    ));
    _addsText();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  void _addsText() {
    _textPaint = TextPaint(
      style: TextStyle(
        fontSize: size.x / 5,
        color: Colors.white,
      ),
    );
    var textSize = _textPaint.getLineMetrics(text).size;
    add(
      TextComponent(
        text: text,
        position: Vector2((textSize.x / -2) + size.x / 2, -2),
        textRenderer: _textPaint,
      ),
    );
  }
}
