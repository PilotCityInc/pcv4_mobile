import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';
import 'package:pcv4_mobile/injection.config.dart';

final getIt = GetIt.instance;

class Env {
  static const prod = 'prod';
  static const dev = 'dev';
}

@InjectableInit()
void configureDependencies(String env) => $initGetIt(getIt, environment: env);
