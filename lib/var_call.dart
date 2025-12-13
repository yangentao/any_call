class VarCall<R> {
  final R Function(List<dynamic> list, Map<String, dynamic> map) callback;

  VarCall(this.callback);

  R call() {
    return callback([], {});
  }

  //Symbol("x") => x
  String _symbolText(Symbol sym) {
    String s = sym.toString();
    return s.substring(8, s.length - 2);
  }

  @override
  R noSuchMethod(Invocation invocation) {
    List<dynamic> list = invocation.positionalArguments.toList();
    Map<String, dynamic> map = invocation.namedArguments.map((sym, v) {
      return MapEntry(_symbolText(sym), v);
    });
    return callback(list, map);
  }
}
