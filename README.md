# weather_project

## init

```cmd
## root 폴더에서 실행 시 프로젝트 설치
fvm use 3.27.1
bash bs.sh
```

1. **의미 있는 이름**:
   - 변수, 함수, 클래스 이름은 **존재 이유**, **수행 기능**, **사용 방법**이 명확해야 합니다.
   - 이름만으로 코드의 의도를 파악할 수 있어야 합니다.

2. **단일 책임 원칙 (SRP)**:
   - 함수와 클래스는 **하나의 작업**만 수행해야 합니다.
   - 여러 작업이 섞이면 가독성과 유지보수성이 떨어집니다.

3. **중복 제거**:
   - 코드의 중복은 이해와 수정, 확장을 어렵게 만듭니다.
   - 중복된 코드를 공통된 메서드나 클래스에 통합해야 합니다.

4. **캡슐화**:
   - 내부 구현을 감추고, 필요한 인터페이스만 외부에 노출해야 합니다.
   - 클래스와 메서드의 접근제어를 명확히 설정해야 합니다.

5. **작고 간결한 함수**:
   - 함수는 작고 명확해야 하며, 하나의 작업만 수행해야 합니다.
   - 함수의 길이는 짧을수록 좋고, 추상화 수준을 일관되게 유지해야 합니다.

---

## 개선 전 코드와 개선 후 코드 비교

### 개선 전 코드
```dart
class AuthSignal {
  final SignInUseCase signInUseCase;
  AuthSignal(this.signInUseCase);
  Signal<bool> isLoading = Signal(false);
  Signal<String> error = Signal('');
  Signal<UserEntity?> user = Signal(null);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> handleLogin(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    final success = await signIn(emailController.text, passwordController.text);
    if (success && context.mounted) {
      context.goNamed('home');
    }
  }
  Future<bool> signIn(String email, String password) async {
    isLoading.value = true;
    error.value = '';
    try {
      final result = await signInUseCase(email, password);
      return result.fold((failure) {
        return false;
      }, (userEntity) {
        user.value = userEntity;
        return true;
      });
    } finally {
      isLoading.value = false;
    }
  }
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
  void reset() {
    isLoading.value = false;
    error.value = '';
    user.value = null;
    emailController.clear();
    passwordController.clear();
  }
}
```
### 개선 후 코드
```dart
class AuthSignal {
  final SignInUseCase _signInUseCase;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Signals
  final _isLoading = Signal(false);
  final _error = Signal('');
  final _user = Signal<UserEntity?>(null);

  // Getters
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  Signal<bool> get isLoading => _isLoading;
  Signal<String> get error => _error;
  Signal<UserEntity?> get user => _user;

  AuthSignal(this._signInUseCase);

  Future<void> handleLogin(BuildContext context) async {
    if (!_isFormValid()) return;

    final credentials = _getCredentials();
    final success = await _authenticateUser(credentials);

    if (success && context.mounted) {
      _dispose();
      _navigateToHome(context);
    }
  }

  bool _isFormValid() => _formKey.currentState?.validate() ?? false;

  LoginEntity _getCredentials() => LoginEntity(
        email: _emailController.text,
        password: _passwordController.text,
      );

  Future<bool> _authenticateUser(LoginEntity credentials) async {
    _startLoading();

    try {
      final result = await _signInUseCase(credentials.email, credentials.password);

      return result.fold(
        _handleFailure,
        _handleSuccess,
      );
    } finally {
      _stopLoading();
    }
  }

  void _startLoading() {
    _isLoading.value = true;
    _error.value = '';
  }

  void _stopLoading() {
    _isLoading.value = false;
  }

  bool _handleFailure(Failure failure) => false;

  bool _handleSuccess(UserEntity userEntity) {
    _user.value = userEntity;
    return true;
  }

  void _navigateToHome(BuildContext context) {
    context.goNamed(AppRoutePath.home.name);
  }

  void _dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _resetState();
  }

  void _resetState() {
    _isLoading.value = false;
    _error.value = '';
    _user.value = null;
    _emailController.clear();
    _passwordController.clear();
  }
}

```