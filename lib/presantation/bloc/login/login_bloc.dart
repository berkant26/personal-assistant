import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_kid/presantation/bloc/login/login_event.dart';
import 'package:my_kid/presantation/bloc/login/login_state.dart';


class LoginBloc  extends Bloc<LoginEvent,LoginState>
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  LoginBloc() : super(LoginInitial()){
    on<LoginWithGoogle>(_onLoginWithGoogle);
    on<LoginWithFacebook>(_onLoginWithFacebook);
    on<LoginWithX>(_onLoginWithX);
  }

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginSubmitted){
      yield LoginLoading();
      try {
        await Future.delayed(Duration(seconds: 3));
        yield LoginSuccess();
      } catch (e) {
        yield LoginFailure(errorMessage: e.toString());
      }
    }
    else if (event is LoginReset)
    {
      yield LoginInitial();
    }

  }

Future<void> _onLoginWithFacebook(
      LoginWithFacebook event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final facebookAuthProvider = FacebookAuthProvider();
      //final UserCredential userCredential =
          await _auth.signInWithPopup(facebookAuthProvider);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(errorMessage: error.toString()));
    }
  }
  
   Future<void> _onLoginWithGoogle(
      LoginWithGoogle event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errorMessage: 'Google Sign-In cancelled'));
      }
    } catch (error) {
      emit(LoginFailure(errorMessage: error.toString()));
    }
  }

  Future<void> _onLoginWithX(
      LoginWithX event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final twitterAuthProvider = TwitterAuthProvider();
      final UserCredential userCredential =
          await _auth.signInWithPopup(twitterAuthProvider); // Example usage
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(errorMessage: error.toString()));
    }
  }
}