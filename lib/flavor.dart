enum Environment {
  STAGING,
  UAT,
  PRODUCTION,
}

class BuildConfig {
  static Map<String, dynamic> _config = Map<String, dynamic>();

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.STAGING:
        _config = _Config.stagingConfig;
        break;
      case Environment.PRODUCTION:
        _config = _Config.productionConfig;
        break;
    }
  }

  static bool get debugMode => _config == _Config.stagingConfig;

  static get baseDomain {
    return _config[_Config.baseUrl];
  }
}

class _Config {
  static const baseUrl = 'BaseUrl';

  static Map<String, dynamic> stagingConfig = {
    baseUrl: 'https://api-dev.com',
  };

  static Map<String, dynamic> productionConfig = {
    baseUrl: 'https://api.com',
  };
}
