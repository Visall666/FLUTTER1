enum Direction { north, east, south, west }
 
void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  for (var dir in instructions.split('')) {
    switch (dir) {
      case 'R':
        direction = turnRight(direction);
        break;
      case 'L':
        direction = turnLeft(direction);
        break;
      case 'A':
        var newPosition = advance(x, y, direction);
        x = newPosition[0];
        y = newPosition[1];
        break;
    }
  }
  
  // Print the final position and direction
  print("Final position: {$x, $y}");
  print("Facing: ${direction.name.toUpperCase()}");
}

Direction turnRight(Direction dir) {
  switch (dir) {
    case Direction.north:
      return Direction.east;
    case Direction.east:
      return Direction.south;
    case Direction.south:
      return Direction.west;
    case Direction.west:
      return Direction.north;
    }
  }

  Direction turnLeft(Direction dir) {
  switch (dir) {
    case Direction.north:
      return Direction.west;
    case Direction.west:
      return Direction.south;
    case Direction.south:
      return Direction.east;
    case Direction.east:
      return Direction.north;
    }
  }

  List<int> advance(int x, int y, Direction dir) {
    switch (dir) {
      case Direction.north:
        return [x, y + 1];
      case Direction.south:
        return [x, y - 1];
      case Direction.east:
        return [x + 1, y];
      case Direction.west:
        return [x - 1, y];
    }
  }