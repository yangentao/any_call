import 'package:any_call/any_call.dart';

void main() {
  dynamic a = AnyCall<void>(
    callback: (ls, map) {
      print("callback: $ls, $map ");
    },
  );
  a(1, 2, 3, $name: "yang", pos: 100);
  //output:  callback: [1, 2, 3], {$name: yang, pos: 100}

  dynamic b = AnyCall<String>(
    callback: (ls, map) {
      return "callback: $ls, $map ";
    },
    before: (ls, map) {
      print("before");
    },
    after: (s) {
      print("after: $s");
    },
  );
  String s = b(1, 2, 3, name: "yang", pos: 100);
  print(s);

  //outputs:
  // before
  // after: callback: [1, 2, 3], {name: yang, pos: 100}
  // callback: [1, 2, 3], {name: yang, pos: 100}
}
