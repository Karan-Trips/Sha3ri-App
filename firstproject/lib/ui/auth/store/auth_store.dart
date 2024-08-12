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
  @observable
  String selectedLanguage = 'en';
  @observable
  String selectedLanguageName = 'English';
  _AuthStoreBase();
  @observable
  ObservableSet<int> selectedTokens = ObservableSet<int>();

  @action
  void toggleSelection(int index) {
    if (selectedTokens.contains(index)) {
      selectedTokens.remove(index);
    } else {
      selectedTokens.add(index);
    }
  }

  @observable
  int currentIndex = 0;

  @observable
  int currentIndex2 = 0;
  @observable
  bool isCurrentPasswordVisible = false;

  @observable
  bool isNewPasswordVisible = false;

  @observable
  bool isConfirmPasswordVisible = false;

  @observable
  ObservableSet<int> likedPoets = ObservableSet<int>();

  @observable
  ObservableSet<int> heartedPoets = ObservableSet<int>();
  @observable
  int selectedValue = 0;

  @action
  void selectRadio(int value) {
    selectedValue = value;
  }

  @action
  void toggleCurrentPasswordVisibility() {
    isCurrentPasswordVisible = !isCurrentPasswordVisible;
  }

  @action
  void toggleNewPasswordVisibility() {
    isNewPasswordVisible = !isNewPasswordVisible;
  }

  @action
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
  }

  @action
  void onItemTapped(int index) {
    currentIndex = index;
  }

  @action
  void changeLanguage(String languageCode, String languageName) {
    selectedLanguage = languageCode;
    selectedLanguageName = languageName;
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
