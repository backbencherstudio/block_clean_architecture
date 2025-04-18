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
        debugPrint('Login successful $success');
        if (success) {
          debugPrint('Login successful $success');
          emit(AuthAuthenticated());
        } else {
          debugPrint('Login fail');
          throw Exception('Invalid credentials');
        }
      } catch (e) {
        debugPrint('Login faile $e');
        emit(AuthError(e.toString()));
      }
    });
  }
}
