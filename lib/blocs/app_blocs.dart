import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/blocs/app_events.dart';
import 'package:project/blocs/app_state.dart';
import 'package:project/repository/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepoitory _userRepoitory;

  UserBloc(this._userRepoitory) : super(UserLoadingState()) {
    on<LoadUserEvent>(((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepoitory.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    }));
  }
}
