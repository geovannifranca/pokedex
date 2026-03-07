import 'package:mobx/mobx.dart';

part 'home_screen.store.g.dart';

class HomeScrennStore = HomeScrennStoreBase with _$HomeScrennStore;

abstract class HomeScrennStoreBase with Store {
  HomeScrennStoreBase();
}
