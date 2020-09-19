import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_progress_state.dart';

class AuthProgressCubit extends Cubit<AuthProgressState> {
  AuthProgressCubit() : super(AuthProgressInitial());

  emitInitialState(){
    emit(AuthProgressInitial());
  }

  emitLoginErrors(dynamic error){
    emit(AuthProgressRegisterError(error: error));
  }

  emitLoginInProgress(){
    emit(AuthProgressLogin());
  }

  emitRegisterInProgress(){
    emit(AuthProgressRegister());
  }

  emitRegisterErrors(dynamic error){
    emit(AuthProgressRegisterError(error: error));
  }

  emitRegisterSuccess(){
    emit(AuthProgressRegisterSuccess());
  }

  emitLoginSuccess(){
    emit(AuthProgressLoginSuccess());
  }
}
