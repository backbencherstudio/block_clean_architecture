import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/auth_api/auth_api_repository.dart';
import 'auth_events.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthApiRepository _repository;

  AuthBloc(this._repository) : super(AuthUnauthenticated()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final success = await _repository.login(event.email, event.password);
        if (success) {
          emit(AuthAuthenticated());
        } else {
          emit(AuthError('Invalid credentials not login'));
        }
      } catch (e) {
        debugPrint('login faield with error $e');
        emit(AuthError('Login failed: ${e.toString()}'));
      }
    });
  }
}
