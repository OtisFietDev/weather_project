# weather_project

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

void dispose() {
  emailController.dispose();
  passwordController.dispose();
}