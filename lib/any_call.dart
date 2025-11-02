library;

class AnyCall<R> {
  final R Function(List<dynamic> argList, Map<String, dynamic> argMap) callback;
  final void Function(List<dynamic> argList, Map<String, dynamic> argMap)? before;
  final void Function(R result)? after;
  final Map<String, dynamic> attrs;

  AnyCall({required this.callback, this.before, this.after, Map<String, dynamic>? attrs}) : attrs = attrs ?? {};

  T? getAttr<T>(String key) => attrs[key];

  void setAttr<T>(String key, dynamic value) => attrs[key] = value;

  R call() {
    return invoke([], {});
  }

  //Symbol("x") => x
  String _symbolText(Symbol sym) {
    String s = sym.toString();
    return s.substring(8, s.length - 2);
  }

  @override
  R noSuchMethod(Invocation invocation) {
    List<dynamic> argList = invocation.positionalArguments.toList();
    Map<String, dynamic> argMap = invocation.namedArguments.map((sym, v) {
      return MapEntry(_symbolText(sym), v);
    });
    return invoke(argList, argMap);
  }

  R invoke(List<dynamic> argList, Map<String, dynamic> argMap) {
    before?.call(argList, argMap);
    R r = callback(argList, argMap);
    after?.call(r);
    return r;
  }
}
