import 'package:flutter/material.dart';
import 'package:tetris/game/draw_piece.dart';

class PieceImpl implements DrawPiece {
  final int x;
  final int y;
  final Color color;
  PieceImpl(
      {required this.x,
      required this.y,
      this.color = const Color.fromARGB(255, 64, 148, 251)});
  double size = 0;

  PieceImpl copyWith({int? x, int? y, Color? color}) =>
      PieceImpl(x: x ?? this.x, y: y ?? this.y, color: color ?? this.color);

  @override
  void paint(Canvas canvas, double width, double height) {
    if (width < 360) {
      size = width / 16.0;
    } else {
      size = 360 / 16;
    }
    //print('$x $y');
    canvas.save();
    canvas.translate((-width / 2) + (width - 360) / 2 + 10, 0);
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset((size / 2) * (x * 2 + 1), size / 2 * (y * 2 + 1)),
            width: size,
            height: size),
        Paint()..color = color);
    canvas.restore();
  }

  @override
  String toString() {
    return '$x $y';
  }
}
