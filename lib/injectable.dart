import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_project/injectable.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  sl.init();
}
