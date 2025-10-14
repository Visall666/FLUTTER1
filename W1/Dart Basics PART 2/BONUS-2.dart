bool isBalanced(String input) {
  // Stack to keep track of opening brackets
  List<String> stack = [];

  // Map of matching pairs
  Map<String, String> matching = {
    ')': '(',
    ']': '[',
    '}': '{',
  };

  for (var char in input.split('')) {
    if (char == '(' || char == '[' || char == '{') {
      stack.add(char);
    } else if (char == ')' || char == ']' || char == '}') {
      if (stack.isEmpty || stack.last != matching[char]) {
        return false;
      }
      stack.removeLast();
    }
  }

  return stack.isEmpty;
}

void main() {
  List<String> inputs = [
    "{what is (42)}?",
    "[text}",
    "{[[(a)b]c]d}"
  ];

  for (var input in inputs) {
    print("$input → ${isBalanced(input) ? 'Balanced' : 'Not balanced'}");
  }
}
