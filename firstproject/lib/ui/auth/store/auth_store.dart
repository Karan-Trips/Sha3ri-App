
import 'package:flutter_demo_structure/core/api/base_response/base_response.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';


part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {

  @observable
  BaseResponse? logoutResponse;

  @observable
  String? errorMessage;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  _AuthStoreBase();

 @observable
  int currentIndex = 0;

  @observable
  int currentIndex2 = 0;

  @observable
  ObservableSet<int> likedPoets = ObservableSet<int>();

  @observable
  ObservableSet<int> heartedPoets = ObservableSet<int>();

  @action
  void onItemTapped(int index) {
    currentIndex = index;
  }

  @action
  void onPageChanged(int index) {
    currentIndex2 = index;
  }

  @action
  void toggleLike(int index) {
    if (likedPoets.contains(index)) {
      likedPoets.remove(index);
    } else {
      likedPoets.add(index);
    }
  }

  @action
  void toggleHeart(int index) {
    if (heartedPoets.contains(index)) {
      heartedPoets.remove(index);
    } else {
      heartedPoets.add(index);
    }
  }
 
}

final authStore = locator<AuthStore>();
final storage = new FlutterSecureStorage();
