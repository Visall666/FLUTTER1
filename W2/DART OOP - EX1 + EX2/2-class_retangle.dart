class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);

  @override
  String toString() {
    return "($x, $y)";
  }

  Point translate(int dx, int dy) {
    return Point(this.x + dx, this.y + dy);
  }
}

// void main() {
//   const p1 = Point(3, 4);
//   final p2 = p1.translate(1, 2);

//   print(p1); 
// }
