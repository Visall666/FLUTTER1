class CustomDuration {
  final int _milliseconds;

  CustomDuration.fromMilliseconds(this._milliseconds);

  CustomDuration.fromHours(int hours)
      : _milliseconds = hours * 60 * 60 * 1000; 

  CustomDuration.fromMinutes(int minutes)
      : _milliseconds = minutes * 60 * 1000; 

  CustomDuration.fromSeconds(int seconds)
      : _milliseconds = seconds * 1000; 

  int get inMilliseconds => _milliseconds;
  double get inSeconds => _milliseconds / 1000;
  double get inMinutes => _milliseconds / (1000*60); 
  double get inHours => _milliseconds / (1000*60*60); 

  //  Compare two durations, returning true if one duration is greater than the other.
  bool operator >(CustomDuration other) {
    return _milliseconds > other._milliseconds;
  }

  //  Add two durations, returning a new CustomDuration object.
  CustomDuration operator +(CustomDuration other) {
    return CustomDuration.fromMilliseconds(_milliseconds + other._milliseconds);
  }

  //  Minus two durations, returning a new CustomDuration object (if possible)
  CustomDuration operator -(CustomDuration other) {
    final result = _milliseconds - other._milliseconds;
    if(result < 0) {
      throw ArgumentError("Duration cannot be negative ");
    }
    return CustomDuration.fromMilliseconds(result);
  }

  @override toString() => "$_milliseconds";
}

void main() {
  var d1 = CustomDuration.fromHours(2);
  var d2 = CustomDuration.fromMinutes(60);

  print(d1 > d2);
  var sum = d1 + d2;
  print(sum.inHours);
}