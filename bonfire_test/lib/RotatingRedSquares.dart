import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

// 旋转的小球
class RotatingRedSquares extends PositionComponent {
  final PositionComponent parent;
  final int squareCount;
  final double radius;
  final double rotationSpeed;
  double _angle = 0;
  final List<Vector2> _squareOffsets = [];
  final Paint _squarePaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill;

  RotatingRedSquares({
    required this.parent,
    this.squareCount = 4,
    this.radius = 48,
    this.rotationSpeed = 1.5,
  }) : super(size: Vector2.all(radius * 2), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    _updateSquareOffsets();
    // 设置初始位置为父组件中心上方1
    position = Vector2(parent.size.x , parent.size.y);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // 跟随父组件移动
    // position = Vector2(parent.size.x / 2, -radius);
    _angle += rotationSpeed * dt;
    _updateSquareOffsets();
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    for (final offset in _squareOffsets) {
      canvas.drawRect(
        Rect.fromCenter(
          center: offset.toOffset(),
          width: 8,
          height: 8,
        ),
        _squarePaint,
      );
    }
  }

  void _updateSquareOffsets() {
    _squareOffsets.clear();
    for (var i = 0; i < squareCount; i++) {
      final angle = _angle + (2 * pi / squareCount) * i;
      _squareOffsets.add(Vector2(
        radius * cos(angle),
        radius * sin(angle),
      ));
    }
  }
}