import 'package:authentication_sysytem/Repostory/Modelclass/SignInModelClass.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repostory/Api/Api_main.dart';
import '../../Ui/Toastmessage.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  late SignInModelClass signInModelClass;
  AuthenticationApi authenticationApi = AuthenticationApi();
  SignInBloc() : super(SignInInitial()) {
    on<FetchSignInEvent>((event, emit) async {
      emit(SignInBlocLoading());
      try {
        signInModelClass = await authenticationApi.getsignin(
            event.email,
            event.password);
        emit(SignInBlocLoaded());
      }
      catch (error) {
        ToastMessage().toastmessage(message: error.toString());
        emit(SignInBlocError());
      }
      // TODO: implement event handler
    });
    // TODO: implement event handler
  }
}
