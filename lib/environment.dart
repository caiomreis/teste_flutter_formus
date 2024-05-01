class Enviroment {
  static final Enviroment _singleton = Enviroment._internal();
  factory Enviroment() {
    return _singleton;
  }
  Enviroment._internal();

  static const Map<String, String> _hml = {
    "ENV_NAME": "homolog",
  };

  static const Map<String, String> _prod = {
    "ENV_NAME": "production",
  };

  static String? _envName;

  static bool get isProduction => _envName == 'production';

  static String? get envName => _envName;

  Future<void> load() async {
    if (_hml.length != _prod.length) {
      throw 'production (${_prod.length}) and homolog (${_hml.length}) enviroments MUST have the same key amount';
    }
  }
}
