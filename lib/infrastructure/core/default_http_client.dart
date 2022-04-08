import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpClientInjectableModule {
  @lazySingleton
  Client get httpClient => RetryClient(Client());
}
