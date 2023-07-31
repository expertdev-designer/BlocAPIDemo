abstract class SignInEvent{}
class SignInTextChangesEvent extends SignInEvent{
  final String emailValue;
  final String passwordValue;
  SignInTextChangesEvent(this.emailValue,this.passwordValue);
}

class SignInSubmittedEvent extends SignInEvent{
  final String email;
  final String password;
  SignInSubmittedEvent(this.email,this.password);
}