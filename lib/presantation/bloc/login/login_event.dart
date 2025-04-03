abstract class LoginEvent{}

class LoginSubmitted extends LoginEvent{
  final String email;
  final String password;
  LoginSubmitted({required this.email,required this.password});
}
class LoginReset extends LoginEvent{}
class LoginWithGoogle extends LoginEvent{}
class LoginWithX extends LoginEvent{}
class LoginWithFacebook extends LoginEvent{}