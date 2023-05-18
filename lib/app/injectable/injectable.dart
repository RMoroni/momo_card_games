import 'package:get_it/get_it.dart';

import '../navigation/navigator.dart';

final injectable = GetIt.instance;

void setup() {
  // Factories

  //// Repositories
  // injectable.registerFactory<AccountRepository>(() => AccountRepositoryImpl(injectable.get<AccountDatasource>()));
  // injectable.registerFactory<UserRepository>(() => UserRepositoryImpl());

  // //// Use_cases
  // injectable.registerFactory<AccountBalance>(() => const AccountBalance());
  // injectable.registerFactory<GetAccountByUserCredentials>(
  //     () => GetAccountByUserCredentials(injectable.get<AccountRepository>()));
  // injectable.registerFactory<CreateAccountAndUser>(() => CreateAccountAndUser(
  //       injectable.get<AccountRepository>(),
  //     ));

  // Singletons
  injectable.registerLazySingleton<NavigatorInterface>(() => NavigatorImpl());
}
