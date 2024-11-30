import 'package:authentication_sysytem/Repostory/Api/Api_main.dart';
import 'package:authentication_sysytem/Repostory/Modelclass/SignUpModelClass.dart';
import 'package:authentication_sysytem/Ui/Toastmessage.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late SignUpModelClass signUpModelClass;
  AuthenticationApi authenticationApi = AuthenticationApi();

  SignUpBloc() : super(SignUpInitial()) {
    on<FetchSignupEvent>((event, emit) async {
      emit(SignupBlocLoading());
      try {
        signUpModelClass = await authenticationApi.getsignup(
            event.name, event.email, event.state, event.city, event.locality,
            event.password);
        emit(SignupBlocLoaded());
      }
      catch (error) {
      ToastMessage().toastmessage(message: error.toString());
        emit(SignupBlocError());
      }
      // TODO: implement event handler
    });
    // TODO: implement event handler
  }
}


