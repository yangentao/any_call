import 'package:any_call/any_call.dart';
import 'package:test/test.dart';

void main() {
  test("a", () {
    dynamic a = AnyCall<void>(
      callback: (ls, map) {
        print("callback: $ls, $map ");
      },
    );
    a(1, 2, 3, $name: "yang", pos: 100);
  });

  test("b", () {
    dynamic a = AnyCall<String>(
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
    String s = a(1, 2, 3, name: "yang", pos: 100);
    print(s);
  });
}
