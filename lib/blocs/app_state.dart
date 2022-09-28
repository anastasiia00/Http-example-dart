import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:project/models/user_model.dart';

@immutable
abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  UserLoadedState(this.user);

  List<UserModel> user;

  @override
  List<Object?> get props => [user];
}

class UserErrorState extends UserState {
  UserErrorState(this.error);

  String error;

  @override
  List<Object?> get props => [error];
}
