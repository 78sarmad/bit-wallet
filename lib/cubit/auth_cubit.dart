import 'package:bitcoin_wallet/cubit/auth_progress_cubit.dart';
import 'package:bitcoin_wallet/models/user.dart';
import 'package:bitcoin_wallet/repos/user_repo.dart';
import 'package:bitcoin_wallet/utils/methods.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  final _userRepo = UserRepo();

  gotoLogin(){
    emit(AuthStateInitial());
  }

  gotoRegister(){
    emit(AuthStateRegister());
  }

   gotoHome(){
    emit(AuthStateLoggedIn());
  }

  Future<void> loginUser({@required BuildContext context, @required String email, @required String password}) async{

    try{
      context.bloc<AuthProgressCubit>().emitLoginInProgress();
      await _userRepo.loginUser(email: email, password: password);
      context.bloc<AuthProgressCubit>().emitLoginSuccess();
      gotoHome();
    }
    catch (error){
      context.bloc<AuthProgressCubit>().emitLoginErrors(error);
    }
    finally {
      context.bloc<AuthProgressCubit>().emitInitialState();
    }
    
  }

  Future<void> logoutUser(){
    _userRepo.logoutUser();
    emit(AuthStateInitial());
  }

  Future<void> registerUser({@required BuildContext context, @required AppUser user, @required String password }) async{
    try{
      context.bloc<AuthProgressCubit>().emitRegisterInProgress();
      await _userRepo.registerUser(email: user.email, password: password);
      await _userRepo.createUserProfile(user: user);
      context.bloc<AuthProgressCubit>().emitRegisterSuccess();
      gotoHome();
    }
    catch (error){
      print("Register error: $error");
      context.bloc<AuthProgressCubit>().emitRegisterErrors(error);
    }
    finally {
      context.bloc<AuthProgressCubit>().emitInitialState();
    }
  }

  checkSignedInUser(){
    if(_userRepo.isSignedIn()){
      gotoHome();
    }
    else {
      gotoLogin();
    }
  }

  
}
