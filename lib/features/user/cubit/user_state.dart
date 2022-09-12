part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();

  @override
  List<Object> get props => [];
}

class UserLoadInProgress extends UserState {
  const UserLoadInProgress();

  @override
  List<Object> get props => [];
}

class UserLoadSuccess extends UserState {
  const UserLoadSuccess(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UserLoadFailure extends UserState {
  const UserLoadFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
